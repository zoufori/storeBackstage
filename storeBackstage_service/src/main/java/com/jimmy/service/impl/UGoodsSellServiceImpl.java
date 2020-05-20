package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUGoodsSellDao;
import com.jimmy.domain.UGoodsSell;
import com.jimmy.service.IUGoodsSellService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UGoodsSellServiceImpl implements IUGoodsSellService {

    @Autowired
    private IUGoodsSellDao dao;

    @Override
    public List<UGoodsSell> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public UGoodsSell findById(Integer id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<UGoodsSell> findByDate(String date, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByDate(date);
    }

    @Override
    public List<UGoodsSell> findByTimePeriod(String fromTime, String toTime, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByTimePeriod(fromTime, toTime);
    }
}
