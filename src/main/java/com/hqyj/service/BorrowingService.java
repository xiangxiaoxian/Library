package com.hqyj.service;

import com.hqyj.pojo.Borrowing;

import java.util.HashMap;

public interface BorrowingService {

    HashMap selectByPage(Borrowing borrowing);
}
