/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-20       1.0         TruongVNN         First Implement
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
import utilities.MyUtility;

/**
 *
 * @author TruongVNN
 */
public class ForgetPasswordController extends HttpServlet {

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
            MyUtility myUtility = new MyUtility();
            //init class utility
            IUserDBContext userDBContext = new UserDBContext();
            //init class userDBContext
            String email = request.getParameter("email").trim();
            //get value email of the account that forgot password
            String randomPassword = myUtility.randomToken();
            //random password using utility
            int checkEmail;
            //init a checkvalue about Email
            if (email.trim().isEmpty()) {
                //if email is blank
                request.setAttribute("errorMsg", "Email cannot be blank");
                // return error messgae that this email cannot be blank
            } else {
                //if email is not blank
                checkEmail = userDBContext.checkEmailExisted(email);
                //check email user input and set value for check value
                if (checkEmail == 0) {
                    //if email didn't exist in the database
                    request.setAttribute("errorMsg", "Email didn't exist");
                    //return message that email didn't exist
                }
                if (checkEmail == 1) {
                    //if email existed in database
                    userDBContext.changeUserPassByEmail(email, randomPassword);
                    //change account password to random password 
                    myUtility.sendNewPasswordToEmail(email, randomPassword);
                    //send mail to the account requested to annouce their email
                    request.setAttribute("successMsg", "new Password have been sent to your email");
                    //return message that say new password have been set anew
                }
            }
            String path = "view/userModule/forgotPassword.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(path);
            dispatcher.forward(request, response);
            // forward to change password page
        } catch (Exception e) {
            Logger.getLogger(ForgetPasswordController.class.getName()).log(Level.SEVERE, null, e);
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
