package com.hqyj.mapper;

import com.hqyj.pojo.Borrowing;

import java.util.List;

public interface BorrowingMapper {
    int deleteByPrimaryKey(Integer bId);

    int insert(Borrowing record);

    int insertSelective(Borrowing record);

    Borrowing selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(Borrowing record);

    int updateByPrimaryKey(Borrowing record);
    //查询借书未还
    List<Borrowing> selectBwBookByrId(int rId);
    //查询借书已还
    List<Borrowing> selectBwBookByrIdjl(int rId);

    //批量删除
    int delall(List list);

    List<Borrowing> selectByPage(Borrowing borrowing);
}