/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import model.Order;


/**
 *
 * @author ASUS
 */
public interface IOrderDBContext {
    public void insert(Order order);
    public ArrayList<Order> getOrders(int pageindex, int pagesize, int id);
    public int getOrderRowCount();
    public ArrayList<Order> listOrder(int id);
    
}
