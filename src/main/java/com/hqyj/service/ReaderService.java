package com.hqyj.service;

import com.hqyj.pojo.Borrowing;
import com.hqyj.pojo.Reader;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName ReaderService.java
 * @Description TODO
 * @createTime 2020年08月03日 18:48:00
 */
public interface ReaderService {
    String login(Reader reader);

    int regist(Reader reader);

    int updatePassword(Reader reader);

    HashMap<String,Object> selectByPage(Reader reader);

    HashMap<String, Object> queryReader(Reader r);

    Reader selectById(int i);

    HashMap<String, Object> selectLike(Reader r);

    int addAdmin(Reader r);

    int del(Reader r);

    HashMap<String, Object> queryAdmin(Reader r);
    //查看个人信息
    Reader seleteReaderById(int id);
    //查询借阅未还信息
    HashMap<String, Object> selectBwBookByrId(Borrowing borrowing, int id);
    //查询借阅已还信息
    HashMap<String, Object> selectBwBookByrIdjl(Borrowing borrowing, int id);
    //修改个人信息
    int update(Reader reader);
    //还书
    String huanshu(List<String> list, int reaId) throws ParseException;

    Reader selectByUname(String rName);
}
