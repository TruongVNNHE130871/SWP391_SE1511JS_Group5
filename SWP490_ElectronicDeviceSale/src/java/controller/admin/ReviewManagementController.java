/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.admin;

import DAO.implement.ReviewDBContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Review;

/**
 *
 * @author VinhNT
 */
public class ReviewManagementController extends HttpServlet {

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
        ReviewDBContext rDB = new ReviewDBContext();
        HttpSession session = request.getSession();

        //Paging
        int pagesize = 8;
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }

        //Keyword
        String raw_keyword = request.getParameter("keyword").replaceAll(" ", "");
        session.setAttribute("keyword", raw_keyword);

        //Filter
        String raw_starIndex = request.getParameter("starIndex");
        if (raw_starIndex == null || raw_starIndex.length() == 0) {
            raw_starIndex = "-1";
        }

        int starIndex = Integer.parseInt(raw_starIndex);
        session.setAttribute("starIndex", starIndex);
        int pageindex = Integer.parseInt(raw_page);
        int totalRows = rDB.getRowCountReviews(raw_keyword);
        int totalpage = (totalRows % pagesize == 0) ? totalRows / pagesize : (totalRows / pagesize) + 1;
        ArrayList<Review> reviews = rDB.listAllReviews(raw_keyword, starIndex, pageindex, pagesize);

        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("view/adminModule/reviewManagement.jsp").forward(request, response);
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
