package com.ezen.mall.domain.member.dto;

public class Member {
    private String id;
    private String passwd;
    private String name;
    private String email;
    private String regdate;
    private String picture;
    private String phonenumber;
    private String zip_code;
    private String user_address;
    private String grade_rating;

    public Member(){}

//    public Member(String id, String passwd, String name, String email) {
//        this(id, passwd, name, email, null, null);
//    }

    public Member(String id, String passwd, String name, String email, String phonenumber, String zip_code, String user_address) {
        this(id, passwd, name, email,null,null, phonenumber, zip_code, user_address,null);

    }


    public Member(String id, String passwd, String name, String email, String regdate, String picture, String phonenumber, String zip_code, String user_address, String grade_rating) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.regdate = regdate;
        this.picture = picture;
        this.phonenumber = phonenumber;
        this.zip_code = zip_code;
        this.user_address = user_address;
        this.grade_rating = grade_rating;
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

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getGrade_rating() {
        return grade_rating;
    }

    public void setGrade_rating(String grade_rating) {
        this.grade_rating = grade_rating;
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
                ", zip_code='" + zip_code + '\'' +
                ", user_address='" + user_address + '\'' +
                ", grade_rating='" + grade_rating + '\'' +
                '}';
    }
}
