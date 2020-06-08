package com.yc.practice.mall.service.impl;

import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yc.common.constant.CommonConstant;
import com.yc.common.global.error.Error;
import com.yc.common.global.error.ErrorException;
import com.yc.core.mall.entity.MallSeckill;
import com.yc.core.mall.entity.MallSeckillSuccess;
import com.yc.core.mall.mapper.MallSeckillMapper;
import com.yc.core.mall.mapper.MallSeckillSuccessMapper;
import com.yc.core.mall.model.form.SeckillForm;
import com.yc.core.mall.model.vo.SeckillVO;
import com.yc.practice.common.UserUtil;
import com.yc.practice.mall.service.MallSeckillService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

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
@Service
@Transactional(rollbackFor = Exception.class)
public class MallSeckillServiceImpl extends ServiceImpl<MallSeckillMapper, MallSeckill> implements MallSeckillService {

    private MallSeckillSuccessMapper mallSeckillSuccessMapper;

    @Autowired
    public MallSeckillServiceImpl(MallSeckillSuccessMapper mallSeckillSuccessMapper){
        this.mallSeckillSuccessMapper = mallSeckillSuccessMapper;
    }

    @Override
    public Page<MallSeckill> mallSeckillPage(Page<MallSeckill> page) {
        return baseMapper.mallSeckillPage(page);
    }

    @Override
    public void add(MallSeckill mallSeckill) {
        mallSeckill.setCreateUserId(UserUtil.getUserId());
        this.baseMapper.insert(mallSeckill);
    }

    @Override
    public void updateSeckill(MallSeckill mallSeckill) {
        mallSeckill.setUpdateUserId(UserUtil.getUserId());
        this.baseMapper.updateById(mallSeckill);
    }

    @Override
    public void deleteAlone(String mallSeckillId) {
        MallSeckill mallSeckill = new MallSeckill();
        mallSeckill.setMallSeckillId(mallSeckillId);
        mallSeckill.setDelFlag(1);
        this.baseMapper.updateById(mallSeckill);
    }

    @Override
    public SeckillVO mallSeckill(String mallSeckillId) {
        SeckillVO seckillVO = new SeckillVO();
        MallSeckill seckill = this.baseMapper.selectById(mallSeckillId);
        seckillVO.setSeckillStartTime(seckill.getSeckillStartTime());
        seckillVO.setSeckillEndTime(seckill.getSeckillEndTime());
        seckillVO.setMallGoodName(seckill.getMallGoodName());
        seckillVO.setLocalDateTime(LocalDateTime.now());
        seckillVO.setMd5(DigestUtil.md5Hex(seckill.getMallSeckillId()+ CommonConstant.SLAT));
        seckillVO.setSeckillStartTime(seckill.getSeckillStartTime());
        seckillVO.setSeckillEndTime(seckill.getSeckillEndTime());
        // 状态(0:未开始 1:开始秒杀 2:已结束)
        if(LocalDateTime.now().isBefore(seckill.getSeckillStartTime())){
            seckillVO.setState("0");
        }else if (LocalDateTime.now().isEqual(seckill.getSeckillStartTime())|| LocalDateTime.now().isEqual(seckill.getSeckillEndTime())){
            seckillVO.setState("1");
        } else if(LocalDateTime.now().isAfter(seckill.getSeckillStartTime()) && LocalDateTime.now().isBefore(seckill.getSeckillEndTime())){
            seckillVO.setState("1");
        } else {
            seckillVO.setState("2");
        }
        return seckillVO;
    }

    @Override
    public void execSeckill(SeckillForm seckillForm) {
        // 验签
        String md5 = DigestUtil.md5Hex(seckillForm.getMallSeckillId()+ CommonConstant.SLAT);
        if(StringUtils.equals(seckillForm.getMd5(),md5)){
            // 执行秒杀逻辑: 1.减库存.2.记录购买行为
            MallSeckillSuccess mallSeckillSuccess = new MallSeckillSuccess();
            mallSeckillSuccess.setMallSeckillId(seckillForm.getMallSeckillId());
            mallSeckillSuccess.setSysUserId(UserUtil.getUserId());
            try {
                mallSeckillSuccessMapper.insert(mallSeckillSuccess);
            }catch (Exception e){
                throw new ErrorException(Error.DuplicateSeckill);
            }
            seckillForm.setKillTime(LocalDateTime.now().toString());
            int result = this.baseMapper.reduceNumber(seckillForm);
            if(result<=0){
                throw new ErrorException(Error.SeckillOver);
            }
        } else {
            throw new ErrorException(Error.IllegalRequest);
        }
    }


}