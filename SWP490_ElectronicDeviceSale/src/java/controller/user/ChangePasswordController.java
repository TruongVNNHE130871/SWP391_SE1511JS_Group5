/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import DAO.UserDBContext;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ASUS
 */
public class ChangePasswordController extends HttpServlet {
    UserDBContext userDBContext= new UserDBContext();
    

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
        String path = "view/userModule/changePassword.jsp";
        RequestDispatcher dispatcher= request.getRequestDispatcher(path);
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
        int id = 2;
        User user = userDBContext.getUserByID(id);
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");        
        String confirmPassword = request.getParameter("confirmPassword");
        if(oldPassword.compareTo(user.getPassWord())==0){
            if(newPassword.compareTo(confirmPassword)==0){
                userDBContext.changePassword(id, newPassword);
                request.setAttribute("successMsg", "Change password successfully");
            }                  
            else
                request.setAttribute("errorMsg", "Confirm password is wrong");
        }else 
            request.setAttribute("errorMsg", "Old password is wrong");
        
        String a = "change password.jsp";
        RequestDispatcher dispatcher= request.getRequestDispatcher(a);
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
