/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-21       1.0         VinhNT         First Implement

 */
package controller.user;

import DAO.implement.OrderDBContext;
import DAO.implement.OrderDetailDBContext;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author VinhNT
 */
public class PaymentController extends HttpServlet {

    OrderDetailDBContext odDB = new OrderDetailDBContext();
    OrderDBContext oDB = new OrderDBContext();

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
        request.getRequestDispatcher("view/userModule/payment.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        String user_session = request.getParameter("payment_usersession");
        String name = request.getParameter("payment_name");
        int phone = Integer.parseInt(request.getParameter("payment_phone"));
        String mail = request.getParameter("payment_email");
        String address = request.getParameter("payment_address");
        String note = request.getParameter("payment_note");
        String amount = request.getParameter("payment_amount");
        String created = request.getParameter("payment_created");
        String payment = "COD";
        String status = "Xac nhan";

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setUser_session(user_session);
        orderDetail.setUser_name(name);
        orderDetail.setUser_phone(phone);
        orderDetail.setUser_mail(mail);
        orderDetail.setAddress(address);
        orderDetail.setNote(note);
        orderDetail.setAmount(amount);
        orderDetail.setPayment(payment);
        orderDetail.setStatus(status);
        odDB.insert(orderDetail);

        int maxid = 0;
        List<OrderDetail> listOrderDetail = odDB.getAll();
        if (listOrderDetail.size() == 0) {
            maxid = 0;
        } else {
            for (OrderDetail listOrderDetail2 : listOrderDetail) {
                if (listOrderDetail2.getId() >= maxid) {
                    maxid = listOrderDetail2.getId();
                }
            }
        }

        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        List<Item> listItems = cart.getItems();
        for (Item item : listItems) {
            Order order = new Order();
            order.getUsername(user.getName());
            order.setProductId(item.getProduct().getId());
            order.setQuantity(item.getQty());
            order.setOrderDate(Date.valueOf(created));
            order.setOrderDetailId(maxid);
            oDB.insert(order);
        }
        if (session != null) {
            session.removeAttribute("cart"); //remove session
            session.removeAttribute("sumprice"); //remove session
            session.removeAttribute("length_order"); //remove session
        }
        response.sendRedirect(request.getContextPath() + "/HomePageController");
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
