/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static Eclass.channel.getCurrentNumber;
import static Eclass.doctorClass.checkAvDate;

import static Eclass.channel.addChanel;

import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Date;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Eclass.extra;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lalendra
 */
@WebServlet(urlPatterns = {"/channelDoc"})
public class channelDoc extends HttpServlet {

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
            out.println("<title>Servlet channelDoc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet channelDoc at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
//          String parameter = request.getParameter("docName");
//        String date = request.getParameter("booking");
//        PrintWriter out = response.getWriter();
//        out.println(parameter);
//        out.println(date);
//        if(date==""){
//            out.println("xxx");
//        }
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
//        processRequest(request, response);
        String parameter = request.getParameter("docName");
        String date = request.getParameter("booking");
        String uName = (request.getParameter("uName")).replaceAll("\\s","");
        PrintWriter out = response.getWriter();
         String doc = parameter.replaceAll("\\s","");
        
//        out.println(parameter);
//        out.println(date);
        if("".equals(date)){
        response.sendRedirect("channelStep1.jsp?doc="+doc+"&st=1");
        }
        else{

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date x = new java.util.Date();
        String y = dateFormat.format(x);
//        out.println(y);
        java.util.Date z = null;
        try {
            z = dateFormat.parse(y);
        } catch (ParseException ex) {
            Logger.getLogger(channelDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
//        out.println(z);
        boolean before = false;
        try {
            before = z.before(dateFormat.parse(date));
        } catch (ParseException ex) {
            Logger.getLogger(channelDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
        if ("".equals(date) || !before) {
            response.sendRedirect("channelStep1.jsp?doc="+doc+"&st=1");
        }
        else{
        
        int dayOfWeek = 0;
        try {
             dayOfWeek = extra.getDayOfWeek(date);
//            out.println(dayOfWeek);
        } catch (Exception e) {
//            response.sendRedirect("channelStep1.jsp?doc="+parameter);
        }

        

        ResultSet checkAvDate = checkAvDate(doc, dayOfWeek);
        String av;
        try {
            if(checkAvDate.next()){
                av = checkAvDate.getString(1);
               
               if(av==null){
               response.sendRedirect("channelStep1.jsp?doc="+doc+"&st=1");
               }
               else{
                
                out.println(uName);
                 out.println(doc);
                out.println(date);
                out.println(av);
                
                int currentNumber = getCurrentNumber(doc,date);
                currentNumber++;
                out.println(currentNumber);
                
                    boolean addChanel = addChanel(date,uName,doc,av,currentNumber);
                    out.println(addChanel);
                    
                    if(!addChanel){
                    response.sendRedirect("channelStep1.jsp?doc="+doc+"&st=2");
                    }
               }
            }
        } catch (SQLException ex) {
            Logger.getLogger(channelDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        }
        
        }
        
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
