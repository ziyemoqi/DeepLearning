package com.yc.practice;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.yc.common.constant.CommonEnum;
import com.yc.core.mall.entity.ProductCategory;
import com.yc.core.region.entity.Region;
import com.yc.core.system.entity.SysUser;
import com.yc.core.system.mapper.SysUserMapper;
import com.yc.practice.mall.service.ProductCategoryService;
import com.yc.practice.region.service.RegionService;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 功能描述:
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-05-26
 * @Version: 1.0.0
 */
@SpringBootTest
@Slf4j
// @RunWith(SpringRunner.class)
public class TempTest {

    @Autowired
    private RegionService regionService;


    @Autowired
    private ProductCategoryService productCategoryService;

    @Autowired
    private SysUserMapper sysUserMapper;


    @Test
    public void test() {
        // 总金额
        BigDecimal totalMoney = BigDecimal.valueOf(100.3);
        // 累加金额
        BigDecimal addMoney = BigDecimal.valueOf(0);
        int num = 33;
        BigDecimal barginMoney = totalMoney.divide(BigDecimal.valueOf(num), 2, BigDecimal.ROUND_DOWN);
        List<BigDecimal> bigDecimals = new ArrayList<>();
        for (int i = 0; i < 33; i++) {
            if (i == 33 - 1) {
                System.out.println("处理最后一项数据");
                bigDecimals.add(totalMoney.subtract(addMoney));
                break;
            }
            addMoney = addMoney.add(barginMoney);
            bigDecimals.add(barginMoney);
        }
        System.out.println(bigDecimals);
        System.out.println(bigDecimals.size());
    }

}
