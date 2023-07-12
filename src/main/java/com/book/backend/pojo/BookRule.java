package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_book_rule
 */
@TableName(value ="t_book_rule")
@Data
public class BookRule implements Serializable {
    @ApiModelProperty(value = "借阅规则记录的唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer ruleId;

    @ApiModelProperty(value = "借阅规则编号")
    private Integer bookRuleId;

    @ApiModelProperty(value = "借阅天数")
    private Integer bookDays;

    @ApiModelProperty(value = "限制借阅的本数")
    private Integer bookLimitNumber;

    @ApiModelProperty(value = "限制的图书馆")
    private String bookLimitLibrary;

    @ApiModelProperty(value = "图书借阅后每天逾期费用")
    private Double bookOverdueFee;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}