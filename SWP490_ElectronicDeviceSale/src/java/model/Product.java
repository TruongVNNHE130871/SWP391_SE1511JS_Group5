/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private Category c;
    private Shop s;
    private String name;
    private String image;
    private String description;
    private int vote;
    private String price;
    private float discount;
    private String status;
    private Date created;

    public int getId() {
        return id;
    }

    public Product() {
    }

    public Product(int id, Category c, Shop s, String name, String image, String description, int vote, String price, float discount, String status, Date created) {
        this.id = id;
        this.c = c;
        this.s = s;
        this.name = name;
        this.image = image;
        this.description = description;
        this.vote = vote;
        this.price = price;
        this.discount = discount;
        this.status = status;
        this.created = created;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getC() {
        return c;
    }

    public void setC(Category c) {
        this.c = c;
    }

    public Shop getS() {
        return s;
    }

    public void setS(Shop s) {
        this.s = s;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

}
