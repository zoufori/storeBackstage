package com.jimmy.dao;

import com.jimmy.domain.UOrders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUOrdersDao {

    @Select("select * from u_orders")
    List<UOrders> findAll() throws Exception;

    @Select("select * from u_orders where id = #{id}")
    UOrders findById(Integer id) throws Exception;

    @Select("select * from u_orders where order_time like concat('%',#{time}, '%')")
    List<UOrders> findByOrderTime(String time) throws Exception;

    @Select("select * from u_orders where order_time between #{fromTime} to #{toTime}")
    List<UOrders> findByOrderTimePeriod(String fromTime, String toTime) throws Exception;

    @Select("select * from u_orders where receive_time like concat('%',#{time},'%')")
    List<UOrders> findByReceiveTime(String time) throws Exception;

    @Select("select * from u_orders where receive_time between #{fromTime} to #{toTime}")
    List<UOrders> findByReceiveTimePeriod(String fromTime, String toTime) throws Exception;

}
