/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import java.util.Date;

/**
 *
 * @author soide
 */
public class Review {

    private String id;
    private String name;
    private int product_id;
    private String content;
    private Date created;
    private int phone;

    public Review() {
    }

    public Review(String id, String name, int product_id, String content, Date created, int phone) {
        this.id = id;
        this.name = name;
        this.product_id = product_id;
        this.content = content;
        this.created = created;
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    
}
