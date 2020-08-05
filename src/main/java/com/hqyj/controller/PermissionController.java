package com.hqyj.controller;

import com.hqyj.pojo.Permissions;
import com.hqyj.service.PermissionService;
import com.hqyj.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@RequestMapping("pc")
@Controller
public class PermissionController {
    @Autowired
    private ReaderService rs;
    @Autowired
    private PermissionService ps;
    //    管理页面
    @RequestMapping("login.do")
    public String loginBook(){
        return "index";
    }
    //      获取权限信息
    @RequestMapping("manage.do")
    public String manage(ModelMap map){
        List<Permissions> list = ps.queryAll();
        map.addAttribute("list",list);
//        System.out.println("list = " + list);
        return "permissions/managepermission";
    }

    //      删除权限
    @RequestMapping("del.do")
    public String del(@RequestParam("permissionsId") int i,ModelMap map){
        int i1 = ps.del(i);
        List<Permissions> list = ps.queryAll();
        map.addAttribute("list",list);
        return "permissions/managepermission";
    }
    //      添加权限页面
    @RequestMapping("add.do")
    public String addErmissions(){
        return "permissions/addpermissions";
    }
    //      添加权限
    @RequestMapping("addpermissions.do")
    public String addpermissions(Permissions p, ModelMap map){
        if (ps.add(p)>0) {
            return "redirect:manage.do";
        }else{
            return "permissions/addpermissions";
        }
    }

    //      修改权限页面
    @RequestMapping("update.do")
    public String update(@RequestParam("permissionsId") int i, ModelMap map){
//        获取当前id的数据
        Permissions p = ps.selectById(i);
        map.addAttribute("p",p);
//       获取所有权限数据
        List<Permissions> list = ps.queryAll();

        map.addAttribute("list",list);
        return "permissions/updatepermissions";
    }

    //      修改权限
    @RequestMapping("updatepermissions.do")
    public String updatepermissions(Permissions p){
        int i = ps.update(p);
        if (i>0){
            return "redirect:manage.do";
        }else{
            return "permissions/updatepermissions";
        }
    }
}
