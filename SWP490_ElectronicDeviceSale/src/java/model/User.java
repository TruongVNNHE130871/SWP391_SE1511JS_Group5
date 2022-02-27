/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package model;

import java.util.Date;

/**
 *This class contains the attributes of the user
 * 
 * @author VinhNT
 * 
 */
public class User {

    private int id;
    private String name;
    private String userName;
    private String passWord;
    private boolean gender;
    private int phone;
    private String email;
    private Date created;
    private boolean status;
    public User() {

    }

    public User(String username, String password) {
        super();
        this.userName = username;
        this.passWord = password;
    }

    public User(String username) {
        super();
        this.userName = username;
    }
    
    public User(int id, String name, String userName, String passWord, boolean gender, int phone, String email, Date created,boolean status) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.passWord = passWord;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.created = created;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
