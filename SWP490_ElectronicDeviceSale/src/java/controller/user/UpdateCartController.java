/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Cart;

/**
 *
 * @author VinhNT
 */
public class UpdateCartController extends HttpServlet {

//    DecimalFormat df = new DecimalFormat("#.000");
    NumberFormat currentLocale = NumberFormat.getInstance();

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
        RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/CartController");
        dispatcher.forward(request, response);
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
        Cart cart = (Cart) session.getAttribute("order");
        List<Item> listItems = cart.getItems();
        cart.setSumPrice(0);
        for (Item item : listItems) {
            String v = String.valueOf(item.getProduct().getId());
            item.setQty(Integer.parseInt(request.getParameter(v)));
            item.setPrice((Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                    - Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                    * ((item.getProduct().getDiscount()) / 100))
                    * Integer.parseInt(request.getParameter(v)));
            cart.setSumPrice(cart.getSumPrice() + item.getPrice());
        }
        cart.setItems(listItems);
        session.setAttribute("order", cart);
        session.setAttribute("sumprice", currentLocale.format(cart.getSumPrice()));
        response.sendRedirect(request.getContextPath() + "/CartController");

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
