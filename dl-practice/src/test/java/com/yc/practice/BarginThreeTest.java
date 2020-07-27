package com.yc.practice;

import org.junit.Test;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Random;

/**
 * 功能描述:
 *
 * @Author: xieyc && 紫色年华
 * @Date: 2020-07-25
 * @Version: 1.0.0
 */
public class BarginThreeTest {

    // 前N个人可砍掉的百分比(0, 100]
    private int frontBarginOfPercent = 70;
    // 前N个砍价的人数
    private final int frontBarginNum;

    /**
     * 初始化砍价规则
     * @param totalBarginNum 砍价总人数
     */
    public BarginThreeTest(int totalBarginNum) {
        if(totalBarginNum < 5){
            this.frontBarginNum = 1;
        }else if(totalBarginNum<15){
            this.frontBarginNum = 5;
        } else {
            this.frontBarginNum = 9;
        }
    }

    /**
     * @param totalBarginMoney      总共可砍价的金额
     * @param totalBarginNum 总共可砍价的次数
     * @return List[砍价金额]
     */
    public List<BigDecimal> getBarginMoneyList(BigDecimal totalBarginMoney, int totalBarginNum) {
        if (totalBarginNum <= frontBarginNum) {
            // TODO: 2020/7/25 异常
            throw new IllegalArgumentException("total reduce times is less than first n reduce times");
        }

        if (frontBarginOfPercent > 100 || frontBarginOfPercent <= 0) {
            // TODO: 2020/7/25 异常
            throw new IllegalArgumentException("reduce percent should in (0, 100]");
        }
        BigDecimal firstBarginMoney =
                BigDecimal.valueOf(totalBarginMoney.doubleValue() * frontBarginOfPercent / 100).setScale(2, BigDecimal.ROUND_HALF_EVEN);

        List<BigDecimal> moneyList = dealBarginMoeny(firstBarginMoney, frontBarginNum);
        BigDecimal lastBarginMoney = totalBarginMoney.subtract(firstBarginMoney).setScale(2,
                BigDecimal.ROUND_HALF_EVEN);
        moneyList.addAll(dealBarginMoeny(lastBarginMoney, totalBarginNum - frontBarginNum));
        checkMoeny(totalBarginMoney,moneyList);
        BigDecimal total = BigDecimal.valueOf(0);
        for (BigDecimal val : moneyList) {
            total = total.add(val);
        }
        if(!(totalBarginMoney.compareTo(total)==0)){
            // TODO: 2020/7/25 异常
            System.out.println("异常");
            return null;
        } else {
            return moneyList;
        }
    }


    private List<BigDecimal> dealBarginMoeny(BigDecimal totalBarginMoney, int totalBarginNum) {
        if (totalBarginNum <= 0) {
            // TODO: 2020/7/25 异常
            throw new IllegalArgumentException("total reduce times should gte 1");
        }
        List<BigDecimal> moneyList = new ArrayList<>();

        Random rand = new Random();
        double[] vs = new double[totalBarginNum];
        double total = 0d;
        for (int i = 0; i < totalBarginNum; i++) {
            double v = rand.nextDouble() * totalBarginMoney.doubleValue();
            vs[i] = v;
            total += v;
        }

        // 最低砍价金额: 总砍价金额/(砍价次数 * 2)
        BigDecimal minMoney =
                totalBarginMoney.divide(BigDecimal.valueOf(totalBarginNum).multiply(BigDecimal.valueOf(2)), BigDecimal.ROUND_HALF_EVEN);
        BigDecimal t = BigDecimal.valueOf(0d);
        for (int i = 0; i < totalBarginNum - 1; i++) {
            double vss = vs[i] / total * (totalBarginMoney.doubleValue() - minMoney.doubleValue() * totalBarginNum) + minMoney.doubleValue();
            BigDecimal reduce = BigDecimal.valueOf(vss).setScale(2, RoundingMode.HALF_EVEN);
            t = t.add(reduce);
            moneyList.add(reduce);
        }
        moneyList.add(totalBarginMoney.subtract(t).setScale(2, RoundingMode.HALF_EVEN));
        return moneyList;
    }

    private void checkMoeny(BigDecimal totalBarginMoney,List<BigDecimal> list){
        BigDecimal total = BigDecimal.valueOf(0);
        for (BigDecimal val : list) {
            total = total.add(val);
        }
        if(!(totalBarginMoney.compareTo(total)==0)){
            // TODO: 2020/7/25 异常
            System.out.println("异常");
        }
    }

    public static void main(String[] args) {
        BarginThreeTest rule = new BarginThreeTest(11);
        List<BigDecimal> list = rule.getBarginMoneyList(new BigDecimal("50"), 11);
        System.out.println(list);
    }
}
