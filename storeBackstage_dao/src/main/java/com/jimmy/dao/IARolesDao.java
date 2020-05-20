package com.jimmy.dao;

import com.jimmy.domain.ARoles;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IARolesDao {

    @Select("select * from a_roles")
    List<ARoles> findAll() throws Exception;

    @Select("select * from a_roles where id = #{id}")
    ARoles findById(Integer id) throws Exception;

    @Select("select * from a_roles where role like concat('%',#{role}, '%')")
    List<ARoles> findByRole(String role) throws Exception;

    @Insert("insert into a_roles(role) values (#{role})")
    Integer save(ARoles roles) throws Exception;

    @Update("update a_roles set role = #{role} where id = #{id}")
    Integer update(ARoles roles) throws Exception;

    @Delete("delete from a_roles where id = #{id}")
    Integer delete(Integer id) throws Exception;
}
