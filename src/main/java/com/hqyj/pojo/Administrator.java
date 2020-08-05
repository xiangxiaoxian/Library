package com.hqyj.pojo;

public class Administrator {
    private Integer mId;

    private String mName;

    private String mPassword;

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "mId=" + mId +
                ", mName='" + mName + '\'' +
                ", mPassword='" + mPassword + '\'' +
                '}';
    }

    public Administrator() {
    }

    public Administrator(Integer mId, String mName, String mPassword) {
        this.mId = mId;
        this.mName = mName;
        this.mPassword = mPassword;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public String getmPassword() {
        return mPassword;
    }

    public void setmPassword(String mPassword) {
        this.mPassword = mPassword;
    }
}