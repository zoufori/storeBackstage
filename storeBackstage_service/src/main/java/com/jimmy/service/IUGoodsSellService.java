package com.jimmy.service;

import com.jimmy.domain.UGoodsSell;

import java.util.List;

public interface IUGoodsSellService {

    List<UGoodsSell> findAll(Integer page) throws Exception;

    UGoodsSell findById(Integer id) throws Exception;

    List<UGoodsSell> findByDate(String date, Integer page) throws Exception;

    List<UGoodsSell> findByTimePeriod(String fromTime, String toTime, Integer page) throws Exception;

}
