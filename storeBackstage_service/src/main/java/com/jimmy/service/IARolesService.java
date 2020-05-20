package com.jimmy.service;

import com.jimmy.domain.ARoles;

import java.util.List;

public interface IARolesService {

    List<ARoles> findAll(Integer page) throws Exception;

    ARoles findById(Integer id) throws Exception;

    List<ARoles> findByRole(String role, Integer page) throws Exception;

    Integer saveOrUpdate(ARoles roles) throws Exception;

    Integer delete(Integer id) throws Exception;

}
