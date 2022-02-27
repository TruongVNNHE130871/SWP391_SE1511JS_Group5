/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DAO.implement.UserDBContext;
import model.User;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author TruongVNN
 */
public class ChangePasswordTest {
    UserDBContext userDBContext=  new UserDBContext();
    
    public ChangePasswordTest() {
    }
    
    @Test
    public void testChangePasswordCase001() {
        String expectedPassword = "123456";
        int id = 2;
        userDBContext.changePassword(id, expectedPassword);
        User user;
        user = userDBContext.getUserByID(id);
        assertEquals(expectedPassword, user.getPassWord());
    }
    @Test
    public void testChangePasswordCase002() {
        String expectedPassword = "vnntvnnt";
        int id = 2;
        userDBContext.changePassword(id, expectedPassword);
        User user;
        user = userDBContext.getUserByID(id);
        assertEquals(expectedPassword, user.getPassWord());       
    }
    @Test
    public void testChangePasswordCase003() {
        String expectedPassword = "vnnt812";
        int id = 1;
        userDBContext.changePassword(id, expectedPassword);
        User user;
        user = userDBContext.getUserByID(id);
        assertEquals(expectedPassword, user.getPassWord());
    }
}
