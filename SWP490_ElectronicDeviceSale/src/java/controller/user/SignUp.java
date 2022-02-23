/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         HungVT         First Implement

 */
package controller.user;

import DAO.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author HungVT
 */
public class SignUp extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        request.getRequestDispatcher("view/userModule/signUp.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        boolean gender = request.getParameter("gender").equals("male");
        String email = request.getParameter("email");
        int phoneNumber = Integer.parseInt(request.getParameter("phonenumber"));
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm");
        long millis = System.currentTimeMillis();
        java.sql.Date created = new java.sql.Date(millis);
        User u = userDB.isUserExisted(userName);
        try {
//            check user not exist
            if (u == null) {
//                check confirmpassword equals password
                if (confirmPassword.equals(password)) {
                    userDB.insertUser(name, userName, password, gender, phoneNumber, email, created);
                    response.sendRedirect("LoginController");
                } //                check confirmpassword not equals password
                else {
                    request.setAttribute("errorMsg", "Confirm password not match!");
                    request.getRequestDispatcher("view/userModule/signUp.jsp").forward(request, response);
                }
            }
//            check user exist
            else {
                request.setAttribute("errorMsg", "User existed!");
                request.getRequestDispatcher("view/userModule/signUp.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
