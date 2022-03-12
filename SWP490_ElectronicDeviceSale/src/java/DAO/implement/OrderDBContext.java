/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Order;

/**
 *
 * @author VinhNT
 */
public class OrderDBContext extends BaseDAO {

    public void insert(Order order) {
        String sql = "INSERT INTO [Order]([UserId], [ProductId],[Quantity],[OrderDate],[OrderDetailId]) VALUES (?, ?, ?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, order.getUserId());
            statement.setInt(2, order.getProductId());
            statement.setInt(3, order.getQuantity());
            statement.setDate(4, (Date) order.getOrderDate());
            statement.setInt(5, order.getOrderDetailId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
