package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.UGoodsType;
import com.jimmy.service.IUGoodsTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/goodsType")
public class UsersGoodsTypeController {

    @Autowired
    private IUGoodsTypeService service;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UGoodsType> list = service.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("typeList", pageInfo);
        mv.setViewName("users-goodstype-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id")Integer id) throws Exception{
        ModelAndView mv= new ModelAndView();
        UGoodsType goodsType = service.findById(id);

        mv.addObject("typeList", goodsType);
        mv.setViewName("users-goodstype-list");
        return mv;
    }

    @RequestMapping("/findByName.do")
    public ModelAndView findByName(@RequestParam("text")String name, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UGoodsType> list = service.findByName(name, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("typeList", pageInfo);
        mv.setViewName("users-goodstype-list");
        return mv;
    }

    @RequestMapping("/addGoodsType.do")
    public ModelAndView addGoodsType(@RequestParam(value = "id", required = false)String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        if(id != null){
            UGoodsType goodsType = service.findById(Integer.parseInt(id));
            mv.addObject("type", goodsType);
        }

        mv.setViewName("users-goodstype-add");
        return mv;
    }

    @RequestMapping("/doAddGoodsType.do")
    public String doAddGoodsType(UGoodsType goodsType) throws Exception{
        service.saveOrUpdate(goodsType);
        return "redirect:addGoodsType.do";
    }

    @RequestMapping("/deleteGoodsType.do")
    public String deleteGoodsType(Integer id) throws Exception{
        service.delete(id);
        return "redirect:findAll.do";
    }
}
