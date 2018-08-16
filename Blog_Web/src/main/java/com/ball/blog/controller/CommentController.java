package com.ball.blog.controller;

import com.ball.blog.po.Comment;
import com.ball.blog.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource(name="commentService")
    private CommentService commentService;

    @RequestMapping("/commentinfo")
    public ModelAndView commentinfo(Comment comment,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Comment> commentList=commentService.selectCommentList(comment);
        PageInfo<Comment> commentPage=new PageInfo<>(commentList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("commentList",commentList);
        modelAndView.addObject("page",commentPage);
        modelAndView.setViewName("/Blog-Back/back-comment-info");
        return modelAndView;
    }
    @RequestMapping("/selectCommentByContent")
    public  ModelAndView selectCommentByContent(Comment comment,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Comment> commentList=commentService.selectCommentList(comment);
        PageInfo<Comment> commentPage=new PageInfo<>(commentList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("findList",commentList);
        modelAndView.addObject("page",commentPage);
        modelAndView.addObject("content",comment.getContent());
        modelAndView.setViewName("/Blog-Back/back-comment-find");
        return modelAndView;
    }
    @RequestMapping("/deleteComment")
    public  ModelAndView deleteComment(Integer id){
        commentService.deleteComment(id);
        return new ModelAndView("redirect:/comment/commentinfo.action");
    }
    @RequestMapping("/deleteCommentByFind")
    public void deleteCommentByFind(Integer id, String content, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commentService.deleteComment(id);
        request.setAttribute("content",content);
        request.getRequestDispatcher("/comment/selectCommentByContent.action").forward(request,response);
    }

}
