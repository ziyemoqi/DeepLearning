package com.yc.practice.signin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 功能描述: 基于Redis位图的用户签到功能
 * 1、位图(BitMap)是由一组bit位组成的，每个bit位对应0和1两个状态,可以把它看作是一个bit数组，数组的下标就是偏移量。它的优点是内存开销小；
 * 2、以每人每月为key,每天为偏移量,位图的每一位代表一天的签到情况,1表示已签，0表示未签
 *
 *
 * @Author: xieyc
 * @Date: 2020-10-28
 */
@RestController
@RequestMapping("/signIn")
@RequiredArgsConstructor
public class SignInController {

    private final RedisTemplate<String, Object> redisTemplate;
    private final Jedis jedis = new Jedis("127.0.0.1");

    /**
     * 签到KEY
     */
    private static final String SIGN_KEY = "user:sign:%s:%s";

    /**
     * 用户签到
     *
     * @param userId 用户ID
     * @return 之前的签到状态 false:未签到 true:已签到
     */
    @PostMapping("/doSign")
    public boolean doSign(String userId) {
        LocalDate localDate = LocalDate.now().plusDays(2);
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        int offset = localDate.getDayOfMonth() - 1;
        return jedis.setbit(key, offset, true);
        // return redisTemplate.opsForValue().setBit(key, offset, true);
    }

    /**
     * 检查用户是否签到
     *
     * @param userId 用户ID
     * @return 当前的签到状态
     */
    @GetMapping("/checkSign")
    public boolean checkSign(String userId) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        int offset = localDate.getDayOfMonth() - 1;
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        return Boolean.TRUE.equals(redisTemplate.opsForValue().getBit(key, offset));
    }

    /**
     * 获取用户签到次数
     *
     * @param userId 用户ID
     * @return 当前的签到次数
     */
    @GetMapping("/getSignCount")
    public long getSignCount(String userId) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        return jedis.bitcount(key);
    }

    /**
     * 获取当月连续签到次数
     *
     * @param userId 用户ID
     * @return 当月连续签到次数
     */
    @GetMapping("/getContinuousSignCount")
    public long getContinuousSignCount(String userId) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        int signCount = 0;
        String type = String.format("u%d", localDate.getDayOfMonth());
        List<Long> list = jedis.bitfield(key, "GET", type, "0");
        if (list != null && !list.isEmpty()) {
            // 取低位连续不为0的个数即为连续签到次数，需考虑当天尚未签到的情况
            long v = list.get(0) == null ? 0 : list.get(0);
            for (int i = 0; i < localDate.getDayOfMonth(); i++) {
                if (v >> 1 << 1 == v) {
                    // 低位为0且非当天说明连续签到中断了
                    if (i > 0) {
                        break;
                    }
                } else {
                    signCount += 1;
                }
                v >>= 1;
            }
        }
        return signCount;
    }

    /**
     * 获取当月首次签到日期
     *
     * @param userId 用户ID
     * @return 首次签到日期
     */
    @GetMapping("/getFirstSignDate")
    public LocalDate getFirstSignDate(String userId) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        long pos = jedis.bitpos(key, true);
        return pos < 0 ? null : localDate.withDayOfMonth((int) (pos + 1));
    }

    /**
     * 获取当月签到情况
     *
     * @param userId 用户ID
     * @return Key为签到日期，Value为签到状态的Map
     */
    @GetMapping("/getSignInfo")
    public List<HashMap<String, Boolean>> getSignInfo(String userId) {
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyyMM");
        String key = String.format(SIGN_KEY, userId, sdf.format(localDate));
        List<HashMap<String, Boolean>> signMap = new ArrayList<>();
        String type = String.format("u%d", localDate.lengthOfMonth());
        List<Long> list = jedis.bitfield(key, "GET", type, "0");
        if (list != null && list.size() > 0) {
            // 由低位到高位，为0表示未签，为1表示已签
            long v = list.get(0) == null ? 0 : list.get(0);
            for (int i = localDate.lengthOfMonth(); i > 0; i--) {
                LocalDate d = localDate.withDayOfMonth(i);
                HashMap map = new HashMap(localDate.getDayOfMonth());
                map.put(formatDate(d), v >> 1 << 1 != v);
                signMap.add(map);
                v >>= 1;
            }
        }
        return signMap;
    }

    private static String formatDate(LocalDate date) {
        return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }


    // ================ 补充方式2: 存到关系型数据库 ========================

    /**
     * 1.用户表记录 last_checkin_time 上次签到时间和checkin_count 连续签到次数
     * 2.签到流程
     *  2.1 用户第一次签到 last_checkin_time = time checkin_count = 1
     *  2.2 用户非第一次签到且当天已签到 返回 "您已签到!"
     *  2.3 用户非第一次签到且当天未签到 last_checkin_time = time checkin_count = +1
     *      2.3.1 昨天未签到 last_checkin_time = time checkin_count = 1
     *      2.3.2 昨天已签到 last_checkin_time = time checkin_count = +1
     *
     *  附加: 可考虑单独拉出一张签到记录表
     */
}
