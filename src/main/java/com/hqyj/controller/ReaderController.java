package com.hqyj.controller;


import com.hqyj.pojo.Borrowing;
import com.hqyj.pojo.Permissions;
import com.hqyj.pojo.Reader;
import com.hqyj.service.PermissionService;
import com.hqyj.service.ReaderService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("rc")
public class ReaderController {
    @Autowired
    ReaderService rs;
    @Autowired
    private PermissionService ps;
    /*跳转用户信息页面*/
    @RequestMapping("userList.do")
    public String list(Reader reader, ModelMap modelMap){
        HashMap<String,Object> result = rs.selectByPage(reader);
        modelMap.addAttribute("rnum",result.get("pageNum"));
        return "reader/member-list";
    }
    /*用户信息分页查询*/
    @RequestMapping("userList.ajax")
    @ResponseBody
    public HashMap userList(ModelMap modelMap, Reader reader){
        /*reader.setrId(2);*/
        System.err.println(reader);
        HashMap<String,Object> result = rs.selectByPage(reader);
        System.err.println(result.toString());
        return result;
    }
    //   权限分配页面
    @RequestMapping("FPP.do")
    public String FPPermissions(Reader r, ModelMap map) {
//        获取用户信息
        HashMap<String, Object> listMap = rs.queryReader(r);
        map.addAttribute("xiang", listMap);
        map.addAttribute("rId", r.getrId());
        map.addAttribute("rName", r.getrName());
        return "reader/fppermission";
    }

    //    通过姓名模糊查询所有信息
    @RequestMapping("like.do")
    public String likePermissions(Reader r, ModelMap map) {
//        获取条件查询信息
        map.addAttribute("rName", r.getrName());
        if(r.getrName()!=null){
            r.setrName("%" + r.getrName() + "%");
        }else {
            r.setrName("%%");
        }
        HashMap<String, Object> list = rs.selectLike(r);
        map.addAttribute("xiang", list);
        map.addAttribute("rId", r.getrId());
        return "reader/fppermission";
    }
    //    通过姓名模糊查询管理员信息
/*
    @RequestMapping("likeAdmin.do")
    public String likeAdmin(Reader r, ModelMap map){
//        获取条件查询信息
        r.setrName("%"+r.getrName()+"%");
        HashMap<String, Object> list = rs.selectLikeAdmin(r);
        map.addAttribute("xiang",list);
        map.addAttribute("rId",r.getrId());
        map.addAttribute("rName",r.getrName());
        return "reader/fppermission";
    }
*/

    //   设为管理员
    @RequestMapping("setAdmin.do")
    public String setAdmin(Reader r) {
        if (rs.addAdmin(r) > 0) {
            return "redirect:query.do";
        } else {
            return "error";
        }
    }

    //   取消管理员
    @RequestMapping("cancel.do")
    public String cancelAdmin(Reader r) {
        if (rs.del(r) > 0) {
            return "redirect:query.do";
        } else {
            return "error";
        }
    }

    //   查询管理员信息
    @RequestMapping("query.do")
    public String queryAdmin(Reader r, ModelMap map) {
        HashMap<String, Object> listMap = rs.queryAdmin(r);
        map.addAttribute("xiang", listMap);
        return "reader/queryadmin";
    }

    //    设置权限
//   查询管理员信息
    @RequestMapping("setper.do")
    public String setPermission(Reader r, ModelMap map) {
        List<Permissions> list = ps.selectPermissionByRId(r);
        System.out.println("list = " + list);
        return "reader/queryadmin";
    }
    //进入到个人信息页面
    @RequestMapping("rx.do")
    public String readerx(Reader reader, ModelMap map){
//        System.err.println("进来了");
        Subject s= SecurityUtils.getSubject();
        Integer ss=(Integer) s.getSession().getAttribute("ID");
        Reader rea=rs.seleteReaderById(ss);
        map.addAttribute("rea",rea);
        return "reader/reader";
    }

    //跳转到修改个人信息页面
    @RequestMapping("updatePage.do")
    public String updatePage(@RequestParam("id") int id, ModelMap map){
        Reader reader = rs.seleteReaderById(id);
        map.addAttribute("rea",reader);
        return "reader/updatePage";
    }

    //读者修改个人信息
    @RequestMapping(method = RequestMethod.POST, value = "update.do")
    public String update(Reader reader, ModelMap map){
        System.out.println("----------->"+reader.toString());
        if (rs.update(reader)>0){
//            Reader rea = rs.seleteReaderById(reader.getrId());
//            map.addAttribute("rea",rea);
            map.addAttribute("info","修改成功！");
            return "redirect:rx.do";
        }else {
            Reader rea = rs.seleteReaderById(reader.getrId());
            map.addAttribute("rea",rea);
            map.addAttribute("info","修改失败！");
            return "reader/updatePage";
        }
    }

    //跳转到借书信息页面
    @RequestMapping("bookBw.do")
    public String bookBw(){
        return "reader/readerBw";
    }

    //查询借书未还信息
    @RequestMapping("bookBw.ajax")
    @ResponseBody
    public HashMap bwList(Borrowing borrowing){
        Subject s= SecurityUtils.getSubject();
        Integer ss=(Integer) s.getSession().getAttribute("ID");
        int id= ss;
        return rs.selectBwBookByrId(borrowing,id);
    }

    //查询借书历史记录并分页
    @RequestMapping("bookBwjl.ajax")
    @ResponseBody
    public HashMap bwListjl(Borrowing borrowing){
        Subject s= SecurityUtils.getSubject();
        Integer ss=(Integer) s.getSession().getAttribute("ID");
        int id= ss;
        return rs.selectBwBookByrIdjl(borrowing,id);
    }

    //还书
    @RequestMapping("huanshu.ajax")
    @ResponseBody
    public HashMap huanshu(@RequestParam("id") String id) throws ParseException {
        Subject s= SecurityUtils.getSubject();
        Integer ss=(Integer) s.getSession().getAttribute("ID");
        int reaId= ss;
        //把字符串转换集合
        HashMap map = new HashMap();
        System.err.println("还书---->"+id);
        List<String> list = Arrays.asList(id.split(","));
        String info = rs.huanshu(list,reaId);
        map.put("info",info);
        return map;
    }

}
