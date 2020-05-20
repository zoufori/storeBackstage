package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUGoodsDao;
import com.jimmy.domain.UGoods;
import com.jimmy.service.IUGoodsService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UGoodsServiceImpl implements IUGoodsService {

    @Autowired
    private IUGoodsDao dao;

    @Override
    public List<UGoods> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public UGoods findById(Integer id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<UGoods> findByName(String name, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByName(name);
    }

    @Override
    public Integer saveOrUpdate(UGoods goods) throws Exception {
        return goods.getId() == null ? dao.save(goods) : dao.update(goods);
    }

    @Override
    public Integer delete(Integer id) throws Exception {
        return dao.delete(id);
    }
}
