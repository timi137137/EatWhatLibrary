package com.book.backend.pojo.dto;

import com.book.backend.pojo.Violation;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 *  DTO用于将管理员昵称传输
 */
@Data
public class ViolationDTO extends Violation implements Serializable{

    @ApiModelProperty(value = "违章信息处理人的姓名")
    public String violationAdmin;

     @ApiModelProperty(value = "还剩多少天逾期")
    public long expireDays;
}
