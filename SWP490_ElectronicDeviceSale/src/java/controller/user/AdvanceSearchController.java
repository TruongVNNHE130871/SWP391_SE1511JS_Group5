/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement

 */
package controller.user;

import DAO.implement.CategoryDBContext;
import DAO.implement.ManufacturerDBContext;
import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Manufacturer;
import model.Product;

/**
 *
 * @author CuongTV
 */
public class AdvanceSearchController extends HttpServlet {

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
        ProductDBContext pDB = new ProductDBContext();
        CategoryDBContext cDB = new CategoryDBContext();
        ManufacturerDBContext mDB = new ManufacturerDBContext();
        int categoryId = -1;
        int manufacturerId = -1;
        int searchByPrice = -1;
        String sort = "";
        try {
            String[] raw_categoryIds = request.getParameterValues("categoryId");
            categoryId = Integer.parseInt(raw_categoryIds[raw_categoryIds.length - 1]);
            String[] raw_manufacturerIds = request.getParameterValues("manufacturerId");
            manufacturerId = Integer.parseInt(raw_manufacturerIds[raw_manufacturerIds.length - 1]);
            String[] raw_prices = request.getParameterValues("searchPrice");
            searchByPrice = Integer.parseInt(raw_prices[raw_prices.length - 1]);
//            String sortPrice = request.getParameter("sortPrice");
//            if (sortPrice.equals("Giá thấp")) {
//                sort = "asc";
//
//            } else {
//                sort = "desc";
//            }
        } catch (Exception e) {
        }

        ArrayList<Product> products = pDB.advanceSearch(categoryId, manufacturerId, searchByPrice);
        ArrayList<Category> categories = cDB.getCategories();
        ArrayList<Manufacturer> manufacturers = mDB.getManufacturers();

        request.setAttribute("searchByPrice", searchByPrice);
        request.setAttribute("manufacturerId", manufacturerId);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("manufacturers", manufacturers);
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);

        request.getRequestDispatcher("view/userModule/advancesearch.jsp").forward(request, response);
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
