/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import DAO.IOrderDetailDBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author VinhNT
 */
public class OrderDetailDBContext extends BaseDAO implements IOrderDetailDBContext {

    @Override
    public void insert(OrderDetail orderDetail) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "INSERT INTO [OrderDetail]([UserSesstion],[Name],[Phone],[Email],[Address],[Note],[Amount],[Payment],[Status]) VALUES (?,?,?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, orderDetail.getUser_session());
            statement.setString(2, orderDetail.getUser_name());
            statement.setInt(3, orderDetail.getUser_phone());
            statement.setString(4, orderDetail.getUser_mail());
            statement.setString(5, orderDetail.getAddress());
            statement.setString(6, orderDetail.getNote());
            statement.setString(7, orderDetail.getAmount());
            statement.setString(8, orderDetail.getPayment());
            statement.setString(9, orderDetail.getStatus());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public List<OrderDetail> getAll() {
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "SELECT * FROM [OrderDetail]";
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setId(rs.getInt("ID"));
                orderDetail.setUser_session(rs.getString("UserSesstion"));
                orderDetail.setUser_name(rs.getString("Name"));
                orderDetail.setUser_phone(rs.getInt("Phone"));
                orderDetail.setUser_mail(rs.getString("Email"));
                orderDetail.setAddress(rs.getString("Address"));
                orderDetail.setNote(rs.getString("Note"));
                orderDetail.setAmount(rs.getString("Amount"));
                orderDetail.setPayment(rs.getString("Payment"));
                orderDetail.setStatus(rs.getString("Status"));
                orderDetails.add(orderDetail);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orderDetails;
    }

    @Override
    public OrderDetail getOrderDetailsByID(int orderID) {
        this.getConnection();
        PreparedStatement statement = null;
        OrderDetail orderDetail = new OrderDetail();
        ResultSet resultSet = null;
        String sql = "SELECT [ID]\n"
                + "      ,[Status]\n"
                + "  FROM [OrderDetail]\n"
                + "  WHERE [ID] =?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, orderID);
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                orderDetail.setId(orderID);
                orderDetail.setStatus(resultSet.getString("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
     return orderDetail;
    }

}
