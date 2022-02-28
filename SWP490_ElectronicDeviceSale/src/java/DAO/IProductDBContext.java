/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Date;
import java.util.ArrayList;
import model.Category;
import model.Product;
import model.Shop;

/**
 *
 * @author CuongTV
 */
public interface IProductDBContext {

    /**
     * View all product
     */
    public ArrayList<Product> listProduct();

    /**
     * Add new product to database
     *
     * @param p
     */
    public void insertProduct(Product p);

    /**
     * update product
     *
     * @param p
     */
    public void updateProduct(Product p);

    /**
     * delete product
     *
     * @param id
     */
    public void deleteProduct(int id);
}
