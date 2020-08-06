package com.hqyj.mapper;

import com.hqyj.pojo.Reader;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface ReaderMapper {
    int deleteByPrimaryKey(Integer rId);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Integer rId);

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);

    Reader queryReaderByRName(String username);

    List<Reader> selectByPage(Reader reader);
    //      查询所有人信息
    List<Reader> selectReader();
    //      通过姓名模糊查询
    List<Reader> selectLike(Reader r);
    //      查询所有管理员信息
    List<Reader> selectAdmin();

    Reader selectByPrimaryKey01(String rName);
}