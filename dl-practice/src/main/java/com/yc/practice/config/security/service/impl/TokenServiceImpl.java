package com.yc.practice.config.security.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yc.common.constant.CommonConstant;
import com.yc.common.global.error.Error;
import com.yc.common.global.error.ErrorException;
import com.yc.common.propertie.SecurityProperties;
import com.yc.common.utils.DateTimeUtil;
import com.yc.common.utils.JwtTokenUtil;
import com.yc.core.system.entity.SysUser;
import com.yc.core.system.mapper.SysUserMapper;
import com.yc.practice.config.security.auth.UserDetailsSelf;
import com.yc.practice.config.security.service.TokenService;
import com.yc.practice.system.service.SysPermissionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 功能描述：JWT
 * <p>版权所有：</p>
 * 未经本人许可，不得以任何方式复制或使用本程序任何部分
 *
 * @Company: 紫色年华
 * @Author: xieyc
 * @Datetime: 2020-03-23
 * @Version: 1.0.0
 */
@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class TokenServiceImpl implements TokenService {

    private final SysUserMapper sysUserMapper;
    private final JwtTokenUtil jwtTokenUtil;
    private final SecurityProperties securityProperties;
    private final SysPermissionService sysPermissionService;

    @Autowired
    public TokenServiceImpl(SysUserMapper sysUserMapper, JwtTokenUtil jwtTokenUtil,
                            SecurityProperties securityProperties, SysPermissionService sysPermissionService) {
        this.sysUserMapper = sysUserMapper;
        this.jwtTokenUtil = jwtTokenUtil;
        this.securityProperties = securityProperties;
        this.sysPermissionService = sysPermissionService;
    }

    @Override
    public String create(String loginName) {
        return jwtTokenUtil.createJWT(loginName);
    }

    @Override
    public UsernamePasswordAuthenticationToken verify(HttpServletResponse response, String token) {
        String loginName = jwtTokenUtil.getName(token);
        SysUser sysUser = sysUserMapper.loginByName(loginName);
        UserDetailsSelf userDetailsSelf = new UserDetailsSelf();
        BeanUtil.copyProperties(sysUser,userDetailsSelf);
        List<String> permissions = sysPermissionService.getUserPerm(userDetailsSelf.getLoginName());
        userDetailsSelf.setAuthorities(
                AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(",",permissions))
                     );
        try {
            jwtTokenUtil.validateToken(token);
            DecodedJWT jwt = jwtTokenUtil.getDecodedJWT(token);
            Date now = new Date();
            Date iatTime = jwt.getIssuedAt();
            Date expTime = jwt.getExpiresAt();
            Date renewTime = new Date(iatTime.getTime() + securityProperties.getJwtRenewTime());
            log.debug("签发时间：{}", DateTimeUtil.dateToString(iatTime));
            log.debug("到期时间：{}", DateTimeUtil.dateToString(expTime));
            log.debug("续签时间：{}", DateTimeUtil.dateToString(renewTime));
            log.debug("Bearer " + token);
            // 满足续签条件
            if (now.compareTo(renewTime) >= 0) {
                String newToken = this.create(jwtTokenUtil.getName(token));
                response.addHeader(CommonConstant.HEADER_STRING, CommonConstant.TOKEN_PREFIX + " " + newToken);
                response.setHeader("Access-Control-Allow-Headers", "authorization");
                response.setHeader("Access-Control-Expose-Headers", "authorization");
            }
        } catch (TokenExpiredException e) {
            throw new ErrorException(Error.TokenError);
        }
        return new UsernamePasswordAuthenticationToken(userDetailsSelf, userDetailsSelf.getPassWord(), AuthorityUtils.commaSeparatedStringToAuthorityList(String.join(",",permissions)));
    }
}