package controller.user;

import DAO.UserDBContext;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class LoginController extends HttpServlet {

    UserDBContext userDB = new UserDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);

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
        UserDBContext usserDB = new UserDBContext();
        try {
            User u = usserDB.getUserByUserPass(username, password);
            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home");
            } else {
//                request.setAttribute("errorMsg", "Tài khoản đăng nhập hoặc mật khẩu sai !!!");
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
