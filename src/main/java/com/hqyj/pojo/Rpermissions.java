package com.hqyj.pojo;

import com.hqyj.realm.MyRealm;
import com.hqyj.util.MyPage;

public class Rpermissions extends MyPage {
    private Integer id;

    private Integer rId;

    private Integer pId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }
}