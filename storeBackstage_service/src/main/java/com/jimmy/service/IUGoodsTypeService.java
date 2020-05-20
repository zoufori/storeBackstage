package com.jimmy.service;

import com.jimmy.domain.UGoods;
import com.jimmy.domain.UGoodsType;

import java.util.List;

public interface IUGoodsTypeService {

    List<UGoodsType> findAll(Integer page) throws Exception;

    List<UGoodsType> findAllRaw() throws Exception;

    UGoodsType findById(Integer id) throws Exception;

    List<UGoodsType> findByName(String name, Integer page) throws Exception;

    Integer saveOrUpdate(UGoodsType goodsType) throws Exception;

    Integer delete(Integer id) throws Exception;

}
