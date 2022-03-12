/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package model;

/**
 *
 * @author VinhNT
 */
public class OrderDetail {

    private int id;
    private String user_session;
    private String user_name;
    private String user_phone;
    private String user_mail;
    private String address;
    private String note;
    private String amount;
    private String payment;
    private String status;

    public OrderDetail() {
    }

    public OrderDetail(int id, String user_session, String user_name, String user_phone, String user_mail, String address, String note, String amount, String payment, String status) {
        this.id = id;
        this.user_session = user_session;
        this.user_name = user_name;
        this.user_phone = user_phone;
        this.user_mail = user_mail;
        this.address = address;
        this.note = note;
        this.amount = amount;
        this.payment = payment;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_session() {
        return user_session;
    }

    public void setUser_session(String user_session) {
        this.user_session = user_session;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_mail() {
        return user_mail;
    }

    public void setUser_mail(String user_mail) {
        this.user_mail = user_mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
