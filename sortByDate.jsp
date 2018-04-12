<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>






<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="Eclass.adminClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Eclass.user"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    }
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                userName = cookie.getValue();

            }
        }
    }
    if (userName == null || !userName.equals("admin")) {
        response.sendRedirect("Home.jsp");
    }

    String date = request.getParameter("date");
    if (date.equals("")) {
        response.sendRedirect("adminHome.jsp");
    }

    adminClass obj = new adminClass();


%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>E channeling</title>
        <link href="theme/css/main.css" rel="stylesheet" media="screen" />
        <link href="theme/css/default/default.css" rel="stylesheet" media="screen" />


        <link href="bootstrap/css/bootstrap.css" rel="stylesheet"></link>
        <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet"></link>
        <link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"></link>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
        <link href="bootstrap/css/customcss.css" rel="stylesheet"></link>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="imageslider/responsiveslides.css"/>
        <script src="imageslider/responsiveslides.min.js"></script>






    </head>


    <body>



        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="col-sm-1 sidenav">

                </div>
                <div class="col-sm-10 text-left"> 
                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>                        
                                </button>
                                <img src="theme/imgs/The-Doctors-Channel.png" width="150px"/>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav">
                                    <li class="active" ><a href="adminHome.jsp">Home</a></li>
                                    <!-- <li ><a href="">Channel History</a></li>
                                     <li><a href="#">Check Up History</a></li>-->
                                    <li ><a href="adminAccount.jsp">Admin Account</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li>
                                        <form action="Logout" method="post">
                                            <input type="submit" value="Logout" class="btn btn-danger" >
                                        </form><br> <font style="color: blue">Welcome <%=userName%></font></li>


                                </ul>
                            </div>
                        </div>
                    </nav>


                        <%
                        ArrayList<String[]> List = new ArrayList<>();
                        List = obj.getSummryOfChannelByDate(date);
                    %> 


                    <div class="container-fluid" >
                        <ul>
                            <li style="display: inline"><a href="adminHome.jsp">Home</a> <span class="divider">/</span></li>

                            <li style="display: inline" class="active">Sort By date </li>
                        </ul>
                        <br>
                        <%=date%>
                        <div class="row content">

                            <div class="col-sm-6" >
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        Summary
                                    </div>
                                    <div class="panel-body">
                                         <table class="table table-hover">
                                            <tr>
                                               
                                                <th><strong>Doc. Name</strong></th>
                                                <th><strong>Time</strong></th>
                                                <th><strong>Appointments</strong></th>

                                            </tr>
                                            <tbody>
                                                <%
                                                    for (String[] strings : List) {
                                                        out.println("<tr>");
                                                        for (String s : strings) {

                                                            out.print("<td>" + s + "</td>");

                                                        }
                                                        out.println("</tr>");
                                                    }
                                                %>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>

                            <%
                                 ArrayList<String[]> List1 = new ArrayList<>();
                                
                                try {
                                   List1= obj.getAllChannelByDate(date);
                                } catch (Exception ex) {
                                }

                               
                                

                            %>

                            <div class="col-sm-6" >
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Details
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover" style="width: 100%">
                                            <tr>
                                                <th><strong>Doc. Name</strong></th>
                                                <th><strong>Reserved user</strong></th>
                                                <th><strong>Time</strong></th>
                                                <th><strong>Number</strong></th>
                                            </tr>
                                            <%
                                            for (String string[] :List1) {
                                                out.println("<tr>");
                                                for(String s: string){
                                                out.println("<td>"+s+"</td>");
                                                }
                                                 out.println("</tr>");
                                            }
                                            %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>



                    <footer class="container-fluid text-center" style="background-color:black">
                        <div class="menu-footer-container">
                            <ul id="menu-footer" class="footer-nav-links">
                                <li><a style="cursor:pointer" id="toTop">Back To Top</a></li>
                            </ul>
                        </div>
                        <div class="f-connect"></div>
                        <!--<div class="t-connect"></div>-->

                        <div id="footer-copy" class="clr"> Copyright 2016 <a href="#" >Doctor Channeling </a> </div>
                    </footer>
                </div>
                <div class="col-sm-1 sidenav">


                </div>
            </div>
        </div>



    </body>
</html>

