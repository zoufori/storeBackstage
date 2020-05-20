package com.jimmy.controller;

import com.github.pagehelper.PageInfo;
import com.jimmy.domain.ARoles;
import com.jimmy.service.IARolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/adminRole")
public class AdminRoleController {

    @Autowired
    private IARolesService rolesService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<ARoles> all = rolesService.findAll(page);
        PageInfo pageInfo = new PageInfo(all);

        mv.addObject("roleList", pageInfo);
        mv.setViewName("admin-role-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam("id")Integer id) throws Exception{
        ModelAndView mv = new ModelAndView();
        ARoles byId = rolesService.findById(id);

        mv.addObject("roleList", byId);
        mv.setViewName("admin-role-list");
        return mv;
    }

    @RequestMapping("/findByRole.do")
    public ModelAndView findByRole(@RequestParam("text")String role, @RequestParam(name = "page", defaultValue = "1")Integer page) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<ARoles> byRole = rolesService.findByRole(role, page);
        PageInfo pageInfo = new PageInfo(byRole);

        mv.addObject("roleList", pageInfo);
        mv.setViewName("admin-role-list");
        return mv;
    }

    @RequestMapping("/addAdminRole.do")
    public ModelAndView addAdminRole(@RequestParam(value = "id", required = false)String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        if(id != null){
            ARoles byId = rolesService.findById(Integer.parseInt(id));
            mv.addObject("role", byId);
        }

        mv.setViewName("admin-role-add");
        return mv;
    }

    @RequestMapping("/doAddAdminRole.do")
    public String doAddAdminRole(ARoles roles) throws Exception{
        rolesService.saveOrUpdate(roles);
        return "redirect:addAdminRole.do";
    }

    @RequestMapping("/deleteAdminRole.do")
    public String deleteAdminRole(@RequestParam("id") Integer id) throws Exception{
        rolesService.delete(id);
        return "redirect:findAll.do";
    }
}
