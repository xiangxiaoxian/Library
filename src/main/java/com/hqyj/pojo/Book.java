package com.hqyj.pojo;

import com.hqyj.util.MyPage;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book extends MyPage implements Serializable {
    private Integer tId;

    private String tName;

    private String tAuthor;

    private String tPress;

    private Date tPublication;

    private String tInventory;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettAuthor() {
        return tAuthor;
    }

    public void settAuthor(String tAuthor) {
        this.tAuthor = tAuthor;
    }

    public String gettPress() {
        return tPress;
    }

    public void settPress(String tPress) {
        this.tPress = tPress;
    }

    public String gettPublication() {
        if(this.tPublication!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(this.tPublication);
        }
        return "";
    }

    public void settPublication(String tPublication) throws ParseException {
        if(tPublication!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.tPublication = sdf.parse(tPublication);
        }else{
            this.tPublication = new Date();
        }
    }

    public String gettInventory() {
        return tInventory;
    }

    public void settInventory(String tInventory) {
        this.tInventory = tInventory;
    }

    @Override
    public String toString() {
        return "Book{" +
                "tId=" + tId +
                ", tName='" + tName + '\'' +
                ", tAuthor='" + tAuthor + '\'' +
                ", tPress='" + tPress + '\'' +
                ", tPublication=" + tPublication +
                ", tInventory='" + tInventory + '\'' +
                '}';
    }

    public Book() {
    }

    public Book(Integer tId, String tName, String tAuthor, String tPress, Date tPublication, String tInventory) {
        this.tId = tId;
        this.tName = tName;
        this.tAuthor = tAuthor;
        this.tPress = tPress;
        this.tPublication = tPublication;
        this.tInventory = tInventory;
    }
}