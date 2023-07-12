package com.book.backend.common;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class BasePage {

    @ApiModelProperty(value = "分页参数 当前页")
    private int pageNum = 1;

    @ApiModelProperty(value = "分页参数 每页条数")
    private int pageSize = 3;

    @ApiModelProperty(value = "查询内容")
    private String query;

    @ApiModelProperty(value = "查询条件")
    private String condition;

    @ApiModelProperty(value = "借阅证编号")
    private String cardNumber;
}
