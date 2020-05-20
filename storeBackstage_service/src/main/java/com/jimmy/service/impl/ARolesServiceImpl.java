package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IARolesDao;
import com.jimmy.domain.ARoles;
import com.jimmy.service.IARolesService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ARolesServiceImpl implements IARolesService {

    @Autowired
    private IARolesDao rolesDao;

    @Override
    public List<ARoles> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return rolesDao.findAll();
    }

    @Override
    public ARoles findById(Integer id) throws Exception {
        return rolesDao.findById(id);
    }

    @Override
    public List<ARoles> findByRole(String role, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return rolesDao.findByRole(role);
    }

    @Override
    public Integer saveOrUpdate(ARoles roles) throws Exception {
        Integer result = 0;
        if(roles.getId() == null)
            result = rolesDao.save(roles);
        else
            result = rolesDao.update(roles);
        return result;
    }

    @Override
    public Integer delete(Integer id) throws Exception {
        return rolesDao.delete(id);
    }
}
