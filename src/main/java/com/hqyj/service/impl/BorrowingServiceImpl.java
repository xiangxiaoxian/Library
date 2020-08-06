package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.mapper.BorrowingMapper;
import com.hqyj.pojo.Borrowing;
import com.hqyj.service.BorrowingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BorrowingServiceImpl implements BorrowingService {
    @Autowired
    BorrowingMapper bwMapper;
    public HashMap selectByPage(Borrowing borrowing) {
        PageHelper.startPage(borrowing.getPage(),borrowing.getRow());
        List<Borrowing> list = bwMapper.selectByPage(borrowing);
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
