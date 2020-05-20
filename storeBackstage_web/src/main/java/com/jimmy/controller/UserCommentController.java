package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.UComment;
import com.jimmy.service.IUCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class UserCommentController {

    @Autowired
    private IUCommentService service;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UComment> list = service.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("commentList", pageInfo);
        mv.setViewName("users-comment-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UComment comment = service.findById(id);

        mv.addObject("comment", comment);
        mv.setViewName("users-comment-list");
        return mv;
    }

    @RequestMapping("/findByContent.do")
    public ModelAndView findByContent(@RequestParam("text")String content, @RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UComment> list = service.findByContent(content, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("commentList", pageInfo);
        mv.setViewName("users-comment-list");
        return mv;
    }
}
