/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement

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
     * @return 
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