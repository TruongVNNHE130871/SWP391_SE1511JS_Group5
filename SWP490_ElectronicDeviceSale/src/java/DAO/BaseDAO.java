/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This class implements the connection to the database
 *
 * @author VinhNT
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
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391";
//            String user = "sa";
//            String pass = "v1";
            /**
             * Hung
             */
            String url = "jdbc:sqlserver://DESKTOP-AGLT4RV\\HUNGVTHE:1433;databaseName=SWP391";
            String user = "test";
            String pass = "minamoto2701";
            /**
             * Binh
             */
//            String url = "jdbc:sqlserver://DESKTOP-4V2309B\\SQLEXPRESS:1433;databaseName=SWP391";
//            String user = "sa";
//            String pass = "123456";          
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
