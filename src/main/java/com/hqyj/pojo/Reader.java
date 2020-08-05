package com.hqyj.pojo;

import com.hqyj.util.MyPage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Reader extends MyPage {
    private Integer rId;

    private String rName;

    private String rPassword;

    private String rSex;

    private Date rBirthday;

    private String rContact;

    private String rEmail;

    private Integer rCredibility;

    private Integer rNumber;

    @Override
    public String toString() {
        return "Reader{" +
                "rId=" + rId +
                ", rName='" + rName + '\'' +
                ", rPassword='" + rPassword + '\'' +
                ", rSex='" + rSex + '\'' +
                ", rBirthday=" + rBirthday +
                ", rContact='" + rContact + '\'' +
                ", rEmail='" + rEmail + '\'' +
                ", rCredibility=" + rCredibility +
                ", rNumber=" + rNumber +
                '}';
    }

    public Reader() {
    }

    public Reader(Integer rId, String rName, String rPassword, String rSex, Date rBirthday, String rContact, String rEmail, Integer rCredibility, Integer rNumber) {
        this.rId = rId;
        this.rName = rName;
        this.rPassword = rPassword;
        this.rSex = rSex;
        this.rBirthday = rBirthday;
        this.rContact = rContact;
        this.rEmail = rEmail;
        this.rCredibility = rCredibility;
        this.rNumber = rNumber;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrPassword() {
        return rPassword;
    }

    public void setrPassword(String rPassword) {
        this.rPassword = rPassword;
    }

    public String getrSex() {
        return rSex;
    }

    public void setrSex(String rSex) {
        this.rSex = rSex;
    }

    public String getrBirthday() {
        if (this.rBirthday!=null){
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            return simpleDateFormat.format(rBirthday);
        }
        return "";
    }

    public void setrBirthday(String rBirthday) throws ParseException {
        if (rBirthday!=null){
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            this.rBirthday = simpleDateFormat.parse(rBirthday);
        }else {
            this.rBirthday=new Date();
        }

    }

    public String getrContact() {
        return rContact;
    }

    public void setrContact(String rContact) {
        this.rContact = rContact;
    }

    public String getrEmail() {
        return rEmail;
    }

    public void setrEmail(String rEmail) {
        this.rEmail = rEmail;
    }

    public Integer getrCredibility() {
        return rCredibility;
    }

    public void setrCredibility(Integer rCredibility) {
        this.rCredibility = rCredibility;
    }

    public Integer getrNumber() {
        return rNumber;
    }

    public void setrNumber(Integer rNumber) {
        this.rNumber = rNumber;
    }
}