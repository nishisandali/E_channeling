<%-- 
    Document   : adminHome
    Created on : Apr 22, 2016, 12:12:53 PM
    Author     : Lalendra
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Eclass.adminClass" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<%
//allow access only if session exists
    String user = null;
    if (session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    } else {
        user = (String) session.getAttribute("user");
    }
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                userName = cookie.getValue();
            }
            if (cookie.getName().equals("JSESSIONID")) {
                sessionID = cookie.getValue();
            }
        }
    }

    if (userName == null || !userName.equals("admin")) {
        response.sendRedirect("Home.jsp");
    }

    adminClass obClass = new adminClass();
    // PrintWriter new = response.getWriter();
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
                                    <li class="active"><a href="#">Home</a></li>
                                    <!-- <li><a href="#">About</a></li>
                                     <li><a href="#">Projects</a></li>-->
                                    <li><a href="adminAccount.jsp">Admin Account</a></li>
                                    <li><a href="adminInbox.jsp">INBOX</a></li>
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
                        List = obClass.getUpcommingChannelSummry();
                    %>                   

                    <div class="container-fluid" >
                        <ul>
                            <li style="display: inline"><a href="adminHome.jsp">Home</a> <span class="divider">/</span></li>


                        </ul>

                        <div class="row content">

                            <div class="col-sm-6" >
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        Summary of Up Comming Appointment 
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover">
                                            <tr>
                                                <th><strong>Date</strong></th>
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

                            

                            <div class="col-sm-6" >
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Admin Panel
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label>View All Appoinments History</label> <a href="ChannelHistory.jsp" ><button type="submit" class="btn btn-warning " >GET</button> </a>
                                        </div>
                                        <div class="form-group">
                                            <label>View All Registered Users</label> <a href="viewAllUsers.jsp" ><button type="submit" class="btn btn-warning " >GET</button> </a>
                                        </div>
                                        <div class="form-group">
                                            <label>View All Doctors</label> <a href="viewAllDoctors.jsp" ><button type="submit" class="btn btn-warning " >GET</button> </a>
                                        </div>
                                        <div class="form-group">
                                            <label>View Appoinments by date </label>  :<form action="sortByDate.jsp" method="get" ><input type="date" name="date"/> <input type="submit" class="btn btn-warning " value="GET" ></form>
                                        </div>
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
                        </nav>
                        <div id="footer-copy" class="clr"> Copyright 2016 <a href="#" >Doctor Channeling </a> </div>
                    </footer>
                </div>
                <div class="col-sm-1 sidenav">


                </div>
            </div>
        </div>



    </body>
</html>

