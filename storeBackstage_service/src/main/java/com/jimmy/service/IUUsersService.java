package com.jimmy.service;

import com.jimmy.domain.UUsers;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUUsersService{

    List<UUsers> findAll(Integer page) throws Exception;

    UUsers findById(Integer id) throws Exception;

    List<UUsers> findByUsername(String username, Integer page) throws Exception;

    Integer saveOrUpdate(UUsers users) throws Exception;

    Integer delete(Integer id) throws Exception;

    Integer doStatus(Integer id) throws Exception;
}
