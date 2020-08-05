package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.mapper.BookMapper;
import com.hqyj.pojo.Book;
import com.hqyj.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName BookServiceImpl.java
 * @Description TODO
 * @createTime 2020年08月05日 09:21:00
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookMapper bMapper;

    @Override
    public HashMap<String, Object> select(Book book) {
        PageHelper.startPage(book.getPage(),book.getRow());
        List<Book> list = bMapper.selectByPage(book);
        PageInfo pageInfo = new PageInfo(list);
        HashMap<String,Object> map = new HashMap<String, Object>();
        if(pageInfo.getPageNum()==1){
            pageInfo.setPrePage(1);
        }else if(pageInfo.getPageNum()==pageInfo.getLastPage()){
            pageInfo.setNextPage(pageInfo.getLastPage());
        }
        map.put("list",pageInfo.getList());
        map.put("prePage",pageInfo.getPrePage());
        map.put("nextPage",pageInfo.getNextPage());
        map.put("firstPage",pageInfo.getFirstPage());
        map.put("lastPage",pageInfo.getLastPage());
        map.put("pageNum",pageInfo.getTotal());
        return map;
    }
}
