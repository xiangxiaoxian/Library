package com.hqyj.pojo;

import java.util.Date;

public class Borrowing {
    private Integer bId;

    private Integer rId;

    private Integer tId;

    private Date bTime;

    private Date bRtime;

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

    public Date getbTime() {
        return bTime;
    }

    public void setbTime(Date bTime) {
        this.bTime = bTime;
    }

    public Date getbRtime() {
        return bRtime;
    }

    public void setbRtime(Date bRtime) {
        this.bRtime = bRtime;
    }

    public Date getbLimit() {
        return bLimit;
    }

    public void setbLimit(Date bLimit) {
        this.bLimit = bLimit;
    }
}