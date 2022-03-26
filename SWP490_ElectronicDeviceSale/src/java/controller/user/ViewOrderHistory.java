/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-21       1.0          CuongTV         First Implement

 */
package controller.user;

import DAO.IUserDBContext;
import DAO.implement.OrderDBContext;
import DAO.implement.ProductDBContext;
import DAO.implement.UserDBContext;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author CuongTV
 */
public class ViewOrderHistory extends HttpServlet {
    
    IUserDBContext userDBContext = new UserDBContext();

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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Order> orders = new ArrayList<>();
        String emptyText = "Chưa có đơn hàng";
        String status = "1";
        if (request.getParameter("show") != null) {
            status = request.getParameter("show");
        }
        session.setAttribute("indexStatus", status);
        String statusText = "";
        orders = oDB.getOrdersByUserId(user.getId(), "Xac nhan");
        statusText = "Chờ xác nhận";
        request.setAttribute("statusText", statusText);
        if ("2".equals(status)) {
            orders = oDB.getOrdersByUserId(user.getId(), "Cho lay hang");
            statusText = "Chờ lấy hàng";
            request.setAttribute("statusText", statusText);
        }
        if ("3".equals(status)) {
            orders = oDB.getOrdersByUserId(user.getId(), "Hoan tat");
            statusText = "Đã giao";
            request.setAttribute("statusText", statusText);
        }
        if ("4".equals(status)) {
            orders = oDB.getOrdersByUserId(user.getId(), "Da huy");
            statusText = "Đã huỷ";
            request.setAttribute("statusText", statusText);
            
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String deliveryDate = "";
        HashMap<Integer, ArrayList<Item>> params = new HashMap<>();
        ArrayList<Item> items = new ArrayList<Item>();
        int count = 0;
        int countOrder = 1;
        if (orders.isEmpty()) {
            request.setAttribute("emptyText", emptyText);
        } else {
            // Code to order division
            int orderDetailId = orders.get(0).getOrderDetail().getId();
            for (int i = 0; i < orders.size(); i++) {
                if (orderDetailId != orders.get(i).getOrderDetail().getId()) {
                    params.put(countOrder, items);
                    items = new ArrayList<>();
                    countOrder++;
                    orderDetailId = orders.get(i).getOrderDetail().getId();
                }
                deliveryDate = sdf.format(orders.get(i).getDeliveryDate());
                Item item = new Item();
                count++;
                Product product = pDB.getProduct(orders.get(i).getProductId());
                item.setOrderDetailId(orderDetailId);
                item.setDeliveryDate(Date.valueOf(deliveryDate));
                item.setId(count);
                item.setProduct(product);
                item.setQty(orders.get(i).getQuantity());
                item.setPrice((Float.parseFloat(product.getPrice().replace(",", "")) - Float.parseFloat(product.getPrice().replace(",", "")) * (product.getDiscount() / 100)) * orders.get(i).getQuantity());
                items.add(item);
                if (orderDetailId == orders.get(i).getOrderDetail().getId()) {
                    params.put(countOrder, items);
                }
            }
        }
        request.setAttribute("params", params);
        request.setAttribute("items", items);
        request.getRequestDispatcher("view/userModule/vieworderhistory.jsp").forward(request, response);
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
        String raw_keyword = request.getParameter("keyword");
        ProductDBContext pDB = new ProductDBContext();
        ArrayList<Product> products = pDB.searchProducts(raw_keyword);
        
        request.setAttribute("keyword", raw_keyword);
        request.setAttribute("found", products.size());
        request.setAttribute("products", products);
        request.getRequestDispatcher("view/userModule/searchproduct.jsp").forward(request, response);
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
