/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement

 */
package controller.user;

import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 * This class performs product data retrieval from the database and redirects to
 * display the home page
 *
 * @author VinhNT
 */
public class HomePageController extends HttpServlet {

    /**
     * redirect to home page
     *
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDBContext db = new ProductDBContext();
        int pagesize = 8;
        String raw_page = request.getParameter("page");
        if (raw_page == null || raw_page.length() == 0) {
            raw_page = "1";
        }

        int pageindex = Integer.parseInt(raw_page);
        int totalRows = db.getRowCount();
        int totalpage = (totalRows % pagesize == 0) ? totalRows / pagesize : (totalRows / pagesize) + 1;
        ArrayList<Product> products = db.getProducts(pageindex, pagesize);

        request.setAttribute("products", products);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("view/userModule/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_keyword = request.getParameter("keyword");
        ProductDBContext pDB = new ProductDBContext();
        ArrayList<Product> products = pDB.searchProducts(raw_keyword);

        request.setAttribute("keyword", raw_keyword);
        request.setAttribute("found", products.size());
        request.setAttribute("products", products);
        request.getRequestDispatcher("view/userModule/searchproduct.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
