package com.hqyj.service;

import com.hqyj.pojo.Book;

import java.util.HashMap;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName BookService.java
 * @Description TODO
 * @createTime 2020年08月05日 09:21:00
 */
public interface BookService {
    HashMap<String, Object> select(Book book);
}
