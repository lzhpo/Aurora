package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.mapper.UpdatePWDMapper;
import com.lzhpo.aurora.admin.service.UpdatePWDService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Service
@Transactional
public class UpdatePWDServiceImpl implements UpdatePWDService {

    @Autowired
    private UpdatePWDMapper updatePWDMapper;


    @Override
    public void updatePWD(User user) {
        updatePWDMapper.updatePWD(user);
    }

    @Override
    public String findById(Integer id) {
        return updatePWDMapper.findById(id);
    }


}
