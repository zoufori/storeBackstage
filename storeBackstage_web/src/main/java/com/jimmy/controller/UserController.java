package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.UUsers;
import com.jimmy.service.IUUsersService;
import com.jimmy.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUUsersService usersService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UUsers> list = usersService.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("userList", pageInfo);
        mv.setViewName("users-list");
        return mv;
    }

    @RequestMapping("/findByUsername.do")
    public ModelAndView findByUsername(@RequestParam("text") String username, @RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UUsers> list = usersService.findByUsername(username, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("userList", pageInfo);
        mv.setViewName("users-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id") Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();

        UUsers user = usersService.findById(id);
        mv.addObject("", user);
        mv.setViewName("users-list");
        return mv;
    }

    @RequestMapping("/addUser.do")
    public ModelAndView addUser(@RequestParam(value = "id", required = false)String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        if(id != null){
            UUsers u = usersService.findById(Integer.parseInt(id));
            mv.addObject("user", u);
        }

        mv.setViewName("users-add");
        return mv;
    }

    @RequestMapping("/doAddUser.do")
    public String doAddUser(UUsers users, @RequestParam("img") MultipartFile img, HttpServletRequest request) throws Exception{
        users.setRole("USER");
        String realPath = request.getSession().getServletContext().getRealPath("/web/img");
        String imgUrl = img.getOriginalFilename();

        String imgExtension = imgUrl.substring(imgUrl.indexOf(".") + 1);

        String newImgName = UUID.randomUUID().toString() + "." + imgExtension;

        File imgFile = new File(realPath, newImgName);

        img.transferTo(imgFile);

        users.setHead_img(newImgName);

        users.setDate(new Date());
        usersService.saveOrUpdate(users);
        return "redirect:addUser.do";
    }

    @RequestMapping("/deleteUser.do")
    public String deleteUser(Integer id) throws Exception{
        usersService.delete(id);
        return "redirect:findAll.do";
    }

    @ResponseBody
    @RequestMapping("/doStatus.do")
    public String doStatus(@RequestParam("id")Integer id) throws Exception{
        usersService.doStatus(id);
        return id.toString();
    }
}
