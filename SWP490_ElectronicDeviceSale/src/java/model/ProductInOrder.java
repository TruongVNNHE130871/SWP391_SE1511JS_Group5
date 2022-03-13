/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class ProductInOrder extends Product {

    private int quanlity;

    public ProductInOrder() {
    }

    public ProductInOrder(int id, Category c, Shop s, String name, String image, String description, int vote, String price, float discount, boolean status, Date created) {
        super(id, c, s, name, image, description, vote, price, discount, status, created);
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }
}
