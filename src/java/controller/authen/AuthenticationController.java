/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import constant.CommonConst;
import dal.implement.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URL;

/**
 *
 * @author Acer
 */
public class AuthenticationController extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();

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
        //get ve action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        //dua theo action, set URL trang can chuyen den
        String url;
        switch (action) {
            case "login":
                url = "view/authen/login.jsp";
                break;
            case "log-out":
                url = logOut(request, response);
            default:
                url = "home";
        }
        //chuyen trang
        request.getRequestDispatcher(url).forward(request, response);
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
        //get ve action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        //dua theo action, set URL trang can chuyen den
        String url;
        switch (action) {
            case "login":
                url = loginDoPost(request, response);
                break;
            default:
                url = "home";
        }
        //chuyen trang
        request.getRequestDispatcher(url).forward(request, response);
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

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        //get ve cac thong tin nguoi dung nhap
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //kiem tra thong tin co ton tai trong DB ko?
        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        Account accFoundByUsernamePass = accountDAO.findByUsernameAndPass(account);
        //true ==> home (set account vao trong session)
        if (accFoundByUsernamePass != null) {
            request.getSession().setAttribute(CommonConst.SESSION_ACCOUNT,
                    accFoundByUsernamePass);
            url = "home";
            //false ==> login (error:tk hoac mk khong dung)
        } else {
            request.setAttribute("error", "Username or password incorrect!!");
            url = "view/authen/login.jsp";
        }

        return url;
    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        return "home";
    }

}
