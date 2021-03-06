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
 *
 * @author TruongVNN
 */
public class ChangePasswordController extends HttpServlet {

    IUserDBContext userDBContext = new UserDBContext();
    //init class userDBContext

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
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
        // forward to change password page
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
        try {
            HttpSession session = request.getSession();
            //Init session
            User user = (User) session.getAttribute("user");
            //Set value for user from session
            int id = user.getId();
            //Set user id value to a an integer
            String oldPassword = request.getParameter("currentPassword").trim();
            //Get value of curentPassword textbox in front end 
            String newPassword = request.getParameter("newPassword").trim();
            //Get value of newPassword textbox in front end 
            String confirmPassword = request.getParameter("confirmPassword").trim();
            //Get value of confirmPassword textbox in front end 
            if (oldPassword.compareTo(user.getPassWord()) == 0) {
                // Compare value of curentPassword textbox with newPassword textbox
                if (newPassword.isEmpty() || newPassword.length() == 0) {
                    request.setAttribute("errorMsg", "M???t kh???u kh??ng ???????c ????? tr???ng");//Display error message if new password is blank
                }
                if (newPassword.compareTo(confirmPassword) == 0) {
                    userDBContext.changePassword(id, newPassword);
                    //Change password in database
                    request.setAttribute("successMsg", "?????i m???t kh???u th??nh c??ng");//Display message successfully if confirm password equal new password
                } else {
                    request.setAttribute("errorMsg", "X??c nh???n m???t kh???u kh??ng ch??nh x??c");// display error message if new password not equal confirm password
                }
            } else {
                request.setAttribute("errorMsg", "M???t kh???u hi???n t???i kh??ng ????ng");// display error message if current password is wrong
            }
            
            
            
            
            
            String path = "view/userModule/changePassword.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);
            // forward to change password page
        } catch (Exception e) {
            Logger.getLogger(ChangePasswordController.class.getName()).log(Level.SEVERE, null, e);
        }
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
