package com.hqyj.service.impl;

import com.hqyj.mapper.PermissionsMapper;
import com.hqyj.mapper.RpermissionsMapper;
import com.hqyj.pojo.Permissions;
import com.hqyj.pojo.Reader;
import com.hqyj.pojo.Rpermissions;
import com.hqyj.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionsMapper pm;
    @Autowired
    private RpermissionsMapper rpm;
    public int add(Permissions p) {
        return pm.insertSelective(p);
    }

    public List<Permissions> queryAll() {
        return pm.selectAll();
    }

    public int del(Integer i) {
        return pm.deleteByPrimaryKey(i);
    }

    public Permissions selectById(int i) {
        return pm.selectByPrimaryKey(i);
    }

    public int update(Permissions p) {
        return pm.updateByPrimaryKeySelective(p);
    }

    public List<Permissions> selectPermissionByRId(Reader r) {
        return rpm.selectPermissionByRId(r);
    }
}
