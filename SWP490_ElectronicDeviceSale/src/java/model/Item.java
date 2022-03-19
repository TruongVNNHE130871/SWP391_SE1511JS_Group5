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
public class Item {

    private int id;
    private Product product;
    private int qty;
    private float price;

    public Item() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float string) {
        this.price = string;
    }
    
    @Override
    public String toString() {
        return "Item [id=" + id + ", product=" + product + ", qty=" + qty + ", price=" + price + "]";
    }

}
