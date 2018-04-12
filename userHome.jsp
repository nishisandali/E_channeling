<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Eclass.doctorClass" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
//allow access only if session exists
    if (session.getAttribute("user") == null) {
        response.sendRedirect("Home.jsp");
    }
    String userName = null;
    
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                userName = cookie.getValue();
               
            }
        }
    }
     if(userName==null){
response.sendRedirect("Home.jsp");
}

    doctorClass obj1 = new doctorClass();
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


        <script>
            // You can also use "$(window).load(function() {"
            $(function () {

                // Slideshow 1
                $("#slider1").responsiveSlides({
                    maxwidth: 1000,
                    speed: 800
                });
            });
        </script>



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
                                    <li><a href="userChannelHistory.jsp">Channel History</a></li>
                                    
                                    <li><a href="userAccount.jsp">Account</a></li>
                                    <li><a href="userInbox.jsp">Inbox</a></li>
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
                        ResultSet rs = null;
                        rs = obj1.getDocInfo();
                        ArrayList<String[]> List1 = new ArrayList<>();
                        while (rs.next()) {
                            String Doc = rs.getString(1);
                            String Speciality = rs.getString(2);
                            List1.add(new String[]{Doc, Speciality});
                        }
                        ArrayList<String[]> cList = new ArrayList<>();
                        
                      cList=  obj1.getUpCommingChannel(userName);
                        
                    %>

  




                    
                    <div class="container-fluid">
                        <div class="row content" >
                            <div class="col-sm-6" >
                                 <div class="panel panel-danger">
                                    <div class="panel-heading">
                                        Channel Notification
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <td>Date</td>
                                                    <td>Time</td>
                                                    <td>Doc. Name</td>
                                                    <td>Number</td>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                   <%
                                    for (String[] strings : cList) {
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
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        Get Appointment 
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" method="get" action="channelStep1.jsp" >
                                            <div class="form-group">
                                                <label>Select Doctor</label>
                                                <select class="form-control" name="doc" type="text">
                                                    <%
                                                        for (String[] strings : List1) {

                                                            out.println("<option vlaue=" + strings[0] + ">" + strings[0] + "-" + strings[1] + "</option>");

                                                        }
                                                    %>
                                                </select>

                                            </div>




                                                <button type="submit" class="btn  btn-info " >Schedule </button>

                                        </form>
                                    </div>
                                </div>

                            </div>
                            

                        </div>
                        <%
                            ArrayList<String[]> List = new ArrayList<>();

                            List = obj1.getScheduleInfo();
                            // String x[]= List.get(0);
                            //out.println(x.length);
                        %>


                        <div class="row content">
                            <h4>Time Schedule </h4>
                            <table class="table table-striped">
                                <thead><tr>
                                        <th>Doctor</th>
                                        <th>Speciality</th>
                                        <th>Sunday</th>
                                        <th>Moday</th>
                                        <th>Tuesday</th>
                                        <th>Wendsday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                </thead>

                                <%
                                    for (String[] strings : List) {
                                        out.println("<tr>");
                                        for (String s : strings) {
                                            if (s == null) {
                                                out.print("<td> <span class='glyphicon  glyphicon-ban-circle'></span></td>");
                                            } else {
                                                out.print("<td>" + s + "</td>");
                                            }
                                        }
                                        out.println("</tr>");
                                    }
                                %>

                            </table>

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

