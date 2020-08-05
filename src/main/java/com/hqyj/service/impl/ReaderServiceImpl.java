package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.mapper.ReaderMapper;
import com.hqyj.mapper.RpermissionsMapper;
import com.hqyj.pojo.Reader;
import com.hqyj.service.ReaderService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName readerServiceImpl.java
 * @Description TODO
 * @createTime 2020年08月03日 18:48:00
 */
@Service
public class ReaderServiceImpl implements ReaderService {
    @Autowired
    private ReaderMapper rm;
    @Autowired
    private RpermissionsMapper rpm;

    @Override
    public String login(Reader reader) {
        //拿到用户
        Subject s= SecurityUtils.getSubject();
        if (!s.isAuthenticated()) {
            UsernamePasswordToken utp = new UsernamePasswordToken(reader.getrName(), reader.getrPassword());
            utp.setRememberMe(true);
            //进行认证
            try {
                s.login(utp);
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                //登录成功
                //保存用户名在session
                s.getSession().setAttribute("rName",reader.getrName());
                s.getSession().setAttribute("LOGINTIME",simpleDateFormat.format(new Date()));
                System.out.println("认证成功");
                return "success";
            }catch (AuthenticationException e){
                //登录失败
                return "error";
            }
        }
        return "false";
    }

    @Override
    public int regist(Reader reader) {
        return rm.insertSelective(reader);
    }

    @Override
    public int updatePassword(Reader reader) {
        reader.setrId(rm.queryReaderByRName(reader.getrName()).getrId());
        reader.setrSex(rm.queryReaderByRName(reader.getrName()).getrSex());
        try {
            reader.setrBirthday(rm.queryReaderByRName(reader.getrName()).getrBirthday());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        reader.setrContact(rm.queryReaderByRName(reader.getrName()).getrContact());
        reader.setrEmail(rm.queryReaderByRName(reader.getrName()).getrEmail());
        reader.setrCredibility(rm.queryReaderByRName(reader.getrName()).getrCredibility());
        reader.setrNumber(rm.queryReaderByRName(reader.getrName()).getrNumber());
        return rm.updateByPrimaryKeySelective(reader);
    }

    /*分页查询*/
    public HashMap<String,Object> selectByPage(Reader reader) {
        PageHelper.startPage(reader.getPage(),reader.getRow());
        List<Reader> list = rm.selectByPage(reader);
        PageInfo pageInfo = new PageInfo(list);
        HashMap<String,Object> map = new HashMap<String, Object>();
        if(pageInfo.getPageNum()==1){
            pageInfo.setPrePage(1);
        }else if(pageInfo.getPageNum()==pageInfo.getLastPage()){
            pageInfo.setNextPage(pageInfo.getLastPage());
        }
        map.put("list",pageInfo.getList());
        map.put("pageNum",pageInfo.getTotal());
        map.put("prePage",pageInfo.getPrePage());
        map.put("nextPage",pageInfo.getNextPage());
        map.put("lastPage",pageInfo.getLastPage());
        map.put("firstPage",pageInfo.getFirstPage());
        return map;
    }
    public HashMap<String, Object> queryReader(Reader r) {
        PageHelper.startPage(r.getPage(), r.getRow());
        List<Reader> list = rm.selectReader();
        PageInfo<Reader> pageInfo = new PageInfo<Reader>(list);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);

        //        首页
        map.put("first", pageInfo.getFirstPage());
//        上一页
        if (pageInfo.isIsFirstPage() == false) {
            map.put("prePage", pageInfo.getPrePage());
        } else {
            map.put("prePage", pageInfo.getFirstPage());
        }
//        下一页
        if (pageInfo.isIsLastPage() == false) {
            map.put("next", pageInfo.getNextPage());
        } else {
            map.put("next", pageInfo.getPages());
        }
//        当前页数
        map.put("num", pageInfo.getPageNum());
//        尾页
        map.put("end", pageInfo.getLastPage());
//        总页数
        map.put("pages", pageInfo.getPages());
//        总数据数
        map.put("total", pageInfo.getTotal());
        return map;
    }

    public Reader selectById(int i) {
        return rm.selectByPrimaryKey(i);
    }

    public HashMap<String, Object> selectLike(Reader r) {
        List<Reader> list = rm.selectLike(r);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);
        return map;
    }

    public int addAdmin(Reader r) {
        return rpm.insertAdmin(r);
    }

    public int del(Reader r) {
        return rpm.deleteByRId(r);
    }

    public HashMap<String, Object> queryAdmin(Reader r) {
        PageHelper.startPage(r.getPage(),r.getRow());
        List<Reader> list = rm.selectAdmin();
        PageInfo<Reader> pageInfo = new PageInfo<Reader>(list);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("list", list);

        //        首页
        map.put("first", pageInfo.getFirstPage());
        //        上一页
        if (pageInfo.isIsFirstPage() == false) {
            map.put("prePage", pageInfo.getPrePage());
        } else {
            map.put("prePage", pageInfo.getFirstPage());
        }
        //        下一页
        if (pageInfo.isIsLastPage() == false) {
            map.put("next", pageInfo.getNextPage());
        } else {
            map.put("next", pageInfo.getPages());
        }
        //        当前页数
        map.put("num", pageInfo.getPageNum());
        //        尾页
        map.put("end", pageInfo.getLastPage());
        //        总页数
        map.put("pages", pageInfo.getPages());
        //        总数据数
        map.put("total", pageInfo.getTotal());
        return map;
    }
}
