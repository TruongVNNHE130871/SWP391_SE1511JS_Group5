/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.User;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ASUS
 */
public class getUserByIDTest {
    UserDBContext userDBContext = new UserDBContext();
    
    public getUserByIDTest() {
    }
    @Test
    public void testGetUserByID() {
        User expectedUser = new User();
        expectedUser.setId(2);
        expectedUser.setName("Truong");
        expectedUser.setUserName("truong123");
        expectedUser.setPassWord("vnntvnnt");
        expectedUser.setGender(true);
        expectedUser.setPhone(123456789);
        expectedUser.setEmail("truongvnnhe130871@fpt.edu.vn");
        User actualUser = userDBContext.getUserByID(2);
        assertEquals(expectedUser.getId(), actualUser.getId());
        assertEquals(expectedUser.getName(), actualUser.getName());
        assertEquals(expectedUser.getUserName(), actualUser.getUserName());
        assertEquals(expectedUser.getPassWord(), actualUser.getPassWord());
        assertEquals(expectedUser.isGender(), actualUser.isGender());
        assertEquals(expectedUser.getPhone(), actualUser.getPhone());
        assertEquals(expectedUser.getEmail(), actualUser.getEmail());                
    }
    
    
    
}
