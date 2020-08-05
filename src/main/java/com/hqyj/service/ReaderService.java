package com.hqyj.service;

import com.hqyj.pojo.Reader;

import java.util.HashMap;

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
}
