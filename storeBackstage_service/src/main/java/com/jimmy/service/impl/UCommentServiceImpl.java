package com.jimmy.service.impl;

import com.github.pagehelper.PageHelper;
import com.jimmy.dao.IUCommentDao;
import com.jimmy.domain.UComment;
import com.jimmy.service.IUCommentService;
import com.jimmy.utils.MyConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UCommentServiceImpl implements IUCommentService {

    @Autowired
    private IUCommentDao dao;

    @Override
    public List<UComment> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findAll();
    }

    @Override
    public UComment findById(Integer id) throws Exception {
        return dao.findById(id);
    }

    @Override
    public List<UComment> findByContent(String content, Integer page) throws Exception {
        PageHelper.startPage(page, MyConstants.PAGE_SIZE);
        return dao.findByContent(content);
    }
}
