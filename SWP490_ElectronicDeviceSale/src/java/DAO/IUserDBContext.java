/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Date;
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
    public void insertUser(String name, String userName, String password, boolean gender, int phoneNumber, String email, Date created);
     /**
     *Find UserId by email. Only one user with matched email will return it's ID.If no user fit the email, return 0
     * The result is 0 or UserID
     * 
     * @param email is the email user registered. It is a <code>java.Lang.String</code> object
     * @param randomPassword
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
    
}
