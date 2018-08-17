package com.ball.blog.service.impl;

import com.ball.blog.mapper.CommentMapper;
import com.ball.blog.po.Comment;
import com.ball.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> selectCommentList(Comment comment) {
        return commentMapper.selectCommentList(comment);
    }

    @Override
    public void deleteComment(Integer id) {
        commentMapper.deleteComment(id);
    }

    @Override
    public List<Comment> selectCommentByBid(Integer id) {
        return commentMapper.selectCommentByBid(id);
    }

    @Override
    public void insertComment(Comment comment) {
        commentMapper.insertComment(comment);
    }
}
