package com.book.backend.pojo.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
public class BorrowData implements Serializable {

    @ApiModelProperty(value = "借阅时期 一周为一个间隔")
    public String [] borrowDates;

    @ApiModelProperty(value = "借阅量 每个数值代表一周的借阅量")
    public Integer [] borrowNumber;

    public BorrowData(String[] borrowDates, Integer[] borrowNumber) {
        this.borrowDates = borrowDates;
        this.borrowNumber = borrowNumber;
    }
}
