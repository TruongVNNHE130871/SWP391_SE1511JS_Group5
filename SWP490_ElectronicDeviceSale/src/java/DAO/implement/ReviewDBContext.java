/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import model.Review;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

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
            String sql = "INSERT INTO Review([Name], [ProductId],[Content],[Created],[Phone],[Vote]) VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, review.getName());
            statement.setInt(2, review.getProduct_id());
            statement.setString(3, review.getContent());
            statement.setDate(4, (Date) review.getCreated());
            statement.setInt(5, review.getPhone());
            statement.setInt(6, review.getVote());
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
                review.setId(rs.getInt("id"));
                review.setName(rs.getString("Name"));
                review.setProduct_id(rs.getInt("ProductId"));
                review.setContent(rs.getString("content"));
                review.setCreated(rs.getDate("Created"));
                review.setPhone(rs.getInt("Phone"));
                review.setVote(rs.getInt("Vote"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> getAllReview() {
        List<Review> reviews = new ArrayList<>();

        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "SELECT r.ID, p.[Name] as productName, p.[Image], r.[Name] as userNameReview,r.Phone,r.Content,r.Vote,r.Created\n"
                    + "FROM [Review] r inner join Product p on p.ID=r.ProductId";
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("ID"));
                review.setName(rs.getString("userNameReview"));
                review.setContent(rs.getString("Content"));
                review.setCreated(rs.getDate("Created"));
                review.setPhone(rs.getInt("Phone"));
                review.setVote(rs.getInt("Vote"));
                Product product = new Product();
                product.setName(rs.getString("productName"));
                product.setImage(rs.getString("Image"));
                review.setProduct(product);
                reviews.add(review);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public ArrayList<Review> listAllReviews(String keyword, int starIndex, int pageindex, int pagesize) {
        ArrayList<Review> reviews = new ArrayList<>();
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "";
            switch (starIndex) {
                case -1:
                    sql = "SELECT p.ID, p.productName, p.[Image], p.userNameReview,p.Phone, p.Content, p.Vote, p.Created\n"
                            + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY r.ID asc) as rownum, r.ID, p.[Name] as productName, p.[Image], r.[Name] as userNameReview,r.Phone,r.Content,r.Vote,r.Created\n"
                            + "FROM [Review] r inner join Product p on p.ID = r.ProductId\n"
                            + "where p.[Name] like '%'+ ? +'%') p\n"
                            + "where rownum >= (? - 1)*? + 1 AND rownum <= ? * ?\n";
                    break;
                case 1:
                    sql = "SELECT p.ID, p.productName, p.[Image], p.userNameReview,p.Phone, p.Content, p.Vote, p.Created\n"
                            + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY r.Vote asc) as rownum, r.ID, p.[Name] as productName, p.[Image], r.[Name] as userNameReview,r.Phone,r.Content,r.Vote,r.Created\n"
                            + "FROM [Review] r inner join Product p on p.ID = r.ProductId\n"
                            + "where p.[Name] like '%'+ ? +'%') p\n"
                            + "where rownum >= (? - 1)*? + 1 AND rownum <= ? * ?\n";
                    break;
                case 2:
                    sql = "SELECT p.ID, p.productName, p.[Image], p.userNameReview,p.Phone, p.Content, p.Vote, p.Created\n"
                            + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY r.Vote desc) as rownum, r.ID, p.[Name] as productName, p.[Image], r.[Name] as userNameReview,r.Phone,r.Content,r.Vote,r.Created\n"
                            + "FROM [Review] r inner join Product p on p.ID = r.ProductId\n"
                            + "where p.[Name] like '%'+ ? +'%') p\n"
                            + "where rownum >= (? - 1)*? + 1 AND rownum <= ? * ? \n";
                    break;
            }
            statement = connection.prepareStatement(sql);
            statement.setString(1, keyword);
            statement.setInt(2, pageindex);
            statement.setInt(3, pagesize);
            statement.setInt(4, pageindex);
            statement.setInt(5, pagesize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("ID"));
                review.setName(rs.getString("userNameReview"));
                review.setContent(rs.getString("Content"));
                review.setCreated(rs.getDate("Created"));
                review.setPhone(rs.getInt("Phone"));
                review.setVote(rs.getInt("Vote"));
                Product product = new Product();
                product.setName(rs.getString("productName"));
                product.setImage(rs.getString("Image"));
                review.setProduct(product);
                reviews.add(review);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                //close statement
                connection.close();
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return reviews;
    }

    public int getRowCountReviews(String keyword) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "SELECT COUNT(*) as Total FROM [Review] r inner join Product p on p.ID = r.ProductId\n"
                    + "where p.[Name] like '%'+ ? + '%'\n";
            statement = connection.prepareStatement(sql);
            statement.setString(1, keyword);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                //close statement
                connection.close();
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
    }

    public void delete(int id) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "DELETE FROM Review WHERE ID=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
