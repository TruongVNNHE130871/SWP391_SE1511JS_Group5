/*
 * TCopyright(C) 2021, Class SE1511-JS of FPT University
 * EDS.Shop
 * Electronic Device Sale Shop
 * Record of change:
 * DATE            Version       AUTHOR          DESCRIPTION
 * 2022-01-09       1.0         CuongTV         First Implement
 */
package controller.user;

import model.Review;
import DAO.implement.ProductDBContext;
import DAO.implement.ReviewDBContext;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.paramValueType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author CuongTV
 */
public class ProductDetailController extends HttpServlet {

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
        ReviewDBContext rDB = new ReviewDBContext();

        String idProduct = request.getParameter("idProduct");
        int idP = Integer.parseInt(idProduct);
        Product p = pDB.getProduct(idP);
        request.setAttribute("product", p);
        List<Review> reviewById = rDB.getReviewById(idP);
        request.setAttribute("reviewbyid", reviewById);
        request.getRequestDispatcher("view/userModule/productdetail.jsp").forward(request, response);

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
