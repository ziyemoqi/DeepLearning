package com.yc.practice.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yc.core.mall.entity.MallSeckill;
import com.yc.core.mall.model.form.SeckillForm;
import com.yc.core.mall.model.vo.SeckillVO;

/**
 * 功能描述：
 *
 *  <p>版权所有：</p>
 *  未经本人许可，不得以任何方式复制或使用本程序任何部分
 *
 * @Company: 紫色年华
 * @Author xieyc
 * @Date 2020-06-01
 * @Version: 1.0.0
 *
 */
public interface MallSeckillService extends IService<MallSeckill> {

    /**
     * 秒杀商品分页查询
     * @param page 分页信息
     * @return page
     */
    Page<MallSeckill> mallSeckillPage(Page<MallSeckill> page);

    /**
     * 增加秒杀商品
     * @param mallSeckill 商品信息
     */
    void add(MallSeckill mallSeckill);

    /**
     * 修改秒杀商品信息
     * @param mallSeckill 商品信息
     */
    void updateSeckill(MallSeckill mallSeckill);

    /**
     * 删除指定秒杀商品
     * @param mallSeckillId 秒杀商品ID
     */
    void deleteAlone(String mallSeckillId);

    /**
     * 减库存
     * @param seckillForm 秒杀商品
     */
    void execSeckill(SeckillForm seckillForm);

    /**
     * 秒杀商品详情
     * @param mallSeckillId 主键
     * @return (系统时间,加密串,秒杀ID)
     */
    SeckillVO mallSeckill(String mallSeckillId);

}