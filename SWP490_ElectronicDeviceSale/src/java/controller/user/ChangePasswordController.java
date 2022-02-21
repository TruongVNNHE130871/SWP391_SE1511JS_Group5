/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         TruongVNN         First Implement

 */
package controller.user;

import DAO.UserDBContext;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * 
 * @author TruongVNN
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
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getId();
//        int id = 2;
//        User user= userDBContext.getUserByID(2);
        String oldPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");        
        String confirmPassword = request.getParameter("confirmPassword");
        if(oldPassword.compareTo(user.getPassWord())==0){
            if(newPassword.isEmpty() || newPassword.trim().length() == 0)
                request.setAttribute("errorMsg", "New password cannot be blank");
            if(newPassword.compareTo(confirmPassword)==0){
                userDBContext.changePassword(id, newPassword.trim());
                request.setAttribute("successMsg", "Change password successfully");
            }                  
            else
                request.setAttribute("errorMsg", "Confirm password is wrong");
        }else 
            request.setAttribute("errorMsg", "Current password is wrong");
        
        String path = "view/userModule/changePassword.jsp";
        RequestDispatcher dispatcher= request.getRequestDispatcher(path);
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
