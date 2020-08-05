package com.hqyj.controller;

import com.hqyj.pojo.Reader;
import com.hqyj.realm.MyRealm;
import com.hqyj.service.ReaderService;
import com.hqyj.util.MailUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName LoginController.java
 * @Description TODO
 * @createTime 2020年08月03日 14:09:00
 */
@Controller
public class LoginController {
  @Autowired
  private ReaderService rs;
    //登录界面
    @RequestMapping("return.do")
    public String logins(){
        return "redirect:login.jsp";
    }
    //登录
    @RequestMapping("login.do")
    public String login(Reader reader){
        System.out.println(reader.toString());
        String info=rs.login(reader);
        if (info.equals("success")){
            System.out.println("登录成功");
            return "system/index";
        }
        else {
            return "redirect:login.jsp";
        }
    }
    //注册
    @RequestMapping("regist.do")
    @ResponseBody
    public HashMap regist(Reader reader){
        HashMap map=new HashMap();
        MyRealm myRealm=new MyRealm();
        reader.setrPassword(myRealm.m(reader.getrPassword(),reader.getrName()));
        reader.setrCredibility(100);
        reader.setrNumber(0);
        int n=rs.regist(reader);
        //System.out.println("reader = " + reader.toString());
        return map;
    }

    //忘记密码
    @RequestMapping("forgotPassword.do")
    @ResponseBody
    public HashMap forgotPassword(String rEmail){
       System.out.println("rEmail = " + rEmail);
       HashMap map=new HashMap();
        boolean s=MailUtils.sendMail(rEmail,"<a href='http://localhost:8081/library/updatePassword.do'>点此链接修改密码</a>","密码修改");
        if (s==true){
            map.put("info","true");
        }else {
            map.put("info","false");
        }
        return map;
    }
    //修改密码页面
    @RequestMapping("updatePassword.do")
    public String updatePassword(){
        System.err.println("密码修改");
        return "reader/updatePassword";
    }
    //修改密码
    @RequestMapping("update.do")
    @ResponseBody
    public HashMap update(Reader reader){
        //System.out.println(reader.toString());
        HashMap map=new HashMap();
        MyRealm myRealm=new MyRealm();
        reader.setrPassword(myRealm.m(reader.getrPassword(),reader.getrName()));
        int n=rs.updatePassword(reader);
        if (n!=0){
            map.put("info","true");
        }else {
            map.put("info","false");
        }
        return map;
    }
    //右侧页面
    //跳转
    @RequestMapping("showWelcome.do")
    public String showWelcome(){
        return "system/welcome";
    }
    //登出
    @RequestMapping(value = "logout.do",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String logout(){
        //拿到当前认证的用户
        Subject s= SecurityUtils.getSubject();
        //退出认证
        s.logout();
        return "redirect:login.jsp";
    }
}
