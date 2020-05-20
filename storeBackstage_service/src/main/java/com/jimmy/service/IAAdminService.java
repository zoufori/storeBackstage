package com.jimmy.service;

import com.jimmy.domain.AAdmin;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IAAdminService extends UserDetailsService {

    List<AAdmin> findAll(Integer page) throws Exception;

    List<AAdmin> findByUsername(String username, Integer page) throws Exception;

    AAdmin findById(Integer id) throws Exception;

    List<AAdmin> findByRole(Integer roleId, Integer page) throws Exception;

    List<AAdmin> findByBan(Integer isBan, Integer page) throws Exception;

    Integer saveOrUpdate(AAdmin admin) throws Exception;

    Integer delete(Integer id) throws Exception;

    Integer doStatus(Integer id) throws Exception;
}
