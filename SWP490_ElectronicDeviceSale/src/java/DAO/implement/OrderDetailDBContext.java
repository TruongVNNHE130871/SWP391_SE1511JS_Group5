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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author VinhNT
 */
public class OrderDetailDBContext extends BaseDAO {

    public void insert(OrderDetail orderDetail) {

        try {
            String sql = "INSERT INTO [OrderDetail]([UserSesstion],[Name],[Phone],[Email],[Address],[Note],[Amount],[Payment],[Status]) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
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

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDetail> getAll() {
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        try {
            String sql = "SELECT * FROM [OrderDetail]";
            PreparedStatement statement = connection.prepareStatement(sql);
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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderDetails;
    }

}
