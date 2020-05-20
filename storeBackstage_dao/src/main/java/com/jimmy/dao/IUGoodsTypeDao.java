package com.jimmy.dao;

import com.jimmy.domain.UGoodsType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IUGoodsTypeDao {

    @Select("select * from u_goodstype")
    List<UGoodsType> findAll() throws Exception;

    @Select("select * from u_goodstype where id = #{id}")
    UGoodsType findById(Integer id) throws Exception;

    @Select("select * from u_goodstype where name like concat('%', #{name}, '%')")
    List<UGoodsType> findByName(String name) throws Exception;

    @Insert("insert into u_goodstype" +
            "(name, parent, url)" +
            "values" +
            "(#{name}, #{parent}, #{url})")
    Integer save(UGoodsType type) throws Exception;

    @Update("update u_goodstype set" +
            "name = #{name}," +
            "parent = #{parent}," +
            "url = #{url}" +
            " where id = #{id}")
    Integer update(UGoodsType type) throws Exception;

    @Delete("delete from u_goodstype")
    Integer delete(Integer id) throws Exception;
}
