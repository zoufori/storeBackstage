package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.UGoodsSell;
import com.jimmy.service.IUGoodsSellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/goodssell")
public class UserGoodsSellController {

    @Autowired
    private IUGoodsSellService service;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UGoodsSell> list = service.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("sellList", pageInfo);
        mv.setViewName("users-goodssell-list");
        return mv;
    }

    @RequestMapping("/findByDate.do")
    public ModelAndView findByDate(@RequestParam("date") String date, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UGoodsSell> list = service.findByDate(date, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("sellList", pageInfo);
        mv.setViewName("users-goodssell-list");
        return mv;
    }

    @RequestMapping("/findByTimePeriod.do")
    public ModelAndView findByTimePeriod(@RequestParam("fromTime") String fromTime, @RequestParam("toTime") String toTime, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<UGoodsSell> list = service.findByTimePeriod(fromTime, toTime, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("sellList", pageInfo);
        mv.setViewName("users-goodssell-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") Integer id) throws Exception {
        ModelAndView mv = new ModelAndView();
        UGoodsSell goodsSell = service.findById(id);

        mv.addObject("sellList", goodsSell);
        mv.setViewName("users-goodssell-list");
        return mv;
    }
}
