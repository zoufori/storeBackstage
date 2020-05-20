package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.dao.IUGoodsTypeDao;
import com.jimmy.domain.UGoods;
import com.jimmy.domain.UGoodsType;
import com.jimmy.service.IUGoodsService;
import com.jimmy.service.IUGoodsTypeService;
import com.jimmy.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/goods")
public class UserGoodsController {

    @Autowired
    private IUGoodsService service;
    @Autowired
    private IUGoodsTypeService typeService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UGoods> list = service.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("goodsList", pageInfo);
        mv.setViewName("users-goods-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UGoods goods = service.findById(id);

        mv.addObject("", goods);
        mv.setViewName("users-goods-list");
        return mv;
    }

    @RequestMapping("/findByName.do")
    public ModelAndView findByName(@RequestParam("text") String name, @RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UGoods> list = service.findByName(name, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("goodsList", pageInfo);
        mv.setViewName("users-goods-list");
        return mv;
    }

    @RequestMapping("/addGoods.do")
    public ModelAndView addGoods(@RequestParam(value = "id", required = false)String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UGoodsType> types = typeService.findAllRaw();
        mv.addObject("typesList", types);
        if(id != null){
            UGoods goods = service.findById(Integer.parseInt(id));
            mv.addObject("goods", goods);
        }

        mv.setViewName("users-goods-add");
        return mv;
    }

    @RequestMapping("/doAddGoods.do")
    public String doAddGoods(UGoods goods, @RequestParam("img_url")MultipartFile img, @RequestParam("content_img_url")MultipartFile content, HttpServletRequest request) throws Exception{
        String realPath = request.getSession().getServletContext().getRealPath("/web/img");
        String imgUrl = img.getOriginalFilename();
        String contentUrl = content.getOriginalFilename();

        String imgExtension = imgUrl.substring(imgUrl.indexOf(".") + 1);
        String contentExtension = contentUrl.substring(contentUrl.indexOf(".") + 1);

        String newImgName = UUID.randomUUID().toString() + "." + imgExtension;
        String newContentName = UUID.randomUUID().toString() + "." + contentExtension;

        File imgFile = new File(realPath, newImgName);
        File contentFile = new File(realPath, newContentName);

        img.transferTo(imgFile);
        content.transferTo(contentFile);
        String bigImgName = ImageUtils.imageChange(realPath, newImgName, 365, 365);
        System.out.println(bigImgName);

        goods.setBig_img(bigImgName);
        goods.setThumb_img(newImgName);
        goods.setContent_img(newContentName);

        if (goods.getId() == null){
            goods.setDate(new Date());
        }

        service.saveOrUpdate(goods);
        return "redirect:addGoods.do";
    }

    @RequestMapping("/deleteGoods.do")
    public String deleteGoods(@RequestParam("id") Integer id) throws Exception{
        service.delete(id);
        return "redirect:findAll.do";
    }
}
