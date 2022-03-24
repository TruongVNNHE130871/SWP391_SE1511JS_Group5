/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.IOrderDBContext;
import DAO.implement.OrderDBContext;
import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author ASUS
 */
public class ChangeStatusOrderController extends HttpServlet {
    IOrderDBContext orderDBContext= new OrderDBContext();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        ProductDBContext pDB = new ProductDBContext();
        Order order = new Order();
//        order = orderDBContext.getOrderByID(orderID);
        ArrayList<Order> orders = orderDBContext.getOrdersByOrderDetailId(orderID);
        ArrayList<Item> items = new ArrayList<Item>();
        int count = 0;
        for (Order tempOrder : orders) {
            Item item = new Item();
            count++;
            Product product = pDB.getProduct(tempOrder.getProductId());
            item.setId(count);
            item.setProduct(product);
            item.setQty(tempOrder.getQuantity());
            item.setPrice((Float.parseFloat(product.getPrice().replace(",", "")) - Float.parseFloat(product.getPrice().replace(",", "")) * (product.getDiscount() / 100)) * tempOrder.getQuantity());
            items.add(item);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("order", order);
        request.setAttribute("items", items);
        
        String path = "../view/adminModule/changeStatus.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        HttpSession session = request.getSession();
        Order order = (Order)session.getAttribute("order");
        java.util.Date rawDeliveryDate = null;
        Date deliveryDate = null;
        try {
            rawDeliveryDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("deliveryDate"));
        } catch (ParseException ex) {
            Logger.getLogger(ChangeStatusOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (rawDeliveryDate != null) {
            deliveryDate = new java.sql.Date(rawDeliveryDate.getTime());            
        }
        Calendar cal = Calendar.getInstance();
        java.util.Date date = cal.getTime();
        if (deliveryDate == null){
//            orderDBContext.updateOrderStatus(orderID, deliveryDate);
            request.setAttribute("successMsg", "cập nhập thành công");
        }
        if(deliveryDate.before(order.getOrderDate()) || deliveryDate.after(date) ){
            request.setAttribute("errorMsg", "ngày giao hàng không thể có trước ngày đặt hàng hay 1 ngày trong tương lai");
        }
        else{
//            orderDBContext.updateOrderStatus(orderID, deliveryDate);
            request.setAttribute("successMsg", "cập nhập thành công");
        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
