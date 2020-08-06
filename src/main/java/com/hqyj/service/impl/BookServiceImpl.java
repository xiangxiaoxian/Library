package com.hqyj.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.mapper.BookMapper;
import com.hqyj.mapper.BorrowingMapper;
import com.hqyj.mapper.ReaderMapper;
import com.hqyj.pojo.Book;
import com.hqyj.pojo.Borrowing;
import com.hqyj.pojo.Reader;
import com.hqyj.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
    @Autowired
    private BorrowingMapper borrowingMapper;
    @Autowired
    private ReaderMapper readerMapper;

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
    //查询分页
    @Override
    public HashMap<String, Object> selectByPage(Book book,String s) {
        PageHelper.startPage(book.getPage(),book.getRow());
        //查询自定义sql
        List<Book> list=bMapper.selectByPa(s);
        //转成分页对象
        PageInfo<Book> pageInfo=new PageInfo<Book>(list);
        //创建数据类型
        HashMap<String,Object> map=new HashMap<String, Object>();
        map.put("list", pageInfo.getList());
        //上一页
        if (pageInfo.isIsFirstPage() == false) {
            map.put("prePage", pageInfo.getPrePage());
        } else {
            map.put("prePage", pageInfo.getFirstPage());
        }
        //下一页
        if (pageInfo.isIsLastPage()) {
            map.put("nextPage", pageInfo.getLastPage());
        } else {
            map.put("nextPage", pageInfo.getNextPage());
        }
        //首页
        map.put("indexPage", pageInfo.getFirstPage());
        //尾页
        map.put("endPage", pageInfo.getLastPage());
        //总页数
        map.put("allPage", pageInfo.getPages());
        //当前页
        map.put("currentPage", pageInfo.getPageNum());
        //总记录数
        map.put("count", pageInfo.getTotal());
        //是否为首页
        map.put("isFirstPage", pageInfo.isIsFirstPage());
        //是否为尾页
        map.put("isLastPage", pageInfo.isIsLastPage());
        return map;
    }
    //借书
    @Override
    public String borrow(List<String> list,int reaId) throws ParseException {
        String info = "";
        int num=0;
        Reader reader = readerMapper.selectByPrimaryKey(reaId);
        if (list.size()<=reader.getrNumber()){
            //遍历拿到的Id
            for (String s:list){
                //建一个Borrowing类存值
                Borrowing borrowing = new Borrowing();
                //将String转换为int
                int ss =Integer.parseInt(s) ;

                Book bk = bMapper.selectByPrimaryKey(ss);
                int bbk = Integer.parseInt(bk.gettInventory());
                if(bbk >0){
                    //添加图书Id
                    borrowing.settId(ss);
                    //借书者ID
                    borrowing.setrId(reaId);
                    //当前时间
                    Date dd = new Date();
                    Calendar rightNow = Calendar.getInstance();
                    //时间格式
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    //时间转换
                    String sd = sdf.format(dd);
                    //添加借书时间
                    borrowing.setbTime(sd);
                    //设置借书期限
                    rightNow.add(Calendar.MONTH,1);//日期加1个月
                    Date ld = rightNow.getTime();
                    String sld = sdf.format(ld);
                    //添加借书期限
                    borrowing.setbLimit(sld);
                    //借书
                    if (borrowingMapper.insertSelective(borrowing)>0){
                        info+=bk.gettName()+"、";
                    }else{
                        info+=bk.gettName()+"失败";
                    }
                    bbk--;
                    bk.settInventory(""+bbk);
                    bMapper.updateByPrimaryKeySelective(bk);
                    num++;
                }else{
                    info+= bk.gettName()+"没有了！！";
                }
            }
        }else{
            info+="你不能借这么多书,你最多还能借"+reader.getrNumber();
        }
        if (num>0){
            int numm=reader.getrNumber()-num;
            reader.setrNumber(numm);
            readerMapper.updateByPrimaryKeySelective(reader);
            info+="借书成功："+num+"本";
        }else{
            info+="借书失败！！";
        }
        return info;
    }
    //删除记录
    @Override
    public int delall(List list) {
        return borrowingMapper.delall(list);
    }

    public int add(Book book) {
        return bMapper.insertSelective(book);
    }

    public int del(int id) {
        return bMapper.deleteByPrimaryKey(id);
    }

    public int update(Book book) {
        return bMapper.updateByPrimaryKeySelective(book);
    }
}
