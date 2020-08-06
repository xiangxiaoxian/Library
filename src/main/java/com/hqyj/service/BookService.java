package com.hqyj.service;

import com.hqyj.pojo.Book;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName BookService.java
 * @Description TODO
 * @createTime 2020年08月05日 09:21:00
 */
public interface BookService {
    HashMap<String, Object> select(Book book);
    //查询分页
    HashMap<String, Object> selectByPage (Book book,String s);
    //借书
    String borrow(List<String> list,int reaId) throws ParseException;
    //删除记录
    int delall(List list);

    int add(Book book);

    int del(int id);

    int update(Book book);
}
