package com.jimmy.service;

import com.jimmy.domain.UOrders;

import java.util.List;

public interface IUOrdersService {

    List<UOrders> findAll(Integer page) throws Exception;

    UOrders findById(Integer id) throws Exception;

    List<UOrders> findByOrderTime(String time, Integer page) throws Exception;

    List<UOrders> findByOrderTimePeriod(String fromTime, String toTime, Integer page) throws Exception;

    List<UOrders> findByReceiveTime(String time, Integer page) throws Exception;

    List<UOrders> findByReceiveTimePeriod(String fromTime, String toTime, Integer page) throws Exception;
}
