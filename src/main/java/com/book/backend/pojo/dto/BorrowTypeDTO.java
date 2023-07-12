package com.book.backend.pojo.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class BorrowTypeDTO {

    @ApiModelProperty(value = "图书分类")
    public String bookTypes;

    @ApiModelProperty(value = "借阅量")
    public Integer  borrowNumbers;
}
