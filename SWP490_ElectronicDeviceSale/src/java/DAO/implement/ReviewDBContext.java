/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import controller.user.Review;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VinhNT
 */
public class ReviewDBContext extends BaseDAO {

    public void insert(Review review) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();

        try {
            String sql = "INSERT INTO Review([Name], [ProductId],[Content],[Created],[Phone]) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, review.getName());
            statement.setInt(2, review.getProduct_id());
            statement.setString(3, review.getContent());
            statement.setDate(4, (Date) review.getCreated());
            statement.setInt(5, review.getPhone());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                //close statement
                if (connection != null) {
                    connection.close();
                }
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<Review> getReviewById(int id) {
        List<Review> reviews = new ArrayList<Review>();

        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "SELECT * FROM [Review] WHERE ProductId=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getString("id"));
                review.setName(rs.getString("Name"));
                review.setProduct_id(rs.getInt("ProductId"));
                review.setContent(rs.getString("content"));
                review.setCreated(rs.getDate("Created"));
                review.setPhone(rs.getInt("Phone"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}