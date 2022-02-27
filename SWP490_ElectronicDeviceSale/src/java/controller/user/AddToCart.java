/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.user;

import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
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
 * @author VinhNT
 */
public class AddToCart extends HttpServlet {

    ProductDBContext pDB = new ProductDBContext();
    DecimalFormat df = new DecimalFormat("#.000");

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
        int n = 0;
        int qty = 1;
        String id;
        if (request.getParameter("idProduct") != null) {
            id = request.getParameter("idProduct");
            Product product = pDB.getProduct(Integer.parseInt(id));;
            if (product != null) {
                if (request.getParameter("qty") != null) {
                    qty = Integer.parseInt(request.getParameter("qty"));
                }
                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Item> listItems = new ArrayList<Item>();
                    Item item = new Item();
                    item.setQty(qty);
                    item.setProduct(product);
                    item.setPrice(Double.parseDouble(product.getPrice()));
                    order.setSumPrice(0);
                    order.setSumPrice(order.getSumPrice() + item.getPrice());
                    listItems.add(item);
                    order.setItems(listItems);
                    n = listItems.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<Item> listItems = order.getItems();
                    boolean check = false;
                    for (Item item : listItems) {
                        if (item.getProduct().getId() == product.getId()) {
                            item.setQty(item.getQty() + qty);
                            order.setSumPrice(order.getSumPrice() + Double.parseDouble(item.getProduct().getPrice()));
                            item.setPrice(item.getPrice() + (Double.parseDouble(item.getProduct().getPrice())));
                            check = true;
                        } else {
                        }
                    }
                    if (check == false) {
                        Item item = new Item();
                        item.setQty(qty);
                        item.setProduct(product);
                        item.setPrice(Double.parseDouble(product.getPrice()));
                        order.setSumPrice(order.getSumPrice() + Double.parseDouble(item.getProduct().getPrice()));
                        listItems.add(item);
                    }
                    n = listItems.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                }
            }
            response.sendRedirect(request.getContextPath() + "/HomePageController");
        } else {
            response.sendRedirect(request.getContextPath() + "/HomePageController");
        }
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
