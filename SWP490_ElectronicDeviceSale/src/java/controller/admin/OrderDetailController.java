/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.implement.OrderDBContext;
import DAO.implement.OrderDetailDBContext;
import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author CuongTV
 */
public class OrderDetailController extends HttpServlet {

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
        OrderDBContext oDB = new OrderDBContext();
        ProductDBContext pDB = new ProductDBContext();

        String raw_orderDetailId = request.getParameter("orderDetailId");
        if (raw_orderDetailId == null || raw_orderDetailId.length() == 0) {
            raw_orderDetailId = "-1";
        }
        int orderDetailId = Integer.parseInt(raw_orderDetailId);

        ArrayList<Order> orders = oDB.getOrdersByOrderDetailId(orderDetailId);
        ArrayList<Item> items = new ArrayList<Item>();
        int count = 0;
        float sumPrice = 0;
        for (Order order : orders) {
            Item item = new Item();
            count++;
            Product product = pDB.getProduct(order.getProductId());
            item.setId(count);
            item.setProduct(product);
            item.setQty(order.getQuantity());
            item.setPrice((Float.parseFloat(product.getPrice().replace(",", "")) - Float.parseFloat(product.getPrice().replace(",", "")) * (product.getDiscount() / 100)) * order.getQuantity());
            sumPrice += item.getPrice();
            items.add(item);
        }
        Order order = orders.get(0);

        request.setAttribute("order", order);
        request.setAttribute("items", items);
        request.setAttribute("sumPrice", sumPrice);
        request.getRequestDispatcher("view/adminModule/orderDetail.jsp").forward(request, response);
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
