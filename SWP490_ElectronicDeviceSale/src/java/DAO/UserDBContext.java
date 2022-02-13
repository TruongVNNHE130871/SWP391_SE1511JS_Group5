package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDBContext extends BaseDAO {

    public User getUserByUserPass(String username, String password) {
        try {
            String sql = "select UserName, PassWord from [User] where UserName = ? AND PassWord = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1), rs.getString(2));
                return u;
            }

        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public User isUserExisted(String userName) {
        try {
            String sql = "select UserName from [User] where UserName = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userName);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1));
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public void insertUser(String name, String userName, String password, int gender, int phoneNumber, String email, Date created) throws SQLException {
        try {
            String sql = "insert into [User] values " + "(? , ? , ? , ? , ? , ? , ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, userName);
            statement.setString(3, password);
            statement.setInt(4, gender);
            statement.setInt(5, phoneNumber);
            statement.setString(6, email);
            statement.setDate(7, created);
            statement.executeUpdate();
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                User u = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDate(7));
//                return u;
//            }
        } catch (Exception e) {
        }

//        return null;
    }

}
