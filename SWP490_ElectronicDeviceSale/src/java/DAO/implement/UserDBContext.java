/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

/**
 * The class contains methods check, insert user * The method will throw an
 * object of <code>java.sql.SQLException</code> class if there is any error
 * occurring when finding, inserting, or updating data
 *
 * @author VinhNT
 */
import DAO.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDBContext extends BaseDAO implements IUserDBContext {

    /**
     * Search username and password in the database
     *
     * @param username It is a <code>java.lang.String</code> object
     * @param password It is a <code>java.lang.String</code> object
     * @return user
     */
    @Override
    public User getUserByUserPass(String username, String password) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "select * from [User] where UserName = ? AND PassWord = ?";
            statement = connection.prepareStatement(sql);
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
    @Override
    public User isUserExisted(String userName) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "select UserName from [User] where UserName = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, userName);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1));
                return u;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
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
    @Override
    public void insertUser(String name, String userName, String password, boolean gender, int phoneNumber, String email, Date created, boolean status) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "insert into [User] values " + "(? , ? , ? , ? , ? , ? , ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, userName);
            statement.setString(3, password);
            statement.setBoolean(4, gender);
            statement.setInt(5, phoneNumber);
            statement.setString(6, email);
            statement.setDate(7, created);
            statement.setBoolean(8, status);
            statement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
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
    }

    /**
     * Find User record by email and change password attribute The result is
     * password changed
     *
     * @param email is the email user registered. It is a
     * <code>java.Lang.String</code> object
     * @param randomPassword is the new password. It is a
     * <code>java.Lang.String</code> object
     */
    @Override
    public void changeUserPassByEmail(String email, String randomPassword) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "UPDATE [User]\n"
                    + "  SET [PassWord] = ?\n"
                    + "  WHERE Email= ?";
            //Create sql query
            statement = connection.prepareStatement(sql);
            //prepare statement
            statement.setString(1, randomPassword);
            //Set value randomPassword in query
            statement.setString(2, email);
            //Set value email in query
            statement.executeQuery();
            //execute query

        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
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

    /**
     * Find a User by ID. Only one user with matched ID will return. If there
     * are no user, return 0 The result is an <code>User</Code> with ID, name,
     * username, password, gender, phone, email
     *
     * @param id is the id of user need to find. It is a
     * <code>java.Lang.Int</code> object
     * @return a <code>User</code> object
     *
     */
    @Override
    public User getUserByID(int id) {
        PreparedStatement statement = null;
        this.getConnection();
        //Init statement
        try {
            String sql = "SELECT [ID]\n"
                    + "      ,[Name]\n"
                    + "      ,[UserName]\n"
                    + "      ,[PassWord]\n"
                    + "      ,[Gender]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "  FROM [User]\n"
                    + "  WHERE [ID]= ?";
            //Create sql query
            statement = connection.prepareStatement(sql);
            //prepare statement
            statement.setInt(1, id);
            //Set value ID in query 
            ResultSet rs = statement.executeQuery();
            //Excute query and set data of the result
            while (rs.next()) {
                //Read data of query result
                User user = new User();
                //Init user
                user.setId(id);
                //Set user ID
                user.setName(rs.getString("Name"));
                //Set user's name
                user.setUserName(rs.getString("UserName"));
                //Set user's insystem name
                user.setGender(rs.getBoolean("Gender"));
                //Set user gender
                user.setPassWord(rs.getString("PassWord"));
                //Set user passowrd
                user.setPhone(rs.getInt("Phone"));
                //Set user phonenumber
                user.setEmail(rs.getString("Email"));
                //Set user email
                return user;
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
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
        return null;
    }

    /**
     * change password of an account. The result is the change of User password
     *
     * @param id is the id of user need to find. It is a
     * <code>java.Lang.Int</code> object
     * @param newPassword is the new password user want to change to. It is a
     * <code>java.Lang.String</code>
     *
     */
    @Override
    public void changePassword(int id, String newPassword) {
        PreparedStatement statement = null;
        //Init statement
        try {
            String sql = " UPDATE [User]\n"
                    + "  Set [Password]= ?\n"
                    + "  WHERE ID = ?";
            //Create sql query
            statement = connection.prepareStatement(sql);
            //Prepare statement 
            statement.setString(1, newPassword);
            //Set value newPassword in query 
            statement.setInt(2, id);
            //Set value ID in query 
            statement.executeQuery();
            //execute query
        } catch (SQLException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
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
    }

    /**
     * edit profile
     *
     * @param u
     */
    @Override
    public void editProfile(User u) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [Name] = ?\n"
                    + "      ,[Gender] = ?\n"
                    + "      ,[Phone] = ?\n"
                    + "      ,[Email] = ?\n"
                    + " WHERE ID = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, u.getName());
            statement.setBoolean(2, u.isGender());
            statement.setInt(3, u.getPhone());
            statement.setString(4, u.getEmail());
            statement.setInt(5, u.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
    }

    /**
     * Check if an email have already existed in the system
     *
     * @param email is the email we need to check if it existed in the system
     * @return an integer (1 if there is an email, and return 0 if there is no
     * such email
     */
    @Override
    public int checkEmailExisted(String email) {
        this.getConnection();
        int result = 0;
        //return if emails exist or not
        String sql = "SELECT [ID]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Created]\n"
                + "  FROM [User]\n"
                + "  WHERE Email= ?";
        //Create sql query
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        //Init result set
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            stm.setString(1, email);
            //Set value email in query 
            rs = stm.executeQuery();
            //Excute query and set data of the result
            if (rs.next()) {
                ////Read data of query result
                result = 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement             
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    /**
     * get data of all user in the system
     *
     * @return List of all user.It is a <code>java.Lang.ArrayList</code>
     */
    @Override
    public ArrayList<User> getAllUser() {
        this.getConnection();
        //connect to database
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        //Init result set
        ArrayList<User> users = new ArrayList();
        //Init List of Users
        String sql = "SELECT [ID]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Created]\n"
                + "      ,[Status]\n"
                + "  FROM [User]";
        //create query
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            rs = stm.executeQuery();
            //Excute query and set data of the result
            while (rs.next()) {//Read data of query result
                User user = new User();
                //Init user
                user.setId(rs.getInt("ID"));
                //Set user ID
                user.setName(rs.getString("Name"));
                //Set user's name
                user.setUserName(rs.getString("UserName"));
                //Set user's insystem name
                user.setGender(rs.getBoolean("Gender"));
                //Set user gender
                user.setPassWord(rs.getString("PassWord"));
                //Set user passowrd
                user.setPhone(rs.getInt("Phone"));
                //Set user phonenumber
                user.setEmail(rs.getString("Email"));
                //Set user email
                user.setStatus(rs.getBoolean("Status"));
                //Set user status
                users.add(user);
                //Add user to the ArrayList
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement                
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

    @Override
    public int countTotalUser() {
        int totalNumberOfUser = 0;
        //Init total of users in the system
        this.getConnection();
        //Connect to database
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        String sql = "SELECT COUNT(*)\n"
                + "FROM [user]";
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            rs = stm.executeQuery();
            //Excute query and set data of the result
            if (rs.next()) {
                totalNumberOfUser = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement                
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return totalNumberOfUser;
    }

    @Override
    public ArrayList<User> pagingUser(int pageIndex, int pageSize) {
        this.getConnection();
        //connect to database
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        //Init result set
        ArrayList<User> users = new ArrayList();
        //Init List of Users
        String sql = "SELECT [ID]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Created]\n"
                + "      ,[Status]\n"
                + "FROM [User]\n"
                + "ORDER BY ID\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        //create query
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            stm.setInt(1, (pageIndex - 1) * pageSize);
            stm.setInt(2, pageSize);
            rs = stm.executeQuery();
            //Excute query and set data of the result
            while (rs.next()) {//Read data of query result
                User user = new User();
                //Init user
                user.setId(rs.getInt("ID"));
                //Set user ID
                user.setName(rs.getString("Name"));
                //Set user's name
                user.setUserName(rs.getString("UserName"));
                //Set user's insystem name
                user.setGender(rs.getBoolean("Gender"));
                //Set user gender
                user.setPassWord(rs.getString("PassWord"));
                //Set user passowrd
                user.setPhone(rs.getInt("Phone"));
                //Set user phonenumber
                user.setEmail(rs.getString("Email"));
                //Set user email
                user.setStatus(rs.getBoolean("Status"));
                //Set user status
                users.add(user);
                //Add user to the ArrayList
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement                
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

    @Override
    public int countTotalUserSearchResult(String username) {
        this.getConnection();
        //connect to database
        int totalNumberOfUser = 0;
        //Init total of users in the system
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        String sql = "  SELECT Count(*) \n"
                + "  From [User]\n"
                + "  Where UserName like ?";
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            stm.setString(1, "%" + username + "%");
            //Set value username to query
            rs = stm.executeQuery();
            //Excute query and set data of the result
            if (rs.next()) {
                totalNumberOfUser = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement                
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return totalNumberOfUser;
    }

    @Override
    public ArrayList<User> pagingUserSearchResult(int pageIndex, int pageSize, String username) {
        this.getConnection();
        //connect to database
        PreparedStatement stm = null;
        //Init statement
        ResultSet rs = null;
        //Init result set
        ArrayList<User> users = new ArrayList();
        //Init List of Users
        String sql = "SELECT [ID]\n"
                + "      ,[Name]\n"
                + "      ,[UserName]\n"
                + "      ,[PassWord]\n"
                + "      ,[Gender]\n"
                + "      ,[Phone]\n"
                + "      ,[Email]\n"
                + "      ,[Created]\n"
                + "      ,[Status]\n"
                + "FROM [User]\n"
                + "WHERE UserName like ?\n"
                + "ORDER BY ID\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        //create query
        try {
            stm = connection.prepareStatement(sql);
            //prepare statement
            stm.setString(1, "%" + username + "%");
            stm.setInt(2, (pageIndex - 1) * pageSize);
            stm.setInt(3, pageSize);
            rs = stm.executeQuery();
            //Excute query and set data of the result
            while (rs.next()) {//Read data of query result
                User user = new User();
                //Init user
                user.setId(rs.getInt("ID"));
                //Set user ID
                user.setName(rs.getString("Name"));
                //Set user's name
                user.setUserName(rs.getString("UserName"));
                //Set user's insystem name
                user.setGender(rs.getBoolean("Gender"));
                //Set user gender
                user.setPassWord(rs.getString("PassWord"));
                //Set user passowrd
                user.setPhone(rs.getInt("Phone"));
                //Set user phonenumber
                user.setEmail(rs.getString("Email"));
                //Set user email
                user.setStatus(rs.getBoolean("Status"));
                //Set user status
                users.add(user);
                //Add user to the ArrayList
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                //close connection
                if (rs != null) {
                    rs.close();
                }
                //close result set
                if (stm != null) {
                    stm.close();
                }
                //close statement                
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

}
