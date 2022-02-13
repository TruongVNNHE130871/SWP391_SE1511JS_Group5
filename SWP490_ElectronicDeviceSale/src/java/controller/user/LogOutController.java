/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VinhNT
 */
public class LogOutController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("username"); //remove session
            Cookie c_user = new Cookie("username", "");
            Cookie c_pass = new Cookie("password", "");
            c_user.setMaxAge(-1);
            c_pass.setMaxAge(-1);
            response.addCookie(c_pass);
            response.addCookie(c_user);
        }
        response.sendRedirect("HomePageController");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
