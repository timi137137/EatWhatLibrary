package com.book.backend.pojo.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class CommentDTO implements Serializable {
    public Integer id;
    public String avatar;
    public String msg;
    public Integer time;
    public String barrageStyle;
}
