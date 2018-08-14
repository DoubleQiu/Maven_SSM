package com.ball.blog.controller;

import com.ball.blog.po.Type;
import com.ball.blog.service.TypeService;
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
@RequestMapping("/type")
public class TypeController {
    @Resource(name="typeService")
    private TypeService typeService;
    private Type type;
    @RequestMapping("/typeinfo")
    public ModelAndView typeinfo(Type type){
        List<Type> typeList=typeService.selectTypeList(type);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("typeList",typeList);
        modelAndView.setViewName("/Blog-Back/back-type-info");
        return modelAndView;
    }
    @RequestMapping("/findTypeByName")
    public ModelAndView findTypeByName(Type type){
        List<Type> typeList=typeService.selectTypeList(type);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("findList",typeList);
        modelAndView.addObject("findName",type.getName());
        modelAndView.setViewName("/Blog-Back/back-type-find");
        return modelAndView;
    }
    @RequestMapping("deleteType")
    public void deleteType(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        typeService.deleteType(id);
       request.getRequestDispatcher("/type/typeinfo.action").forward(request,response);
    }
    @RequestMapping("deleteTypeByFind")
    public void deleteTypeByFind(Integer id,String name, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        typeService.deleteType(id);
        request.setAttribute("name",name);
        request.getRequestDispatcher("/type/findTypeByName.action").forward(request,response);
    }
    @RequestMapping("insertType")
    public void insertType(Type form,HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        type=typeService.selectTypeByName(form.getName());
        if(type!=null){
            request.setAttribute("msg","该分类已经存在啦~");
            request.setAttribute("name",form.getName());
            request.setAttribute("sort",form.getSort());
            request.getRequestDispatcher("/jsp/Blog-Back/back-type-add.jsp").forward(request,response);
        }else{
            typeService.insertType(form);
            response.sendRedirect("/type/typeinfo.action");
        }
    }
    @RequestMapping("/editTypePro")
    public ModelAndView editTypePro(Integer id){
        type=typeService.selectTypeById(id);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("type",type);
        modelAndView.setViewName("/Blog-Back/back-type-edit");
        return modelAndView;
    }

    @RequestMapping("updateType")
    public void updateType(Type form, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Type type1=typeService.selectTypeById(form.getId());
        type=typeService.selectTypeByName(form.getName());
        if(!type1.getName().equals(form.getName())){
            if(type!=null){
                request.setAttribute("msg","该分类已经存在啦~");
                request.setAttribute("type.name",form.getName());
                request.setAttribute("type.sort",form.getSort());
                request.setAttribute("id",form.getId());
                request.getRequestDispatcher("/jsp/Blog-Back/back-type-edit.jsp").forward(request,response);
            }else{
                typeService.updateType(form);
                response.sendRedirect("/type/typeinfo.action");
            }
        }else{
            typeService.updateType(form);
            response.sendRedirect("/type/typeinfo.action");
        }

    }
}
