package com.hqyj.mapper;

import com.hqyj.pojo.Administrator;

public interface AdministratorMapper {
    int deleteByPrimaryKey(Integer mId);

    int insert(Administrator record);

    int insertSelective(Administrator record);

    Administrator selectByPrimaryKey(Integer mId);

    int updateByPrimaryKeySelective(Administrator record);

    int updateByPrimaryKey(Administrator record);

}