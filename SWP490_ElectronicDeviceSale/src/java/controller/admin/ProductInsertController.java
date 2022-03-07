/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import DAO.implement.CategoryDBContext;
import DAO.implement.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import org.kohsuke.rngom.parse.Parseable;

/**
 *
 * @author BH1704
 */
public class ProductInsertController extends HttpServlet {

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
        CategoryDBContext cDB = new CategoryDBContext();
        ArrayList<Category> categories = cDB.getCategories();
        String raw_ProductID = request.getParameter("productID");
        if (raw_ProductID == null || raw_ProductID.length() == 0) {
            raw_ProductID = "-1";
        }
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("view/adminModule/productAdd.jsp").forward(request, response);
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
        Product p = new Product();
        String productName = request.getParameter("productName");
        String productImage = request.getParameter("productImage");
        String raw_productCategory = request.getParameter("cid");
        String productDescription = request.getParameter("productDescription");
        String raw_productPrice = request.getParameter("productPrice");

        String raw_productDiscount = request.getParameter("productDiscount");

        if (raw_productPrice == null || raw_productPrice.length() == 0) {
            raw_productPrice = "-1";
        }
        int productPrice = Integer.parseInt(raw_productPrice);
        p.setName(productName);
        p.setImage(productImage);
        p.setDescription(productDescription);

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
