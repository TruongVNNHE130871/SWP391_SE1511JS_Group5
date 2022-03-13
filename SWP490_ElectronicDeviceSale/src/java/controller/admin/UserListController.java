/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-21        1.0         TruongVNN         First Implement
 */
package controller.admin;

import DAO.IUserDBContext;
import DAO.implement.UserDBContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ASUS
 */
public class UserListController extends HttpServlet {

    IUserDBContext userDBContext = new UserDBContext();

    //init class userDBContext
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
        try {
            String indexPage = request.getParameter("pageIndex");
            if (indexPage == null) {
                indexPage = "1";
            }
            int pageIndex = Integer.parseInt(indexPage);
            HttpSession session = request.getSession();
            //init session
            int pageSize = 10;
            int countUser = userDBContext.countTotalUser();
            int maxPage = countUser / pageSize;
            if (countUser % pageSize != 0) {
                maxPage++;
            }
            request.setAttribute("maxPage", maxPage);
            ArrayList<User> users = userDBContext.pagingUser(pageIndex, pageSize);
            //get all users data from database
            session.setAttribute("users", users);
            //set list of all user into session
            String path = "../view/adminModule/userList.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);
            // forward to change user list page
        } catch (Exception ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
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
        HttpSession session = request.getSession();
        String searchUserName = request.getParameter("search").trim();
        //init session
        session.setAttribute("searchUserName", searchUserName);
        response.sendRedirect("listUser/search");
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
