package com.jimmy.dao;

import com.jimmy.domain.UUsers;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IUUsersDao {

    @Select("select * from u_users")
    List<UUsers> findAll() throws Exception;

    @Select("select * from u_users where id = #{id}")
    UUsers findById(Integer id) throws Exception;

    @Select("select * from u_users where username like concat('%', #{username}, '%')")
    List<UUsers> findByUsername(String username) throws Exception;

    @Insert("insert into u_users" +
            "(username, password, telephone, email, head_img, gender, address, money, role, date, is_ban) values" +
            "(#{username},#{password}, #{telephone}, #{email}, #{head_img}, #{gender}, #{address}, #{money}, #{role}, #{date}, #{is_ban})")
    Integer save(UUsers users) throws Exception;

    @Update("update u_users set" +
            "username = #{username}," +
            "password = #{password}," +
            "telephone = #{telephone}," +
            "email = #{email}," +
            "head_img = #{head_img}," +
            "gender = #{gender}," +
            "address = #{address}," +
            "role = #{role}," +
            "date = #{date}," +
            "money = #{money}," +
            "is_ban = #{is_ban}" +
            "where id = #{id}")
    Integer update(UUsers users) throws Exception;

    @Delete("delete from u_users where id = #{id}")
    Integer delete(Integer id) throws Exception;

    @Update("update u_users set is_ban = 2 where id = #{id}")
    Integer start(Integer id) throws Exception;

    @Update("update u_users set is_ban = 1 where id = #{id}")
    Integer stop(Integer id) throws Exception;
}
