/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.implement.OrderDBContext;
import DAO.implement.OrderDetailDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author BinhDV
 */
public class ViewAllOrderController extends HttpServlet {

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
        OrderDetailDBContext odDB = new OrderDetailDBContext();
        HttpSession session = request.getSession();
        String status = "";
        int pagesize = 8;
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }

        //Filter
        String raw_statusIndex = request.getParameter("statusIndex");
        if (raw_statusIndex == null || raw_statusIndex.length() == 0) {
            raw_statusIndex = "-1";
        }

        switch (raw_statusIndex) {
            case "-1":
                status = "All";
                break;
            case "1":
                status = "Xac nhan";
                break;
            case "2":
                status = "Cho lay hang";
                break;
            case "3":
                status = "Hoan tat";
                break;
            case "4":
                status = "Da huy";
                break;
        }
        int statusIndex = Integer.parseInt(raw_statusIndex);
        session.setAttribute("statusIndex", statusIndex);
        int pageindex = Integer.parseInt(raw_page);
        int totalRows = odDB.getRowCountOrderDetail(status);
        int totalpage = (totalRows % pagesize == 0) ? totalRows / pagesize : (totalRows / pagesize) + 1;
        List<OrderDetail> orderdetails = odDB.getAllOrderDetails(status, pageindex, pagesize);

        request.setAttribute("orderdetails", orderdetails);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("view/adminModule/viewOrder.jsp").forward(request, response);
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
