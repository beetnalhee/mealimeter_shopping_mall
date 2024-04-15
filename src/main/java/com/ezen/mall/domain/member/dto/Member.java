package com.ezen.mall.domain.member.dto;

public class Member {
    private String id;
    private String passwd;
    private String name;
    private String email;
    private String regdate;
    private String picture;
    private String phonenumber;
    private int zipCode;
    private String userAddress;
    private String gradeRating;

    public Member(){}

//    public Member(String id, String passwd, String name, String email) {
//        this(id, passwd, name, email, null, null);
//    }

    public Member(String id, String passwd, String name, String email, String phonenumber, int zipCode, String userAddress) {
        this(id, passwd, name, email,null,null, phonenumber, zipCode, userAddress,null);

    }


    public Member(String id, String passwd, String name, String email, String regdate, String picture, String phonenumber, int zipCode, String userAddress, String gradeRating) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.regdate = regdate;
        this.picture = picture;
        this.phonenumber = phonenumber;
        this.zipCode = zipCode;
        this.userAddress = userAddress;
        this.gradeRating = gradeRating;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getGradeRating() {
        return gradeRating;
    }

    public void setGradeRating(String gradeRating) {
        this.gradeRating = gradeRating;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", passwd='" + passwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", regdate='" + regdate + '\'' +
                ", picture='" + picture + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", zip_code='" + zipCode + '\'' +
                ", user_address='" + userAddress + '\'' +
                ", grade_rating='" + gradeRating + '\'' +
                '}';
    }
}
