/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import DAO.implement.OrderDBContext;
import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class BuyAgainController extends HttpServlet {

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
        NumberFormat currentLocale = NumberFormat.getInstance();
        HttpSession session = request.getSession();
        OrderDBContext oDB = new OrderDBContext();
        ProductDBContext pDB = new ProductDBContext();
        String raw_orderDetailId = request.getParameter("orderDetailId");
        if (raw_orderDetailId == null || raw_orderDetailId.length() == 0) {
            raw_orderDetailId = "-1";
        }
        ArrayList<Item> items = new ArrayList<Item>();
        ArrayList<Order> orders = oDB.getOrdersByOrderDetailIdForCart(Integer.parseInt(raw_orderDetailId));
        Cart cart = new Cart();

        for (Order order : orders) {
            Item item = new Item();
            item.setOrderDetailId(order.getOrderDetail().getId());
            item.setQty(order.getQuantity());
            Product product = pDB.getProduct(order.getProductId());
            item.setProduct(product);
            item.setPrice((Float.parseFloat(product.getPrice().replace(",", "")) - Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                    * ((item.getProduct().getDiscount()) / 100)) * item.getQty());
            cart.setSumPrice(cart.getSumPrice() + item.getPrice());
            items.add(item);
        }
        cart.setItems(items);
        session.setAttribute("length_order", items.size());
        session.setAttribute("cart", cart);
        session.setAttribute("sumprice", currentLocale.format(cart.getSumPrice()));
        request.getRequestDispatcher("view/userModule/cart.jsp").forward(request, response);
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
