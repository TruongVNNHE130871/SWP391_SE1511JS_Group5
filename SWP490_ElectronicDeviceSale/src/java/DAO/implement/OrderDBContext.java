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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author VinhNT
 */
public class OrderDBContext extends BaseDAO {

    public void insert(Order order) {
        String sql = "INSERT INTO [Order]([UserId], [ProductId],[Quantity],[OrderDate],[OrderDetailId]) VALUES (?,?,?,?,?)";
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

    public ArrayList<Order> getOrders(int pageindex, int pagesize, int id) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select o.ID, o.OrderDate, o.DeliveryDate, o.UserId\n"
                    + "from (SELECT ROW_NUMBER() OVER (ORDER BY o.ID asc) as rownum,o.ID, o.OrderDate, o.DeliveryDate, o.UserId\n"
                    + "from [Order] o) o\n"
                    + "Where rownum >= (? - 1)*? + 1 AND rownum <= ? * ? AND o.UserId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            stm.setInt(5, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setDeliveryDate(rs.getDate("DeliveryDate"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public int getOrderRowCount() {
        try {
            String sql = "select COUNT(*) as Total from Order";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Order> listOrder(int id) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select o.ID, o.OrderDate, o.DeliveryDate,o.UserId\n"
                    + "from Order o"
                    + "where o.UserId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setDeliveryDate(rs.getDate("DeliveryDate"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
}
