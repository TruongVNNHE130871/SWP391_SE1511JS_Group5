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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public List<OrderDetail> getAllOrderDetails(String status, int pageindex, int pagesize) {
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "";
            if (status.equals("All")) {
                sql = "SELECT ID, UserSesstion, [Name], Phone, Email, [Address], Note, Amount, Payment, [Status] \n"
                        + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID asc) as rownum, ID, UserSesstion, [Name], Phone, Email, [Address], Note, Amount, Payment, [Status] \n"
                        + "FROM [OrderDetail]) od\n"
                        + "where rownum >= (? - 1)*? + 1 AND rownum <= ? * ? \n";
                statement = connection.prepareStatement(sql);
                statement.setInt(1, pageindex);
                statement.setInt(2, pagesize);
                statement.setInt(3, pageindex);
                statement.setInt(4, pagesize);
            }

            if (!status.equals("All")) {
                sql = "SELECT ID, UserSesstion, [Name], Phone, Email, [Address], Note, Amount, Payment, [Status] \n"
                        + "FROM (SELECT ROW_NUMBER() OVER (ORDER BY ID asc) as rownum, ID, UserSesstion, [Name], Phone, Email, [Address], Note, Amount, Payment, [Status] \n"
                        + "FROM [OrderDetail]\n"
                        + "where [Status] = ?) od\n"
                        + "where rownum >= (? - 1)*? + 1 AND rownum <= ? * ? \n";
                statement = connection.prepareStatement(sql);
                statement.setString(1, status);
                statement.setInt(2, pageindex);
                statement.setInt(3, pagesize);
                statement.setInt(4, pageindex);
                statement.setInt(5, pagesize);
            }

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

    public int getRowCountOrderDetail(String status) {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "";
            if (status.equals("All")) {
                sql = "SELECT COUNT(*) as Total FROM [OrderDetail]";
                statement = connection.prepareStatement(sql);
            } else {
                sql = "SELECT COUNT(*) as Total FROM [OrderDetail]\n"
                        + "where [Status] = ?\n";
                statement = connection.prepareStatement(sql);
                statement.setString(1, status);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                //close statement
                connection.close();
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return -1;
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
            if (resultSet.next()) {
                orderDetail.setId(orderID);
                orderDetail.setStatus(resultSet.getString("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetail;
    }

    public void cancelOrder(String textStatus, int orderDetailId, Date dateCancel) {
        PreparedStatement statement = null;
        this.getConnection();

        try {
            connection.setAutoCommit(false);
            // Update Status Order
            String sql_updateStatus = "UPDATE [dbo].[OrderDetail]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE ID = ?\n";
            statement = connection.prepareStatement(sql_updateStatus);
            statement.setString(1, textStatus);
            statement.setInt(2, orderDetailId);
            statement.executeUpdate();

            // Update Day Cancel Order
            String sql_updateDay = "UPDATE [dbo].[Order]\n"
                    + "   SET [DeliveryDate] = ?\n"
                    + " WHERE OrderDetailId = ?\n";
            statement = connection.prepareStatement(sql_updateDay);
            statement.setDate(1, dateCancel);
            statement.setInt(2, orderDetailId);
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                connection.setAutoCommit(true);
                //close statement
                connection.close();
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deliverOrder(String textStatus, int orderDetailId) {
        PreparedStatement statement = null;
        this.getConnection();

        try {
            // Update Status Order
            String sql_updateStatus = "UPDATE [dbo].[OrderDetail]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE ID = ?\n";
            statement = connection.prepareStatement(sql_updateStatus);
            statement.setString(1, textStatus);
            statement.setInt(2, orderDetailId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                //close statement
                connection.close();
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public OrderDetail getAllOrderDetailsByID(int orderDetaiId) {
        this.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM OrderDetail WHERE [ID] = ?\n";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, orderDetaiId);
            rs = statement.executeQuery();
            if (rs.next()) {
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
                return orderDetail;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
