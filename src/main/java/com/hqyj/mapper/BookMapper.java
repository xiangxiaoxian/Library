package com.hqyj.mapper;

import com.hqyj.pojo.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer tId);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer tId);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> selectByPage(Book book);
    //图书信息查询
    List<Book> selectByPa( String s);

}