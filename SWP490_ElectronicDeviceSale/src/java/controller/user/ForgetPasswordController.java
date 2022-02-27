/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import DAO.IUserDBContext;
import DAO.implement.UserDBContext;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import utilities.MyUtility;

/**
 *
 * @author ASUS
 */
public class ForgetPasswordController extends HttpServlet {

    MyUtility myUtility = new MyUtility();
    IUserDBContext userDBContext = new UserDBContext();

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
        String path = "view/userModule/forgotPassword.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
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
        String email = request.getParameter("email");
        String randomPassword = myUtility.randomToken();
        int checkEmail;
        if (email.trim().isEmpty()) {
            request.setAttribute("errorMsg", "Email cannot be blank");
        } else {
            checkEmail = userDBContext.checkEmailExisted(email);
            if (checkEmail == 0) {
                request.setAttribute("errorMsg", "Email didn't exist or have to flow format abc@xyz.sdf");
            }
            if (checkEmail == 1) {
                userDBContext.changeUserPassByEmail(email, randomPassword);
                myUtility.sendNewPasswordToEmail(email, randomPassword);
                request.setAttribute("successMsg", "new Password have been sent to your email");
            }
        }
        String path = "view/userModule/forgotPassword.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
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
