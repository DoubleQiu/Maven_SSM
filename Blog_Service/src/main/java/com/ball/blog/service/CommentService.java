package com.ball.blog.service;

import com.ball.blog.po.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> selectCommentList(Comment comment);
    void deleteComment(Integer id);
    List<Comment> selectCommentByBid(Integer id);
    void insertComment(Comment comment);
}
