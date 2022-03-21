/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;

import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author VinhNT
 */
public interface IOrderDetailDBContext {

    /**
     * Insert OrderDetail into Database
     *
     * @param orderDetail
     */
    public void insert(OrderDetail orderDetail);

    /**
     * Get all list OrderDetail form Database
     *
     *
     * @return 
     */
    public List<OrderDetail> getAll();
    
    public OrderDetail getOrderDetailsByID(int orderID);

}
