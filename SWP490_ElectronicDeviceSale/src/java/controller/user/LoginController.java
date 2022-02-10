package controller.user;

import DAO.UserDBContext;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

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
//        Cookie[] cookies = request.getCookies();
//        String username = "";
//        String password = "";
//        if (cookies != null) {
//            for (int i = 0; i < cookies.length; i++) {
//                if (cookies[i].getName().equals("username")) {
//                    username = cookies[i].getValue();
//                }
//                if (cookies[i].getName().equals("password")) {
//                    password = cookies[i].getValue();
//                }
//            }
//            User user = userDB.getUserByUserPass(username, password);
//
//            if (user != null) {
//                request.getRequestDispatcher("/view/userModule/homePage.jsp").forward(request, response);
//            } else {
//                request.getRequestDispatcher("/view/userModule/login.jsp").forward(request, response);
//            }
//
//        } else {
//            request.getRequestDispatcher("/view/userModule/login.jsp").forward(request, response);
//        }
        request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
        
    }
//response.sendRedirect(request.getContextPath() + "/");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        User user = userDB.getUserByUserPass(username, password);
        if (user != null) {
            if (remember != null) {
                Cookie c_user = new Cookie("username", username);
                Cookie c_pass = new Cookie("password", password);
                c_user.setMaxAge(3600 * 24);
                c_pass.setMaxAge(3600 * 24);
                response.addCookie(c_user);
                response.addCookie(c_pass);
            }
            request.getSession().setAttribute("name", user.getName());
            request.getRequestDispatcher("/view/userModule/homePage.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "Tài khoản đăng nhập hoặc mật khẩu sai !!!");
            request.getRequestDispatcher("/view/userModule/login.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
