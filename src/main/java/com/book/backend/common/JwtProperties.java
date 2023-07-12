package com.book.backend.common;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * JWT配置类，读取Application.yml中的配置
 */
@Component
@Data
public class JwtProperties {

    @ApiModelProperty(value = "JWT存储的请求头")
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @ApiModelProperty(value = "jwt加解密使用的密钥")
    @Value("${jwt.secret}")
    private String secret;

    @ApiModelProperty(value = "JWT的超时时间")
    @Value("${jwt.expiration}")
    private long expiration;

    public JwtProperties() {
    }


    @ApiModelProperty(value = "JWT负载中拿到的开头")
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    public JwtProperties(String tokenHeader, String secret, long expiration, String tokenHead) {
        this.tokenHeader = tokenHeader;
        this.secret = secret;
        this.expiration = expiration;
        this.tokenHead = tokenHead;
    }
}
