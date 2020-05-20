package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.UOrders;
import com.jimmy.service.IUOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/orders")
@Controller
public class UserOrdersController {

    @Autowired
    private IUOrdersService service;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UOrders> list = service.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("orderList", pageInfo);
        mv.setViewName("users-orders-list");
        return mv;
    }

    @RequestMapping("/findByOrderTime.do")
    public ModelAndView findByOrderTime(@RequestParam("orderTime")String time, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UOrders> list = service.findByOrderTime(time, page);

        mv.addObject("", list);
        mv.setViewName("users-orders-list");
        return mv;
    }

    @RequestMapping("/findByOrderTimePeriod.do")
    public ModelAndView findByOrderTimePeriod(@RequestParam("orderFromTime")String fromTime, @RequestParam("orderToTime")String toTime, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UOrders> list = service.findByOrderTimePeriod(fromTime, toTime, page);

        mv.addObject("", list);
        mv.setViewName("users-orders-list");
        return mv;
    }

    @RequestMapping("/findByReceiveTime.do")
    public ModelAndView findByReceiveTime(@RequestParam("receiveTime")String time, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UOrders> list = service.findByReceiveTime(time, page);

        mv.addObject("", list);
        mv.setViewName("users-orders-list");
        return mv;
    }

    @RequestMapping("/findByReceiveTimePeriod.do")
    public ModelAndView findByReceiveTimePeriod(@RequestParam("receiveFromTime")String fromTime, @RequestParam("receiveToTime")String toTime, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UOrders> list = service.findByReceiveTimePeriod(fromTime, toTime, page);

        mv.addObject("", list);
        mv.setViewName("users-orders-list");
        return mv;
    }
}
