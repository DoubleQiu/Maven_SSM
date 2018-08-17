package com.ball.blog.service.impl;

import com.ball.blog.mapper.BlogMapper;
import com.ball.blog.po.Blog;
import com.ball.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;
    @Override
    public List<Blog> selectBlogList(Blog blog) {
        return blogMapper.selectBlogList(blog);
    }

    @Override
    public void deleteBlog(Integer id) {
        blogMapper.deleteBlog(id);
    }

    @Override
    public void insertBlog(Blog blog) {
        blogMapper.insertBlog(blog);
    }

    @Override
    public Blog selectBlogById(Integer id) {
        return blogMapper.selectBlogById(id);
    }

    @Override
    public void updateBlog(Blog blog) {
        blogMapper.updateBlog(blog);
    }

    @Override
    public Blog selectBlogByTid(Integer id) {
        return blogMapper.selectBlogByTid(id);
    }

    @Override
    public List<Blog> findBlogByType(Integer id) {
        return blogMapper.findBlogByType(id);
    }

    @Override
    public List<Blog> frontSelectBlogFind(Blog blog) {
        return blogMapper.frontSelectBlogFind(blog);
    }

    @Override
    public void updateBlogRead(Blog blog) {
        blogMapper.updateBlogRead(blog);
    }

    @Override
    public List<Blog> frontSelectBlogList(Blog blog) {
        return blogMapper.frontSelectBlogList(blog);
    }

    @Override
    public Blog frontSelectBlogById(Integer id) {
        return blogMapper.frontSelectBlogById(id);
    }
}
