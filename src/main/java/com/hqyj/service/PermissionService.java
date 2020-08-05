package com.hqyj.service;

import com.hqyj.pojo.Permissions;
import com.hqyj.pojo.Reader;

import java.util.HashMap;
import java.util.List;

public interface PermissionService {
    int add(Permissions p);

    List<Permissions> queryAll();

    int del(Integer i);

    Permissions selectById(int i);

    int update(Permissions p);

    List<Permissions> selectPermissionByRId(Reader r);
}
