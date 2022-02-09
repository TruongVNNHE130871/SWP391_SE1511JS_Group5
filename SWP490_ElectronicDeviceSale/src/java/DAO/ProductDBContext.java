/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
                p.setPrice(rs.getFloat("Price"));
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
}