/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import dto.CustomerDTO;
import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thehu
 */
@WebServlet(name = "DeleteAcountController", urlPatterns = {"/DeleteAcountController"})
public class DeleteAcountController extends HttpServlet {
    private final String ADMIN_PAGE = "admin.jsp";
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
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("txtUsername");
        String searchValue = request.getParameter("lastSearchValue");
        HttpSession session = request.getSession(false);
        String url = ADMIN_PAGE;
        boolean result = false;
        try {
            //1. Check validation
            if (session != null) {
                if (username != null) {
                    //2. Call DAO
                    CustomerDAO dao = new CustomerDAO();
                    result = dao.deleteAccount(username);
                } else {
                    result = true;
                }//end of check validation
                //3. refresh data grid --> call search
                if (result) {
//                    url = "SearchAccountController"
//                            + "?btAction=Search"
//                            + "&txtSearchValue=" + searchValue; //apply url rewriting of session tracking
                    url = ADMIN_PAGE;
                }//end delete is successful
            }//end if session existed
        } catch (SQLException ex) {
//            ex.printStackTrace();
            log("DeleteAccountServlet _ SQL _ " + ex.getMessage());
        } catch (NamingException ex) {
//            ex.printStackTrace();
            log("DeleteAccountServlet _ Naming _ " + ex.getMessage());
        } finally {
            response.sendRedirect(url);//Dùng forward thì lỗi 408
        }
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
