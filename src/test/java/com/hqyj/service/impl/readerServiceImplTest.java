package com.hqyj.service.impl;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author admin
 * @version 1.0.0
 * @ClassName readerServiceImplTest.java
 * @Description TODO
 * @createTime 2020年08月05日 08:39:00
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring.xml"})
public class readerServiceImplTest {
    @Autowired
    private ReaderServiceImpl rm;

}