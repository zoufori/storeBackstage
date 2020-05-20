package com.jimmy.service;

import com.jimmy.domain.UComment;

import java.util.List;

public interface IUCommentService {

    List<UComment> findAll(Integer page) throws Exception;

    UComment findById(Integer id) throws Exception;

    List<UComment> findByContent(String content, Integer page) throws Exception;

}
