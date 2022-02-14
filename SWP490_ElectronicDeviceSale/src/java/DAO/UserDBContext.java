/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;
/**
 * The class contains methods check, insert user * The method will throw an
 * object of <code>java.sql.SQLException</code> class if there is any error
 * occurring when finding, inserting, or updating data
 *
 * @author VinhNT
 */
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDBContext extends BaseDAO {
/**
     * Search username and password in the database
     *
     * @param username It is a <code>java.lang.String</code> object
     * @param password It is a <code>java.lang.String</code> object
     * @return user
     */
    public User getUserByUserPass(String username, String password) {
        try {
            String sql = "select * from [User] where UserName = ? AND PassWord = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("ID"));
                u.setName(rs.getString("Name"));
                u.setUserName(rs.getString("UserName"));
                u.setPassWord(rs.getString("PassWord"));
                u.setGender(rs.getBoolean("Gender"));
                u.setPhone(rs.getInt("Phone"));
                u.setEmail(rs.getString("Email"));
                u.setCreated(rs.getDate("Created"));
                return u;
            }

        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
  /**
     * Check username already exists in the database or not
     *
     * Search username and password in the database
     *
     * @param userName
     * @return username
     */
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
  /**
     * Add new user to database
     *
     * @param name
     * @param userName
     * @param password
     * @param gender
     * @param phoneNumber
     * @param email
     * @param created
     */
    public void insertUser(String name, String userName, String password, boolean gender, int phoneNumber, String email, Date created) throws SQLException {
        try {
            String sql = "insert into [User] values " + "(? , ? , ? , ? , ? , ? , ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, userName);
            statement.setString(3, password);
            statement.setBoolean(4, gender);
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
    /**
     *Find UserId by email. Only one user with matched email will return it's ID.If no user fit the email, return 0
     * The result is 0 or UserID
     * 
     * @param email is the email user registered. It is a <code>java.Lang.String</code> object
     * @return a <code>java.Lang.Int</code> object
     */
    public int getUserIDByEmail(String email){
        try {
            String sql = "SELECT [ID]\n" +
                         "  FROM [User]\n" +
                         "  Where [Email] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                return id;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return 0;    
    }
    /**
     *Find a User by ID. Only one user with matched ID will return. If there are no user, return 0
     * The result is an <code>User</Code> with ID, name, username, password, gender, phone, email
     * 
     * @param id is the id of user need to find. It is a <code>java.Lang.Int</code> object
     * @return a <code>User</code> object
     */
    public User getUserByID(int id){
        try {
            String sql = "SELECT [ID]\n" +
                        "      ,[Name]\n" +
                        "      ,[UserName]\n" +
                        "      ,[PassWord]\n" +
                        "      ,[Gender]\n" +
                        "      ,[Phone]\n" +
                        "      ,[Email]\n" +
                        "  FROM [User]\n" +
                        "  WHERE [ID]= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(id);
                u.setName(rs.getString("Name"));
                u.setUserName(rs.getString("UserName"));
                String gender = rs.getString("Gender");
                u.setPassWord(rs.getString("PassWord"));
                if(gender.equalsIgnoreCase("Male"))
                    u.setGender(true);
                if(gender.equalsIgnoreCase("Female"))
                    u.setGender(false);
                u.setPhone(rs.getInt("Phone"));
                u.setEmail(rs.getString("Email"));
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;    
    }
    /**
     *change password of an account.
     * The result is the change of User password
     * 
     * @param id is the id of user need to find. It is a <code>java.Lang.Int</code> object
     * @param newPassword is the new password user want to change to. It is a <code>java.Lang.String</code>
     * 
     */
    public void changePassword(int id, String newPassword){
        try {
            String sql =" UPDATE [User]\n" +
                        "  Set [Password]= ?\n" +
                        "  WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, newPassword);
            statement.setInt(2, id);
            statement.executeQuery();
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    /**
     * edit profile
     * @param u 
     */
    public void editProfile(User u) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [Name] = ?\n"
                    + "      ,[Gender] = ?\n"
                    + "      ,[Phone] = ?\n"
                    + "      ,[Email] = ?\n"
                    + " WHERE ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u.getName());
            stm.setBoolean(2, u.isGender());
            stm.setInt(3, u.getPhone());
            stm.setString(4, u.getEmail());
            stm.setInt(5, u.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
