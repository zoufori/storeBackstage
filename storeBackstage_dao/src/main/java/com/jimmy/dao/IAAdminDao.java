package com.jimmy.dao;

import com.jimmy.domain.AAdmin;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IAAdminDao {

    @Select("select * from a_admin")
    List<AAdmin> findAll() throws Exception;

    @Select("select * from a_admin where id = #{id}")
    AAdmin findById(Integer id) throws Exception;

    @Select("select * from a_admin where username like CONCAT('%',#{username},'%')")
    List<AAdmin> findByUsername(String username) throws Exception;

    @Select("select * from a_admin where username = #{username}")
    AAdmin findByUsernameAuth(String username) throws Exception;

    @Select("select * from a_admin where roleid = #{id}")
    List<AAdmin> findByRoleId(Integer id) throws Exception;

    @Select("select * from a_admin where is_ban = #{is_ban}")
    List<AAdmin> findByBan(Integer is_ban) throws Exception;

    @Insert("insert into a_admin(username, password, roleid, date, is_ban) values(#{username}, #{password}, #{roleid}, #{date}, #{is_ban})")
    Integer save(AAdmin admin) throws Exception;

    @Update("update a_admin set " +
            "username = #{username}, " +
            "password = #{password}, " +
            "roleid = #{roleid}, " +
            "date = #{date}, " +
            "is_ban = #{is_ban} " +
            "where id = #{id}")
    Integer update(AAdmin admin) throws Exception;

    @Delete("delete from a_admin where id = #{id}")
    Integer delete(Integer id) throws Exception;

    @Update("update a_admin set is_ban=2 where id = #{id}")
    Integer activateAdmin(Integer id) throws Exception;

    @Update("update a_admin set is_ban = 1 where id = #{id}")
    Integer inactivateAdmin(Integer id) throws Exception;
}
