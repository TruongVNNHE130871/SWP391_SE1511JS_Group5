package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Cookie c_user = new Cookie("username", "");
            Cookie c_pass = new Cookie("password", "");
            c_user.setMaxAge(-1);
            c_pass.setMaxAge(-1);
            response.addCookie(c_pass);
            response.addCookie(c_user);
            session.removeAttribute("username"); //remove session
        }
        request.getRequestDispatcher("/view/userModule/homePage.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
