/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.Locale;

/**
 *
 * @author Admin
 */
public class Product implements Cloneable{

    private int id;
    private Category c;
    private Shop s;
    private String name;
    private String image;
    private String description;
    private int vote;
    private String price;
    private float discount;
    private boolean status;
    private Date created;
    private Manufacturer man;
    private float size;
    private float weight;
    private int ram;
    private String orginal;
    private String year;

    public int getId() {
        return id;
    }

    public Product() {
    }

    public Product(int id, Category c, Shop s, String name, String image, String description, int vote, String price, float discount, boolean status, Date created) {
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getPrice() {
        return String.format(Locale.US, "%,.0f", Float.parseFloat(price));
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Manufacturer getMan() {
        return man;
    }

    public void setMan(Manufacturer man) {
        this.man = man;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public String getOrginal() {
        return orginal;
    }

    public void setOrginal(String orginal) {
        this.orginal = orginal;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        // TODO Auto-generated method stub
        return (Product) super.clone();
    }

}
