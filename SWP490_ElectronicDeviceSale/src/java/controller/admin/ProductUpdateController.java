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
import model.Shop;

/**
 *
 * @author BinhDV
 */
public class ProductUpdateController extends HttpServlet {

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
        ProductDBContext pDB = new ProductDBContext();
        CategoryDBContext cDB = new CategoryDBContext();
        ArrayList<Category> categories = cDB.getCategories();
        String raw_ProductID = request.getParameter("productID");
        if (raw_ProductID == null || raw_ProductID.length() == 0) {
            raw_ProductID = "-1";
        }
        Product product = pDB.getProduct(Integer.parseInt(raw_ProductID));
        String productPrice = product.getPrice().replace(",", "");
        request.setAttribute("categories", categories);
        request.setAttribute("product", product);
        request.setAttribute("productPrice", productPrice);
        request.getRequestDispatcher("view/adminModule/productUpdate.jsp").forward(request, response);
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
        String raw_ProductID = request.getParameter("productID");
        if (raw_ProductID == null || raw_ProductID.length() == 0) {
            raw_ProductID = "-1";
        }
        Product product = pDB.getProduct(Integer.parseInt(raw_ProductID));
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
        float productDiscount = Float.parseFloat(raw_productDiscount.trim());

        String raw_producRam = request.getParameter("productRam");
        if (raw_producRam == null || raw_producRam.length() == 0) {
            raw_producRam = "0";
        }
        int productRam = Integer.parseInt(raw_producRam.trim());

        product.setName(productName.trim());
        product.setImage(productImage.trim());
        product.setDescription(productDescription.trim());
        Category category = new Category();
        category.setId(productCategory);
        product.setC(category);
        product.setPrice(productPrice.trim());
        product.setDiscount(productDiscount);
        product.setRam(productRam);
        pDB.updateProduct(product);
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