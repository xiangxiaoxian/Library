package com.hqyj.pojo;

import com.hqyj.util.MyPage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Borrowing extends MyPage {
    private Integer bId;

    private Integer rId;

    private Integer tId;

    private Date bTime;

    private Date bRtime;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    private Book book;

    private Reader reader;
    @Override
    public String toString() {
        return "Borrowing{" +
                "bId=" + bId +
                ", rId=" + rId +
                ", tId=" + tId +
                ", bTime=" + bTime +
                ", bRtime=" + bRtime +
                ", bLimit=" + bLimit +
                '}';
    }

    public Borrowing() {
    }

    public Borrowing(Integer bId, Integer rId, Integer tId, Date bTime, Date bRtime, Date bLimit) {
        this.bId = bId;
        this.rId = rId;
        this.tId = tId;
        this.bTime = bTime;
        this.bRtime = bRtime;
        this.bLimit = bLimit;
    }

    private Date bLimit;

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String getbTime() {
        if(this.bTime!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(this.bTime);
        }
        return "";
    }

    public void setbTime(String bTime) throws ParseException {
        if(bTime!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.bTime = sdf.parse(bTime);
        }else{
            this.bTime = new Date();
        }
    }

    public String getbRtime() {
        if(this.bRtime!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(this.bRtime);
        }
        return "";
    }

    public void setbRtime(String bRtime) throws ParseException {
        if(bRtime!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.bRtime = sdf.parse(bRtime);
        }else{
            this.bRtime = new Date();
        }
    }

    public String getbLimit() {
        if(this.bLimit!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(this.bLimit);
        }
        return "";
    }

    public void setbLimit(String bLimit) throws ParseException {
        if(bLimit!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.bLimit = sdf.parse(bLimit);
        }else{
            this.bLimit = new Date();
        }
    }
}