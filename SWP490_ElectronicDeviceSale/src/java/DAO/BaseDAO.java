/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class BaseDAO {

    protected Connection connection;

    public BaseDAO() {
        try {
            /**
             * Cuong
             */
//            String url = "jdbc:sqlserver://ADMIN\\TRANCUONG:1433;databaseName=SWP391";
//            String user = "se1514";
//            String pass = "12345678";
            /**
             * Vinh
             */
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391";
            String user = "sa";
            String pass = "v1";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
