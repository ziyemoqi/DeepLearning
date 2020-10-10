package com.yc.core.test;

import com.yc.common.validate.PhoneValidatorAnnotation;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

/**
 * 功能描述:
 *
 * @Author: xieyc
 * @Date: 2020-10-09
 */
@Data
public class TestParam {

    /**
     * phone
     */
    private String phone;


}
