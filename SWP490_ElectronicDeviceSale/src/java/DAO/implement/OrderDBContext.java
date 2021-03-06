/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO.implement;

import DAO.IOrderDBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author VinhNT
 */
public class OrderDBContext extends BaseDAO implements IOrderDBContext {

    @Override
    public void insert(Order order) {
        PreparedStatement statement = null;
        //Init statement
        this.getConnection();
        try {
            String sql = "INSERT INTO [Order]([UserId], [ProductId],[Quantity],[OrderDate],[DeliveryDate],[OrderDetailId]) VALUES (?,?,?,?,?,?)";
            statement = connection.prepareStatement(sql);
            User user = order.getUsername();
            OrderDetail orderdetail = order.getOrderDetail();
            statement.setInt(1, user.getId());
            statement.setInt(2, order.getProductId());
            statement.setInt(3, order.getQuantity());
            statement.setDate(4, (Date) order.getOrderDate());
            statement.setDate(5, (Date) order.getDeliveryDate());
            statement.setInt(6, orderdetail.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public ArrayList<Order> getOrders(int pageindex, int pagesize, int id) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement statement = null;
        this.getConnection();

        try {
            String sql = "select o.ID, o.OrderDate, o.DeliveryDate, o.UserId\n"
                    + "                    from (SELECT ROW_NUMBER() OVER (ORDER BY o.ID asc) as rownum,o.ID, o.OrderDate, o.DeliveryDate, u.ID as UserId\n"
                    + "                    from [Order] o left join [User] u\n"
                    + "                    on o.UserId = u.ID) o\n"
                    + "                    Where rownum >= (? - 1)*?+ 1 AND rownum <= ? * ? AND o.UserId = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pageindex);
            statement.setInt(4, pagesize);
            statement.setInt(5, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setDeliveryDate(rs.getDate("DeliveryDate"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
        return orders;
    }

    @Override
    public int getOrderRowCount() {
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "select COUNT(*) as Total from [Order]";
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
    public ArrayList<Order> listOrder(int id) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement statement = null;
        this.getConnection();
        try {
            String sql = "select o.ID, o.OrderDate, o.DeliveryDate,o.UserId\n"
                    + "from [Order] o left join [User] u"
                    + "on o.UserId = u.ID"
                    + "where o.UserId = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setDeliveryDate(rs.getDate("DeliveryDate"));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
        return orders;
    }

    @Override
    public ArrayList<Order> getOrdersByOrderDetailId(int id) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        this.getConnection();
        try {
            String sql = "select o.ID, u.ID as UserId, o.ProductId, o.Quantity, o.OrderDate, o.DeliveryDate, o.OrderDetailId, u.[Name] as Username, od.Status, od.Phone, od.Email\n"
                    + "from [Order] o left join [User] u\n"
                    + "on o.UserId = u.ID left join OrderDetail od\n"
                    + "on od.ID = o.OrderDetailId\n"
                    + "where od.ID = ?\n";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                User user = new User();
                user.setId(rs.getInt("UserId"));
                user.setName(rs.getString("Username"));
                order.setUsername(user);
                order.setProductId(rs.getInt("ProductId"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setDeliveryDate(rs.getDate("DeliveryDate"));
                OrderDetail orderdetail = new OrderDetail();
                orderdetail.setId(rs.getInt("OrderDetailId"));
                orderdetail.setStatus(rs.getString("Status"));
                orderdetail.setUser_phone(rs.getInt("Phone"));
                orderdetail.setUser_mail(rs.getString("Email"));
                order.setOrderDetail(orderdetail);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                //close statement
                if (connection != null) {
                    connection.close();
                }
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

    public ArrayList<Order> getOrdersByUserId(int id, String status) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        this.getConnection();
        try {
            String sql = "select o.ID, u.ID as UserId, o.ProductId, o.Quantity, o.OrderDate, o.DeliveryDate, o.OrderDetailId, u.[Name] as Username, od.[Status]\n"
                    + "from [Order] o left join [User] u\n"
                    + "on o.UserId = u.ID\n"
                    + "left join OrderDetail od on od.ID = o.OrderDetailId\n"
                    + "where u.ID = ? And od.[Status] = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, status);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                User user = new User();
                user.setId(rs.getInt("UserId"));
                user.setName(rs.getString("Username"));
                order.setUsername(user);
                order.setProductId(rs.getInt("ProductId"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setDeliveryDate(rs.getDate("DeliveryDate"));
                OrderDetail orderdetail = new OrderDetail();
                orderdetail.setId(rs.getInt("OrderDetailId"));
                orderdetail.setStatus(rs.getString("Status"));
                order.setOrderDetail(orderdetail);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                //close statement
                if (connection != null) {
                    connection.close();
                }
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

    public ArrayList<Order> getOrdersByOrderDetailIdForCart(int orderDetailId) {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        this.getConnection();
        try {
            String sql = "select o.ID, u.ID as UserId, o.ProductId, o.Quantity, o.OrderDetailId, u.[Name] as Username\n"
                    + "from [Order] o left join [User] u\n"
                    + "on o.UserId = u.ID\n"
                    + "left join OrderDetail od on od.ID = o.OrderDetailId\n"
                    + "where o.OrderDetailId = ?\n";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetailId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("ID"));
                User user = new User();
                user.setId(rs.getInt("UserId"));
                user.setName(rs.getString("Username"));
                order.setUsername(user);
                order.setProductId(rs.getInt("ProductId"));
                order.setQuantity(rs.getInt("Quantity"));
                OrderDetail orderdetail = new OrderDetail();
                orderdetail.setId(rs.getInt("OrderDetailId"));
                order.setOrderDetail(orderdetail);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                //close statement
                if (connection != null) {
                    connection.close();
                }
                //close connection
            } catch (SQLException ex) {
                Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

}
