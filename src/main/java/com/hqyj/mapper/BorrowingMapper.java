package com.hqyj.mapper;

import com.hqyj.pojo.Borrowing;

public interface BorrowingMapper {
    int deleteByPrimaryKey(Integer bId);

    int insert(Borrowing record);

    int insertSelective(Borrowing record);

    Borrowing selectByPrimaryKey(Integer bId);

    int updateByPrimaryKeySelective(Borrowing record);

    int updateByPrimaryKey(Borrowing record);
}