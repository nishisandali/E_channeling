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
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                userName = cookie.getValue();
            }
        }
    }
    if (userName == null) {
        response.sendRedirect("Home.jsp");
    }

    doctorClass obj1 = new doctorClass();
    String doc = request.getParameter("doc");
    int x = 0;
    try {
        x = Integer.parseInt(request.getParameter("st"));
    } catch (Exception ex) {

    }
    String string = doc;
    String[] parts = string.split("-");
    String docName = parts[0];
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
                                    <li class="active"><a href="userHome.jsp">Channeling</a></li>
                                    <li><a href="userChannelHistory.jsp">Channel History</a></li>
                                    <li><a href="#">Check Up History</a></li>
                                    <li><a href="userAccount.jsp">Account</a></li>
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


                    <div class="container-fluid" >
                        <ul>
                            <li style="display: inline"><a href="userHome.jsp">Channeling</a> <span class="divider">/</span></li>

                            <li style="display: inline" class="active">Docter Schedule</li>
                        </ul>


                        <% if (x == 1) {
                        %>
                        <div class="alert alert-danger" style="margin-left: 20px">
                            <strong>Channeling Fail</strong> Invalid Date name or Doctor not avaivable on that day
                        </div> 
                        <%
                    } else if (x == 2) { %>
                        <div class="alert alert-success" style="margin-left: 20px">
                            <strong>SUCCESS </strong> You Can View Details From Channel History Tab
                        </div> 

                        <%
                            }
                        %>

                        <script>
                            function clicked() {
                                if (confirm('Do you want to add Channel?')) {
                                    yourformelement.submit();
                                } else {
                                    return false;
                                }
                            }

                        </script>   
                        <div class="row content" >

                            <div class="col-sm-3" ></div>
                            <div class="col-sm-6" >
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        Channel Date
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" method="post" action="channelDoc"  onsubmit=" return  clicked()">
                                            <div class="form-group">
                                                <label>Doctor Name</label>
                                                <input type="text" disabled="disabled"  name="docName" value='<% out.println(docName); %>'/>
                                                <input type="hidden" name="uName" value='<% out.println(userName); %>'/>
                                                <input type="hidden"  name="docName" value='<% out.println(docName); %>'/>
                                            </div>
                                            <div class="form-group">
                                                <label>Select Date</label><br>
                                                <input type="date" name="booking">

                                            </div>


                                            <br>

                                            <button type="submit" class="btn  btn-success btn-lg" style="   width: 187px">Get Appoinment </button>

                                        </form>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-3" ></div>

                        </div>
                        <%

                            out.println("<h4>Time Schedule Of -" + doc + "</h4>");
                            out.println("<label>Morning from 9.00Am</label><br>");
                            out.println("<label>Evening from 7.00Pm</label>");

                            ArrayList<String[]> List = new ArrayList<>();

                            List = obj1.getScheduleInfo(parts[0]);
                        %>


                        <div class="row content">

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

