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
 *
 * @author VinhNT
 */
public class Order {

    private int id;
    private User username;
    private int productId;
    private OrderDetail orderdetail;
    private int quantity;
    private Date orderDate;
    private Date deliveryDate;

    public Order() {
    }

    public Order(int id, User username, int productId, OrderDetail orderdetail, int quantity, Date orderDate, Date deliveryDate) {
        this.id = id;
        this.username = username;
        this.productId = productId;
        this.orderdetail = orderdetail;
        this.quantity = quantity;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public OrderDetail getOrderDetail() {
        return orderdetail;
    }

    public void setOrderDetail(OrderDetail orderdetail) {
        this.orderdetail = orderdetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

   

}