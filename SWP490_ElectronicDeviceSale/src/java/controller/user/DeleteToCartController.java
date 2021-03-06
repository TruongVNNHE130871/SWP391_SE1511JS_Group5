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
import java.text.NumberFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;
import model.Cart;
import model.Product;

/**
 *
 * @author VinhNT
 */
public class DeleteToCartController extends HttpServlet {

    ProductDBContext pDB = new ProductDBContext();
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
        int n = 0;//the number of products in the cart
        String id = request.getParameter("id"); // product id
        HttpSession session = request.getSession(true);
        Product product = pDB.getProduct(Integer.parseInt(id));;
        Cart cart = (Cart) session.getAttribute("cart");
        List<Item> listItems = cart.getItems();
        for (Item item : listItems) {
            if (item.getProduct().getId() == product.getId()) {
                cart.setSumPrice(cart.getSumPrice() - item.getPrice());//delete product price
                listItems.remove(item);// delete product
                break;
            }
        }
        cart.setItems(listItems);
        session.setAttribute("cart", cart);
        n = listItems.size();
        session.setAttribute("length_order", n);
        response.sendRedirect(request.getContextPath() + "/CartController");
        if (cart.getSumPrice() == 0) {
            session.setAttribute("sumprice", "0");
        } else {
             session.setAttribute("sumprice", currentLocale.format(cart.getSumPrice()));
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
