/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         TruongVNN         First Implement

 */
package DAO;

import java.sql.Date;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author TruongVNN
 */
public interface IUserDBContext {

    /**
     * Search username and password in the database
     *
     * @param username It is a <code>java.lang.String</code> object
     * @param password It is a <code>java.lang.String</code> object
     * @return user
     */
    public User getUserByUserPass(String username, String password);
     /**
     * Check username already exists in the database or not
     *
     * Search username and password in the database
     *
     * @param userName
     * @return username
     */
    public User isUserExisted(String userName);
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
    public void insertUser(String name, String userName, String password, boolean gender, int phoneNumber, String email, Date created,boolean status);
     /**
     * Find User record by email and change password attribute
     * The result is password changed
     * 
     * @param email is the email user registered. It is a <code>java.Lang.String</code> object
     * @param randomPassword is the new password. It is a <code>java.Lang.String</code> object
     */
    public void changeUserPassByEmail(String email,String randomPassword);
     /**
     *Find a User by ID. Only one user with matched ID will return. If there are no user, return 0
     * The result is an <code>User</Code> with ID, name, username, password, gender, phone, email
     * 
     * @param id is the id of user need to find. It is a <code>java.Lang.Int</code> object
     * @return a <code>User</code> object
     * 
     */
    public User getUserByID(int id);
    /**
     *change password of an account.
     * The result is the change of User password
     * 
     * @param id is the id of user need to find. It is a <code>java.Lang.Int</code> object
     * @param newPassword is the new password user want to change to. It is a <code>java.Lang.String</code>
     * 
     */
    public void changePassword(int id, String newPassword);
    /**
     * edit profile
     * @param u 
     */
    public void editProfile(User u);
    /**
     * Check if an email have already existed in the system
     * @param email is the email we need to check if it existed in the system
     * @return an integer (1 if there is an email, and return 0 if there is no such email
     */
    public int checkEmailExisted(String email);
    /**
     * get data of all user in the system
     * @return List of all user.It is a <code>java.Lang.ArrayList</code>
     */
    public ArrayList<User> getAllUser();
    /**
     * count total number of user in system
     * @return total number of user in system  .It is a <code>java.Lang.Integer</code>
     */
    public int countTotalUser();
    /**
     * count total number of user in system
     * @param pageIndex
     * @param pageSize
     * @return data of list user in page index. It is a <code>java.Lang.ArrayList</code>
     */
    public ArrayList<User> pagingUser(int pageIndex, int pageSize);
    /**
     * count total number of user in system
     * @param username
     * @return total number of user in system  .It is a <code>java.Lang.Integer</code>
     */
    public int countTotalUserSearchResult(String username);
    /**
     * count total number of user in system
     * @param pageIndex
     * @param pageSize
     * @param username
     * @return data of list user in page index. It is a <code>java.Lang.ArrayList</code>
     */
    public ArrayList<User> pagingUserSearchResult(int pageIndex, int pageSize, String username);
}