package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDBContext extends BaseDAO {

    public User getUserByUserPass(String username, String password) {
        try {
            String sql = "select*from User where UserName = ? AND PassWord = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserName(rs.getString("UserName"));
                user.setPassWord(rs.getString("PassWord"));
                user.setName(rs.getString("Name"));
                return user;
            }

        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    
}
