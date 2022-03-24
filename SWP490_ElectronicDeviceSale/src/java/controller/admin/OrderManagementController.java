/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.IOrderDBContext;
import DAO.implement.OrderDBContext;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;

/**
 *
 * @author ASUS
 */
public class OrderManagementController extends HttpServlet {

    IOrderDBContext orderDBContext = new OrderDBContext();

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
        String indexPage = request.getParameter("pageIndex");
        if (indexPage == null) {
            indexPage = "1";
        }
        int pageIndex = Integer.parseInt(indexPage);
        HttpSession session = request.getSession();
        //init session
        int pageSize = 10;
        int countOrder = orderDBContext.getOrderRowCount();
        int maxPage = countOrder / pageSize;
        if (countOrder % pageSize != 0) {
            maxPage++;
        }
        String username = "";
        Date orderDate = null;
        Date deliveryDate = null;
        if (session.getAttribute("username") != null) {
            username = (String) session.getAttribute("username");
        }
        if (session.getAttribute("orderDate") != null) {
            orderDate = (Date) session.getAttribute("orderDate");
        }
        if (session.getAttribute("deliveryDate") != null) {
            deliveryDate = (Date) session.getAttribute("deliveryDate");
        }
        username.trim();
//        ArrayList<Order> orders = orderDBContext.listOrderPaging(username, orderDate, deliveryDate, pageIndex, pageSize);
//        session.setAttribute("orders", orders);
        request.setAttribute("maxPage", maxPage);
        String path = "../view/adminModule/orderList.jsp";
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
        HttpSession session = request.getSession();
        String searchUsername = request.getParameter("searchUsername").trim();
        java.util.Date rawSearchOrderDate = null;
        java.util.Date rawSearchDeliveryDate = null;
        java.sql.Date searchOrderDate = null;
        java.sql.Date searchDeliveryDate = null;
        try {
            rawSearchOrderDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("searchOrderDate"));
        } catch (ParseException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            rawSearchDeliveryDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("searchDelivaryDate"));
        } catch (ParseException ex) {
            Logger.getLogger(OrderManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (rawSearchOrderDate != null) {
            searchOrderDate = new java.sql.Date(rawSearchOrderDate.getTime());
        }
        if (rawSearchDeliveryDate != null) {
            searchDeliveryDate = new java.sql.Date(rawSearchDeliveryDate.getTime());
        }
        session.setAttribute("username", searchUsername);
        session.setAttribute("orderDate", searchOrderDate);
        session.setAttribute("deliveryDate", searchDeliveryDate);
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
