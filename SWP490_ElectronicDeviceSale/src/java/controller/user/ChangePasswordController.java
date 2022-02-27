/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         TruongVNN         First Implement

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
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * 
 * @author TruongVNN
 */
public class ChangePasswordController extends HttpServlet {
    IUserDBContext userDBContext= new UserDBContext();
   
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
        //Init session
        User user = (User)session.getAttribute("user");
        //Set value for user from session
        int id = user.getId();
        //Set user id value to a an integer
        String oldPassword = request.getParameter("currentPassword");
        //Get value of curentPassword textbox in front end 
        String newPassword = request.getParameter("newPassword");
        //Get value of newPassword textbox in front end 
        String confirmPassword = request.getParameter("confirmPassword");
        //Get value of confirmPassword textbox in front end 
        if(oldPassword.compareTo(user.getPassWord())==0){
            // Compare value of curentPassword textbox with newPassword textbox
            if(newPassword.isEmpty() || newPassword.trim().length() == 0)
                request.setAttribute("errorMsg", "New password cannot be blank");//Display error message if new password is blank
            if(newPassword.compareTo(confirmPassword)==0){
                userDBContext.changePassword(id, newPassword.trim());
                //Change password in database
                request.setAttribute("successMsg", "Change password successfully");//Display message successfully if confirm password equal new password
            }                  
            else
                request.setAttribute("errorMsg", "Confirm password is wrong");// display error message if new password not equal confirm password
        }else 
            request.setAttribute("errorMsg", "Current password is wrong");// display error message if current password is wrong
        
        String path = "view/userModule/changePassword.jsp";
        RequestDispatcher dispatcher= request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
        // forward to change password page
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
