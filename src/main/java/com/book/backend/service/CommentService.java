package com.book.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.book.backend.common.R;
import com.book.backend.pojo.Comment;
import com.book.backend.pojo.dto.CommentDTO;

import java.util.List;

/**
 * @description 针对表【t_comment】的数据库操作Service
 */
public interface CommentService extends IService<Comment> {
    /**
     * 获取弹幕列表
     *
     * @return R<Comment>
     */
    R<List<CommentDTO>> getCommentList();

    /**
     * 添加弹幕
     *
     * @return R
     */
    R<String> addComment(CommentDTO commentDTO);
}
