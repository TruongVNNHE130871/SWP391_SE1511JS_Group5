/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement

 */
package controller.user;

import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author CUongTV
 */
public class SearchController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDBContext pDB = new ProductDBContext();
        HttpSession session = request.getSession();

        //Keyword
        String raw_keyword = request.getParameter("keyword").trim();
        session.setAttribute("keyword", raw_keyword);

        //Paging
        int pagesize = 8;
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }

        //Filter
        String raw_filterindex = request.getParameter("filterindex");
        if (raw_filterindex == null || raw_filterindex.length() == 0) {
            raw_filterindex = "2";
        }
        int filterindex = Integer.parseInt(raw_filterindex);
        session.setAttribute("filterindex", filterindex);
        int pageindex = Integer.parseInt(raw_page);
        int totalRows = pDB.getRowCountSearch(raw_keyword);
        int totalpage = (totalRows % pagesize == 0) ? totalRows / pagesize : (totalRows / pagesize) + 1;
        ArrayList<Product> products = pDB.filterProducts(filterindex, raw_keyword, pageindex, pagesize);

//        ArrayList<Product> products = pDB.searchProducts2(filterText, raw_keyword);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("found", totalRows);
        request.setAttribute("products", products);

        request.getRequestDispatcher("view/userModule/searchproduct.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
