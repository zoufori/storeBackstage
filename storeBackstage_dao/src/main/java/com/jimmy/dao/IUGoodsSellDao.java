package com.jimmy.dao;

import com.jimmy.domain.UGoodsSell;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUGoodsSellDao {

    @Select("select * from u_goodssell")
    List<UGoodsSell> findAll() throws Exception;

    @Select("select * from u_goodssell where id = #{id}")
    UGoodsSell findById(Integer id) throws Exception;

    @Select("select * from u_goodssell where date like concat('%', #{date}, '%')")
    List<UGoodsSell> findByDate(String date) throws Exception;

    @Select("select * from u_goodssell where date between #{fromTime} and #{toTime}")
    List<UGoodsSell> findByTimePeriod(String fromTime, String toTime) throws Exception;
}
