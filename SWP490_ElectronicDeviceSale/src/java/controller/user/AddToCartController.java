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
import java.util.ArrayList;
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
public class AddToCartController extends HttpServlet {

    ProductDBContext pDB = new ProductDBContext();
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
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) { // check login status, if not then redirect to login page
            response.sendRedirect(request.getContextPath() + "/LoginController");
        } else {
            int n = 0; //the number of products in the cart
            int qty = 1; // default quantity of product when adding to cart
            String id; // product id
            if (request.getParameter("idProduct") != null) {// check product validity
                id = request.getParameter("idProduct");
                Product product = pDB.getProduct(Integer.parseInt(id));;
                if (product != null) { // check product validity
                    if (request.getParameter("qty") != null) { // check the qty attribute if it has a value then assign the value to the variable qty
                        qty = Integer.parseInt(request.getParameter("qty"));
                    }
                    if (session.getAttribute("cart") == null) {// In case the cart is empty
                        Cart cart = new Cart();
                        List<Item> listItems = new ArrayList<Item>();
                        Item item = new Item();
                        item.setQty(qty);
                        item.setProduct(product);
                        item.setPrice(Float.parseFloat(product.getPrice().replace(",", ""))
                                - Float.parseFloat(product.getPrice().replace(",", ""))
                                * (product.getDiscount() / 100)); // Calculate product price including discount
                        cart.setSumPrice(0);
                        cart.setSumPrice(cart.getSumPrice() + item.getPrice());
                        listItems.add(item);
                        cart.setItems(listItems);
                        n = listItems.size();
                        session.setAttribute("length_order", n);
                        session.setAttribute("cart", cart);
                        session.setAttribute("sumprice", cart.getSumPrice());
                        session.setAttribute("sumprice", currentLocale.format(cart.getSumPrice()));
                    } else { // case the user has added the product to the cart before
                        Cart cart = (Cart) session.getAttribute("cart");
                        List<Item> listItems = cart.getItems();
                        boolean check = false;
                        for (Item item : listItems) {
                            if (item.getProduct().getId() == product.getId()) { // add product quantity if product id is same
                                item.setQty(item.getQty() + qty);
                                cart.setSumPrice(cart.getSumPrice() + Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                                        - Float.parseFloat(item.getProduct().getPrice().replace(",", "")) * (item.getProduct().getDiscount() / 100));
                                item.setPrice(item.getPrice() + (Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                                        - Float.parseFloat(item.getProduct().getPrice().replace(",", "")) * ((item.getProduct().getDiscount()) / 100)));
                                check = true;
                            } else {
                            }
                        }
                        if (check == false) { // The product in the cart is different from the newly added product
                            Item item = new Item();
                            item.setQty(qty);
                            item.setProduct(product);
                            item.setPrice(Float.parseFloat(product.getPrice().replace(",", "")) - Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                                    * ((item.getProduct().getDiscount()) / 100));
                            cart.setSumPrice(cart.getSumPrice() + Float.parseFloat(item.getProduct().getPrice().replace(",", ""))
                                    - Float.parseFloat(item.getProduct().getPrice().replace(",", "")) * ((item.getProduct().getDiscount()) / 100));
                            listItems.add(item);
                        }
                        n = listItems.size();
                        session.setAttribute("length_order", n);
                        session.setAttribute("cart", cart);
                        session.setAttribute("sumprice", currentLocale.format(cart.getSumPrice()));
                    }
                }
                response.sendRedirect(request.getContextPath() + "/HomePageController");
            } else {
                response.sendRedirect(request.getContextPath() + "/HomePageController");
            }
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
