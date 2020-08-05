package com.hqyj.controller;

import com.hqyj.pojo.Book;
import com.hqyj.service.BookService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName BookController.java
 * @Description TODO
 * @createTime 2020年08月05日 09:20:00
 */
@Controller
@RequestMapping("bc")
public class BookController {
    @Autowired
    BookService bService;
    //    挑战图书列表页面
    @RequestMapping("bookList.do")
    public String list(Book book, ModelMap modelMap){
        HashMap<String,Object> result = bService.select(book);
        modelMap.addAttribute("bnum",result.get("pageNum"));
        return "book/book-list";
    }
    //    进行图书分页查询
    @RequestMapping("bookList.ajax")
    @ResponseBody
    public HashMap bookList(Book book){
        System.err.println(book);
        HashMap<String,Object> map = bService.select(book);
        map.put("tName",book.gettName());
        map.put("tAuthor",book.gettAuthor());
        return map;
    }
    @RequestMapping("add.do")
    public String add(){

        return "book/book-add";
    }
    @RequestMapping("add.ajax")
    @ResponseBody
    public HashMap bookAdd(Book book){
        return null;
    }
}
