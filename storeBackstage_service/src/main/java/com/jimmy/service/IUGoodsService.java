package com.jimmy.service;

import com.jimmy.domain.UGoods;

import java.util.List;

public interface IUGoodsService {

    List<UGoods> findAll(Integer page) throws Exception;

    UGoods findById(Integer id) throws Exception;

    List<UGoods> findByName(String name, Integer page) throws Exception;

    Integer saveOrUpdate(UGoods goods) throws Exception;

    Integer delete(Integer id) throws Exception;
}
