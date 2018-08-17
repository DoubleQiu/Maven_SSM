package com.ball.blog.mapper;

import com.ball.blog.po.Blog;

import java.util.List;

public interface BlogMapper {
    List<Blog> selectBlogList(Blog blog);
    List<Blog> frontSelectBlogList(Blog blog);
    List<Blog> frontSelectBlogFind(Blog blog);
    void deleteBlog(Integer id);
    void insertBlog(Blog blog);
    Blog selectBlogById(Integer id);
    Blog frontSelectBlogById(Integer id);
    void updateBlog(Blog blog);
    Blog selectBlogByTid(Integer id);
    List<Blog> findBlogByType(Integer id);
    void  updateBlogRead(Blog blog);

}
