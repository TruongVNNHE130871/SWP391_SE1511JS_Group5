/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ASUS
 */
public class GetUserIDByEmailTest {
    UserDBContext userDBContext = new UserDBContext();
    
    public GetUserIDByEmailTest() {
    }

    

    @Test
    public void testGetUserIDByEmailCase001() {
        int expectedID = 2;
        String email = "truongvnnhe130871@fpt.edu.vn";
        int actualID =  userDBContext.getUserIDByEmail(email);
        assertEquals(expectedID,actualID);
    }
    @Test
    public void testGetUserIDByEmailCase002() {
        int expectedID = 2;
        String email = "truongvnnhe130871@gmail.com";
        int actualID =  userDBContext.getUserIDByEmail(email);
        assertNotEquals(expectedID,actualID);
    }
}
