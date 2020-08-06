package com.hqyj.controller;

import com.hqyj.pojo.Borrowing;
import com.hqyj.service.BorrowingService;
import com.hqyj.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("brc")
public class BorrowingController {
    @Autowired
    BorrowingService bwService;

    @RequestMapping("BorrowingList.do")
    public String Borrowing(Borrowing borrowing, ModelMap modelMap) {
        HashMap<String,Object> result = bwService.selectByPage(borrowing);
        modelMap.addAttribute("bwnum",result.get("pageNum"));
        return "book/borrowing-list";
    }

    @RequestMapping("BorrowingList.ajax")
    @ResponseBody
    public HashMap List(Borrowing borrowing) {
        HashMap list = bwService.selectByPage(borrowing);
        return list;
    }

    @RequestMapping("recall.ajax")
    @ResponseBody
    public String recall(String email) {
        System.err.println(email);
        boolean s = MailUtils.sendMail(email, "您借的书已过归还期，请尽快归还书籍", "书籍归还提示");
        String info = "";
        if (s == true) {
            info = "true";
        } else {
            info = "false";
        }
        return info;
    }
}
