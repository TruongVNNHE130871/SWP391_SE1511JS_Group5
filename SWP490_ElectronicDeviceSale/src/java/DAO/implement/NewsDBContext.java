/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import DAO.INewsDBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;

/**
 *
 * @author VinhNT
 */
public class NewsDBContext extends BaseDAO implements INewsDBContext {

    @Override
    public News get(int id) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "SELECT * FROM News WHERE ID = ? ";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News news = new News();
                news.setId(rs.getInt("ID"));
                news.setTitle(rs.getString("Title"));
                news.setContent(rs.getString("content"));
                news.setImage(rs.getString("Image"));
                news.setAuthor(rs.getString("Author"));
                news.setCreated(rs.getString("Created"));
                return news;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    @Override
    public List<News> getAll() {
        List<News> news = new ArrayList<News>();
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "SELECT * FROM News";
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News itemNews = new News();
                itemNews.setId(rs.getInt("ID"));
                itemNews.setTitle(rs.getString("Title"));
                itemNews.setContent(rs.getString("Content"));
                itemNews.setImage(rs.getString("Image"));
                itemNews.setAuthor(rs.getString("Author"));
                itemNews.setCreated(rs.getString("Created"));
                news.add(itemNews);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return news;
    }

    @Override
    public void insert(News news) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "INSERT INTO News(Title, [Content],Image, Author, Created) VALUES (?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setString(3, news.getImage());
            statement.setString(4, news.getAuthor());
            statement.setString(5, news.getCreated());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(int id) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "DELETE FROM News WHERE ID=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void edit(News news) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "UPDATE News SET Title=?,Content=?,Image=?,Author=?,Created=? WHERE ID=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setString(3, news.getImage());
            statement.setString(4, news.getAuthor());
            statement.setString(5, news.getCreated());
            statement.setInt(6, news.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
