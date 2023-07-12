package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @TableName t_violation
 */
@TableName(value ="t_violation")
@Data
public class Violation implements Serializable {
    @ApiModelProperty(value = "违章表唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer violationId;

    @ApiModelProperty(value = "借阅证编号 11位 随机生成")
    private Long cardNumber;

    @ApiModelProperty(value = "图书编号 图书唯一标识")
    private Long bookNumber;

    @ApiModelProperty(value = "借阅日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime borrowDate;

    @ApiModelProperty(value = "截止日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime closeDate;

    @ApiModelProperty(value = "归还日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime returnDate;

    @ApiModelProperty(value = "违章信息")
    private String violationMessage;

    @ApiModelProperty(value = "违章信息管理员的id")
    private Integer violationAdminId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
