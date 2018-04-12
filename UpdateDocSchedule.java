/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Eclass.adminClass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lalendra
 */
@WebServlet(urlPatterns = {"/UpdateDocSchedule"})
public class UpdateDocSchedule extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateDocSchedule</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDocSchedule at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        // processRequest(request, response);
        //sun=&mon=MORNING&tus=&wed=&thu=EVENING&fri=&sat=EVENING
        PrintWriter out = response.getWriter();
        String sun = request.getParameter("sun");
        String mon = request.getParameter("mon");
        String tus = request.getParameter("tus");
        String wed = request.getParameter("wed");
        String thu = request.getParameter("thu");
        String fri = request.getParameter("fri");
        String sat = request.getParameter("sat");
        String docName = request.getParameter("docName");
        //out.println(parameter6);
        adminClass obj = new adminClass();
        boolean updatDoctorSchedule = obj.updatDoctorSchedule(docName,sun,mon,tus,wed,thu,fri,sat);
        
        //out.println(updatDoctorSchedule);
        
         response.sendRedirect("editDoctors.jsp?val="+docName);
        
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
