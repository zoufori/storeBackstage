package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IAAdminDao;
import com.jimmy.dao.IARolesDao;
import com.jimmy.domain.AAdmin;
import com.jimmy.domain.ARoles;
import com.jimmy.service.IAAdminService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service("adminService")
@Transactional
public class AAdminServiceImpl implements IAAdminService {

    @Autowired
    private IAAdminDao dao;
    @Autowired
    private IARolesDao rolesDao;

    @Override
    public Integer doStatus(Integer id) throws Exception {
        if (dao.findById(id).getIs_ban() == 1)
            return dao.activateAdmin(id);
        else
            return dao.inactivateAdmin(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AAdmin admin;
        User user = null;
        try {
            admin = dao.findByUsernameAuth(username);
            user = new User(admin.getUsername(), admin.getPassword(), admin.getIs_ban() != 1, true, true, true, getAuthority(admin));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    private List<SimpleGrantedAuthority> getAuthority(AAdmin admin) throws Exception {
        if (admin == null)
            return null;
        List<String> roles = Arrays.asList(admin.getRoleid().split(","));
        List<SimpleGrantedAuthority> simpleGrantedAuthority = new ArrayList<>();
        List<ARoles> list = roles.parallelStream().map(e -> {
            ARoles role = null;
            try {
                role = rolesDao.findById(Integer.parseInt(e));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return role;
        }).collect(Collectors.toList());

        list.stream().forEach(e -> System.out.println(e));

        list.stream().forEach(e -> simpleGrantedAuthority.add(new SimpleGrantedAuthority("ROLE_" + e.getRole())));
        return simpleGrantedAuthority;
    }

    @Override
    public Integer saveOrUpdate(AAdmin admin) throws Exception {
        Integer result = 0;
        if (admin.getId() == null) {
            admin.setDate(new Date());
            result = dao.save(admin);
        } else {
            result = dao.update(admin);
        }
        return result;
    }

    @Override
    public Integer delete(Integer id) throws Exception {
        return dao.delete(id);
    }

    @Override
    public List<AAdmin> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public List<AAdmin> findByUsername(String username, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByUsername(username);
    }

    @Override
    public AAdmin findById(Integer id) throws Exception {
        PageHelper.startPage(1, MyConstants.PAGE_SIZE);
        return dao.findById(id);
    }

    @Override
    public List<AAdmin> findByRole(Integer roleId, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByRoleId(roleId);
    }

    @Override
    public List<AAdmin> findByBan(Integer isBan, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByBan(isBan);
    }
}
