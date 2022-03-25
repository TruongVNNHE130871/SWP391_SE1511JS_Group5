/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.user;

import DAO.implement.UserDBContext;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author VinhNT
 */
public class LoginController extends HttpServlet {

    UserDBContext userDB = new UserDBContext();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

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
        request.getSession().removeAttribute("inputUsername");
        request.getSession().removeAttribute("inputPassword");
        request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
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
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username").toLowerCase().replaceAll(" ", "");
        String password = request.getParameter("password");
        User u = userDB.getUserByUserPass(username, password); // check valid account
        try {
            if (u != null && u.getPassWord().equals(password)) { // correct account 
                if (u.isStatus() == true) { // Account works normally
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("user", u);
                    response.sendRedirect("HomePageController");
                }
                if (u.isStatus() == false) { // banned account
                    request.setAttribute("inputUsername", username);
                    request.setAttribute("inputPassword", password);
                    request.setAttribute("errorMsg", "Bạn không thể đăng nhập vào lúc này!");
                    request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
                }
            } else {
                if (username.equals("") && password.equals("")) { // username and password is blank
                    request.setAttribute("errorMsg", "Bạn phải nhập tài khoản và mật khẩu!");
                    request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
                } else if (username.equals("")) { // account is blank
                    request.getSession().setAttribute("inputPassword", password);
                    request.setAttribute("errorMsg", "Bạn phải nhập tài khoản!");
                    request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
                } else if (password.equals("")) { // password is blank
                    request.getSession().removeAttribute("inputPassword");
                    request.setAttribute("inputUsername", username);
                    request.setAttribute("errorMsg", "Bạn phải nhập mật khẩu!");
                    request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
                } else { // username and password incorrect
                    request.setAttribute("inputUsername", username);
                    request.setAttribute("inputPassword", password);
                    request.setAttribute("errorMsg", "Tài khoản hoặc mật khẩu sai!");
                    request.getRequestDispatcher("view/userModule/login.jsp").forward(request, response);
                }
            }
        } catch (IOException | ServletException e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
