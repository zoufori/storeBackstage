package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUOrdersDao;
import com.jimmy.domain.UOrders;
import com.jimmy.service.IUOrdersService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UOrdersServiceImpl implements IUOrdersService {

    @Autowired
    private IUOrdersDao dao;

    @Override
    public List<UOrders> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public UOrders findById(Integer id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<UOrders> findByOrderTime(String time, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByOrderTime(time);
    }

    @Override
    public List<UOrders> findByOrderTimePeriod(String fromTime, String toTime, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByOrderTimePeriod(fromTime, toTime);
    }

    @Override
    public List<UOrders> findByReceiveTime(String time, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByReceiveTime(time);
    }

    @Override
    public List<UOrders> findByReceiveTimePeriod(String fromTime, String toTime, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByOrderTimePeriod(fromTime, toTime);
    }
}
