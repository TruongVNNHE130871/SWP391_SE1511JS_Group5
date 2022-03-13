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
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import model.Shop;
import org.kohsuke.rngom.parse.Parseable;

/**
 *
 * @author CuongTV
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
        ProductDBContext pDB = new ProductDBContext();
        Product p = new Product();
        String productName = request.getParameter("productName");
        String productImage = request.getParameter("productImage");

        String raw_productCategory = request.getParameter("cid");
        if (raw_productCategory == null || raw_productCategory.length() == 0) {
            raw_productCategory = "-1";
        }
        int productCategory = Integer.parseInt(raw_productCategory);

        String productDescription = request.getParameter("productDescription");
        String productPrice = request.getParameter("productPrice");
        String raw_productDiscount = request.getParameter("productDiscount");
        if (raw_productDiscount == null || raw_productDiscount.length() == 0) {
            raw_productDiscount = "0";
        }

        String raw_productSize = request.getParameter("productSize");
        if (raw_productSize == null || raw_productSize.length() == 0) {
            raw_productSize = "0";
        }

        String raw_productWeight = request.getParameter("productWeight");
        if (raw_productWeight == null || raw_productWeight.length() == 0) {
            raw_productWeight = "0";
        }

        String raw_productRam = request.getParameter("productRam");
        if (raw_productRam == null || raw_productRam.length() == 0) {
            raw_productRam = "0";
        }

        String productOrginal = request.getParameter("productOrginal");
        String productYear = request.getParameter("productYear");
        long millis = System.currentTimeMillis();
        java.sql.Date dateCreated = new java.sql.Date(millis);

        p.setName(productName);
        p.setImage(productImage);
        p.setDescription(productDescription);
        p.setPrice(productPrice);
        p.setDiscount(Float.parseFloat(raw_productDiscount));
        p.setStatus(true);
        Category category = new Category();
        category.setId(productCategory);
        p.setC(category);
        Shop shop = new Shop();
        shop.setId(1);
        p.setS(shop);
        p.setCreated(dateCreated);
        p.setSize(Float.parseFloat(raw_productSize));
        p.setWeight(Float.parseFloat(raw_productWeight));
        p.setRam(Integer.parseInt(raw_productRam));
        p.setOrginal(productOrginal);
        p.setYear(productYear);
        pDB.insertProduct(p);
        response.sendRedirect("ProductListController");

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
