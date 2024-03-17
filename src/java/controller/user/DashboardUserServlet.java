/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.CommonConst;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import entity.Account;
import entity.Order;
import entity.OrderDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class DashboardUserServlet extends HttpServlet {

    OrderDAO dao = new OrderDAO();
    OrderDetailsDAO odDao = new OrderDetailsDAO();

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
        HttpSession session = request.getSession();
        // Lấy accountId từ session
        int accountId = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();

        // Tìm danh sách đơn hàng đã thanh toán của tài khoản
        List<Order> paidOrders = dao.findPaidOrdersByAccountId(accountId);
        // Lấy danh sách chi tiết đơn hàng của các đơn hàng đã thanh toán
        List<OrderDetails> orderDetails = new ArrayList<>();
        for (Order order : paidOrders) {
            List<OrderDetails> details = odDao.findByOrderId(order.getId());
            orderDetails.addAll(details);
        }

        // Lưu danh sách đơn hàng và chi tiết đơn hàng vào session
        session.setAttribute(CommonConst.SESSION_ORDER, paidOrders);
        session.setAttribute(CommonConst.SESSION_ORDER_DETAILS, orderDetails);

        // Chuyển hướng sang trang dashboard
        request.getRequestDispatcher("view/user/dashboard.jsp").forward(request, response);
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
    }

}
