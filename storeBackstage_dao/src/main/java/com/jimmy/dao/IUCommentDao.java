package com.jimmy.dao;

import com.jimmy.domain.UComment;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUCommentDao {

    @Select("select * from u_comment")
    List<UComment> findAll() throws Exception;

    @Select("select * from u_comment where id = #{id}")
    UComment findById(Integer id) throws Exception;

    @Select("select * from u_comment where content like concat('%', #{content}, '%')")
    List<UComment> findByContent(String content) throws Exception;

}
