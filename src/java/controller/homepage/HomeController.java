/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.Category;
import entity.PageControl;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Acer
 */
public class HomeController extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

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
        PageControl pageControl = new PageControl();
        List<Product> listProduct = findProductDoGet(request, pageControl);
        //get list category 
        List<Category> listCategory = categoryDAO.findAll();

        //set listProduct,listCategory to session
        HttpSession session = request.getSession();
        session.setAttribute(CommonConst.SESSION_PRODUCT, listProduct);
        session.setAttribute(CommonConst.SESSION_CATEGORY, listCategory);
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
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

    private List<Product> findProductDoGet(HttpServletRequest request, PageControl pageControl) {
        //get ve page
        String pageRaw = request.getParameter("page");
        //validate page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (Exception e) {
            page = 1;
        }
        //get ve search
        String actionSearch = request.getParameter("search") == null
                ? "default"
                : request.getParameter("search");
        //get list product dao
        List<Product> listProduct;
        //get request URL
        String requestURL = request.getRequestURL().toString();
        int totalRecord = 0;
        switch (actionSearch) {
            case "category":
                String categoryId = request.getParameter("categoryId");
                totalRecord = productDAO.findTotalRecordByCategory(categoryId);
                listProduct = productDAO.findByCategory(categoryId, page);
                pageControl.setUrlPattern(requestURL + "?search=category&categoryId=" + categoryId + "&");
                break;
            case "searchByName":
                String keyword = request.getParameter("keyword");
                totalRecord = productDAO.findTotalRecordByName(keyword);
                listProduct = productDAO.findByName(keyword, page);
                pageControl.setUrlPattern(requestURL + "?search=searchByName&keyword=" + keyword + "&");
                break;
            default:
                totalRecord = productDAO.findTotalRecord();
                listProduct = productDAO.findByPage(page);
                pageControl.setUrlPattern(requestURL + "?");
        }
        //total record
        //total page
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page,page current vao pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        return listProduct;
    }

}
