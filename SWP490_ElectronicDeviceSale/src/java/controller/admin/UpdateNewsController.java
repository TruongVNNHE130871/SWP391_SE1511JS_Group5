<<<<<<< Updated upstream
/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.admin;

import DAO.implement.NewsDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;

/**
 *
 * @author VinhNT
 */
public class UpdateNewsController extends HttpServlet {

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
        NewsDBContext nDB = new NewsDBContext();
        int newsID = Integer.parseInt(request.getParameter("newsID"));
        News news = nDB.get(newsID);
        request.setAttribute("news", news);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/adminModule/updateNews.jsp");
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
        NewsDBContext nDB = new NewsDBContext();
        News news = new News();
        news.setId(Integer.parseInt(request.getParameter("id")));
        news.setTitle(request.getParameter("title").replaceAll("\\s+", " ").trim());
        news.setContent(request.getParameter("content").replaceAll("\\s+", " ").trim());
        news.setImage(request.getParameter("image").replaceAll("\\s+", " ").trim());
        news.setAuthor(request.getParameter("author").replaceAll("\\s+", " ").trim());
        nDB.edit(news);
       response.sendRedirect("NewsManagementController?keyword=");
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
=======
/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.admin;

import DAO.implement.NewsDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;

/**
 *
 * @author VinhNT
 */
public class UpdateNewsController extends HttpServlet {

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
        NewsDBContext nDB = new NewsDBContext();
        int newsID = Integer.parseInt(request.getParameter("newsID"));
        News news = nDB.get(newsID);
        request.setAttribute("news", news);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/adminModule/updateNews.jsp");
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
        NewsDBContext nDB = new NewsDBContext();
        News news = new News();
        news.setId(Integer.parseInt(request.getParameter("id")));
        news.setTitle(request.getParameter("title").replaceAll("\\s+", " ").trim());
        news.setContent(request.getParameter("content").replaceAll("\\s+", " ").trim());
        news.setImage(request.getParameter("image").replaceAll("\\s+", " ").trim());
        news.setAuthor(request.getParameter("author").replaceAll("\\s+", " ").trim());
        nDB.edit(news);
       response.sendRedirect("NewsManagementController?keyword=");
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
>>>>>>> Stashed changes
