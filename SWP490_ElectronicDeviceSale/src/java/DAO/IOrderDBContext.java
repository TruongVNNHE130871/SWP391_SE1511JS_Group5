/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package DAO;

import java.util.ArrayList;
import java.util.Date;
import model.Order;

/**
 *
 * @author VinhNT
 */
public interface IOrderDBContext {

    /**
     * Insert order into Database
     *
     * @param Order
     */
    public void insert(Order order);

    public ArrayList<Order> getOrders(int pageindex, int pagesize, int id);

    public int getOrderRowCount();

    public ArrayList<Order> listOrder(int id);

    public ArrayList<Order> listOrderPaging(String userId, Date orderDate, Date deliveryDate, int pageIndex, int pageSize);
}