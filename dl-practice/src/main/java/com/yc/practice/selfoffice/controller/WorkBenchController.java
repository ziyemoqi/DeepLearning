package com.yc.practice.selfoffice.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yc.core.selfoffice.entity.WorkBench;
import com.yc.practice.selfoffice.service.WorkBenchService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;

/**
 * 功能描述:工作台 控制层
 *
 * @Author: xieyc
 * @Date: 2020-04-15
 * @Version: 1.0.0
 */
@RestController
@RequestMapping("/workBench")
@Slf4j
public class WorkBenchController {

    @Autowired
    public WorkBenchService iWorkBenchService;

    public WorkBenchController() throws NoSuchAlgorithmException {
    }

    /**
     * 我的工作台
     *
     * @return list
     */
    @GetMapping
    public List<WorkBench> list() {
        return iWorkBenchService.list(new LambdaQueryWrapper<WorkBench>()
                .orderByAsc(WorkBench::getSort)
        );
    }

    private final Random rand = SecureRandom.getInstanceStrong();

    /**
     * 我的工作台-添加
     */
    @PostMapping
    public void save(@RequestBody WorkBench workBench) {
        if (this.rand.nextInt(2) > 0) {
            workBench.setAvatar("https://gw.alipayobjects.com/zos/rmsportal/sfjbOqnsXXJgNCjCzDBL.png");
        } else {
            workBench.setAvatar("https://gw.alipayobjects.com/zos/rmsportal/ComBAopevLwENQdKWiIn.png");
        }
        iWorkBenchService.saveOrUpdate(workBench);
    }


    /**
     * 我的工作台-删除
     *
     * @param workBenchId 主键
     */
    @DeleteMapping
    public void delete(@Param("workBenchId") String workBenchId) {
        iWorkBenchService.removeById(workBenchId);
    }


}
