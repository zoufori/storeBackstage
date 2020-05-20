package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.AAdmin;
import com.jimmy.service.IAAdminService;
import com.jimmy.utils.BCryptPasswordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private IAAdminService adminService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<AAdmin> list = adminService.findAll(page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("adminList", pageInfo);
        mv.setViewName("admin-list");
        return mv;
    }

    @RequestMapping("/findByUsername.do")
    public ModelAndView findByUsername(@RequestParam("text") String username, @RequestParam(name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<AAdmin> list = adminService.findByUsername(username, page);
        PageInfo pageInfo = new PageInfo(list);

        mv.addObject("adminList", pageInfo);
        mv.setViewName("admin-list");
        return mv;
    }

    @RequestMapping("/addAdmin.do")
    public ModelAndView addAdmin(@RequestParam(required = false, value = "id") String id) throws Exception {
        ModelAndView mv = new ModelAndView();

        if (id != null) {
            Integer userid = Integer.parseInt(id);
            AAdmin list = adminService.findById(userid);

            mv.addObject("admin", list);
        }

        mv.setViewName("admin-add");
        return mv;
    }

    @ResponseBody
    @RequestMapping("/doStatus.do")
    public String doStatus(@RequestParam("id") Integer id) throws Exception {
        adminService.doStatus(id);
        return id.toString();
    }

    @RequestMapping("/doAddAdmin.do")
    public String doAddAdmin(AAdmin admin) throws Exception {
        admin.setPassword(BCryptPasswordUtils.getEncoderPassword(admin.getPassword()));
        if (admin.getId() != null) {
            Integer id = admin.getId();
            AAdmin byId = adminService.findById(id);
            admin.setDate(byId.getDate());
        }

        adminService.saveOrUpdate(admin);
        return "redirect:addAdmin.do";
    }

    @RequestMapping("/deleteAdmin.do")
    public String deleteAdmin(@RequestParam("id") Integer id) throws Exception {
        adminService.delete(id);
        return "redirect:findAll.do";
    }
}
