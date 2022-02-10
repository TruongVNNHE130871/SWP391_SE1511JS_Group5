package controller.user;

import DAO.UserDBContext;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

public class LoginController extends HttpServlet {

    UserDBContext userDB = new UserDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username")) {
                    username = cookies[i].getValue();
                }
                if (cookies[i].getName().equals("password")) {
                    password = cookies[i].getValue();
                }
            }
            User u = userDB.getUserByUserPass(username, password);

            if (u != null) {

                response.sendRedirect("HomePageController");
            } else {
                request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
        }

    }
//response.sendRedirect(request.getContextPath() + "/");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        User u = userDB.getUserByUserPass(username, password);
        try {
            if (u != null) {
                if (remember != null) {
                    Cookie c_user = new Cookie("username", username);
                    Cookie c_pass = new Cookie("password", password);
                    c_user.setMaxAge(3600 * 24);
                    c_pass.setMaxAge(3600 * 24);
                    response.addCookie(c_user);
                    response.addCookie(c_pass);
                }
                request.getSession().setAttribute("username", username);
                response.sendRedirect("HomePageController");
            } else {
                request.setAttribute("errorMsg", "Wrong username or password!");
                request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
