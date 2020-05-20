package com.jimmy.dao;

import com.jimmy.domain.UGoods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IUGoodsDao {

    @Select("select * from u_goods")
    List<UGoods> findAll() throws Exception;

    @Select("select * from u_goods where id = #{id}")
    UGoods findById(Integer id) throws Exception;

    @Select("select * from u_goods where name like concat('%',#{name},'%')")
    List<UGoods> findByName(String name) throws Exception;

    @Insert("insert into u_goods" +
            "(name, typeid, discount, price, `desc`, thumb_img, big_img, content_img, content, commentid, inventory, clicked, address, date, is_recommend, month_sellid)" +
            "values" +
            "(#{name}, #{typeid}, #{discount}, #{price}, #{desc}, #{thumb_img}, #{big_img}, #{content_img}, #{content}, #{commentid}, #{inventory}, #{clicked}, #{address}, #{date}, #{is_recommend}, #{month_sellid})")
    Integer save(UGoods goods) throws Exception;

    @Update("update u_goods set " +
            "name = #{name}," +
            "typeid = #{typeid}," +
            "discount = #{discount}," +
            "price = #{price}," +
            "`desc` = #{desc}," +
            "thumb_img = #{thumb_img}," +
            "big_img = #{big_img}," +
            "content_img = #{content_img}," +
            "content = #{content}," +
            "commentid = #{commentid}," +
            "inventory = #{inventory}," +
            "clicked = #{clicked}," +
            "address = #{address}," +
            "date = #{date}," +
            "is_recommend = #{is_recommend}," +
            "month_sellid = #{month_sellid}" +
            "where id = #{id}")
    Integer update(UGoods goods) throws Exception;

    @Delete("delete from u_goods where id = #{id}")
    Integer delete(Integer id) throws Exception;
}
