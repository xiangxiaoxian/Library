package com.hqyj.mapper;

import com.hqyj.pojo.Permissions;
import com.hqyj.pojo.Reader;
import com.hqyj.pojo.Rpermissions;

import java.util.List;

public interface RpermissionsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Rpermissions record);

    int insertSelective(Rpermissions record);

    Rpermissions selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Rpermissions record);

    int updateByPrimaryKey(Rpermissions record);

    int insertAdmin(Reader r);

    int deleteByRId(Reader r);

    List<Permissions> selectPermissionByRId(Reader r);
}