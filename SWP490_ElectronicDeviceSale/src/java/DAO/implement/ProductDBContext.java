/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.implement;

import DAO.implement.BaseDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDBContext extends BaseDAO {

    public ArrayList<Product> searchProducts(String keyword) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created from Product p\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword != null) {
                sql += "where p.Name like '%'+ ? + '%'";
                stm = connection.prepareStatement(sql);
                stm.setString(1, keyword);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getString("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getProductsByCategory(int cid) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c\n"
                    + "on p.CategoryId = c.ID\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            if (cid != -1) {
                sql += "where c.ID = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, cid);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getString("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    // Get product information by product's id
    public Product getProduct(int id) {
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c\n"
                    + "on p.CategoryId = c.ID\n"
                    + "where p.ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getString("Status"));
                p.setCreated(rs.getDate("Created"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProducts(int pageindex, int pagesize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "select p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, p.CategoryID, p.CategoryName , p.CategoryDescription\n"
                    + "from (SELECT ROW_NUMBER() OVER (ORDER BY p.id asc) as rownum, p.ID, p.Name, p.Image, p.Description, p.Vote, p.Price, p.Discount, p.Status, p.Created, c.ID as CategoryID, c.Name as CategoryName, c.Description as CategoryDescription \n"
                    + "from Product p inner join Category c \n"
                    + "on p.CategoryId = c.ID) p \n"
                    + "Where rownum >= (? - 1)*? + 1 AND rownum <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                Category c = new Category();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("CategoryDescription"));
                p.setC(c);
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("Image"));
                p.setVote(rs.getInt("Vote"));
                p.setPrice(rs.getString("Price"));
                p.setDiscount(rs.getFloat("Discount"));
                p.setStatus(rs.getString("Status"));
                p.setCreated(rs.getDate("Created"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getRowCount() {
        try {
            String sql = "select COUNT(*) as Total from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
