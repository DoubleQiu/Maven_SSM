package com.ball.blog.mapper;

import com.ball.blog.po.Comment;

import java.util.List;

public interface CommentMapper {
    List<Comment> selectCommentList(Comment comment);
    void deleteComment(Integer id);
    List<Comment> selectCommentByBid(Integer id);
    void insertComment(Comment comment);
}
