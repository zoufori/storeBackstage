package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUUsersDao;
import com.jimmy.domain.UUsers;
import com.jimmy.service.IUUsersService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service()
@Transactional
public class UUsersServiceImpl implements IUUsersService{

    @Autowired
    private IUUsersDao usersDao;

    @Override
    public List<UUsers> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return usersDao.findAll();
    }

    @Override
    public UUsers findById(Integer id) throws Exception {
        return usersDao.findById(id);
    }

    @Override
    public List<UUsers> findByUsername(String username, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return usersDao.findByUsername(username);
    }

    @Override
    public Integer saveOrUpdate(UUsers users) throws Exception {
        return users.getId() == null ? usersDao.save(users) : usersDao.update(users);
    }

    @Override
    public Integer delete(Integer id) throws Exception {
        return usersDao.delete(id);
    }

    @Override
    public Integer doStatus(Integer id) throws Exception{
        if (usersDao.findById(id).getIs_ban() == 1)
            return usersDao.start(id);
        else
            return usersDao.stop(id);
    }
}
