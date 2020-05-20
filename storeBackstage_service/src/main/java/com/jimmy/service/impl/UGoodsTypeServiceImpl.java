package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUGoodsTypeDao;
import com.jimmy.domain.UGoodsType;
import com.jimmy.service.IUGoodsTypeService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UGoodsTypeServiceImpl implements IUGoodsTypeService {

    @Autowired
    private IUGoodsTypeDao dao;

    @Override
    public List<UGoodsType> findAllRaw() throws Exception {
        return dao.findAll();
    }

    @Override
    public List<UGoodsType> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public UGoodsType findById(Integer id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<UGoodsType> findByName(String name, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByName(name);
    }

    @Override
    public Integer saveOrUpdate(UGoodsType goodsType) throws Exception {
        return goodsType.getId() == null ? dao.save(goodsType) : dao.update(goodsType);
    }

    @Override
    public Integer delete(Integer id) throws Exception {
        return dao.delete(id);
    }
}
