package com.hqyj.controller;

import com.hqyj.pojo.Book;
import com.hqyj.service.BookService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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
    //图书信息查看
    @RequestMapping("bookLists.do")
    public String bookList(Book book, ModelMap map,String s){
        String ss="";
        if (s==null){
            ss="%%";
        }else {
            ss="%"+s+"%";
        }
        HashMap<String,Object> bookList=bService.selectByPage(book,ss);
        map.addAttribute("bookList",bookList);
        map.addAttribute("s",s);
        return "reader/bookList";
    }
    //借书
    @RequestMapping("borrow.ajax")
    @ResponseBody
    public HashMap borrow(@RequestParam("id") String id) throws ParseException {
        //把字符串转换集合
        HashMap map = new HashMap();
        System.err.println("---->"+id);
        Subject s=SecurityUtils.getSubject();
        Integer ss=(Integer) s.getSession().getAttribute("ID");
        int reaId=ss;
        List<String> list = Arrays.asList(id.split(","));
        String info = bService.borrow(list,reaId);
        map.put("info",info);
        return map;
    }
    //批量删除
    @RequestMapping("deleteAll.ajax")
    @ResponseBody
    public HashMap delAjax(@RequestParam("id") String id){
        System.err.println("id==="+id);
        //把字符串转换集合
        List<String> list = Arrays.asList(id.split(","));
        HashMap  map  = new HashMap();
        if(bService.delall(list)>0){
            map.put("info",true);
        }else{
            map.put("info",false);
        }
        return map;
    }
    @RequestMapping("bookAdd.ajax")
    @ResponseBody
    public String bookAdd(Book book){
        int add = bService.add(book);
        String info = "";
        if(add>0){
            info = "success";
        } else{
            info = "error";
        }
        return info;
    }
    @RequestMapping("del.ajax")
    @ResponseBody
    public String del(int id){
        int i = bService.del(id);
        String info = "";
        if (i>0){
            info="success";
        }else{
            info="error";
        }
        return info;
    }
    @RequestMapping("bookUpdate.ajax")
    @ResponseBody
    public String bookUpdate(Book book){
        System.err.println(book);
        int add = bService.update(book);

        String info = "";
        if(add>0){
            info = "success";
        } else{
            info = "error";
        }
        return info;
    }
}
