package com.ball.blog.service;

import com.ball.blog.po.Blog;

import java.util.List;

public interface BlogService {
    List<Blog> selectBlogList(Blog blog);
    void deleteBlog(Integer id);
    void insertBlog(Blog blog);
    Blog selectBlogById(Integer id);
    void updateBlog(Blog blog);
    Blog selectBlogByTid(Integer id);
    List<Blog> findBlogByType(Integer id);
    List<Blog> frontSelectBlogFind(Blog blog);
    void  updateBlogRead(Blog blog);
    List<Blog> frontSelectBlogList(Blog blog);
    Blog frontSelectBlogById(Integer id);
}
