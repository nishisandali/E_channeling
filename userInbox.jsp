<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>

<%@page import="Eclass.user"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.text.ParseException"%>

<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Eclass.adminClass"%>

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
    if (userName == null ) {
        response.sendRedirect("Home.jsp");
    }

    user obj = new user();

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
                                    <li class="active"><a href="userHome.jsp">Home</a></li>
                                    <li><a href="userChannelHistory.jsp">Channel History</a></li>
                             
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
                            <li style="display: inline"><a href="userHome.jsp">Home</a> <span class="divider">/</span></li>

                            <li style="display: inline" class="active">INBOX </li>
                        </ul>





                        <script>
                            function clicked() {
                                if (confirm('Do You Want To Send?')) {
                                    yourformelement.submit();
                                } else {
                                    return false;
                                }
                            }

                        </script>

                        <%
                            ArrayList<String[]> List = new ArrayList<>();
                            ArrayList<String[]> List2 = new ArrayList<>();
                            List = obj.getInbox(userName);
                            List2 = obj.getSENT(userName);
                        %>

                        <div class="row content" >

                            <div class="col-sm-3" ></div>
                            <div class="col-sm-6" >
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        Compose New Message
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" method="post" action="SendNewMsg?val=<%=userName %>&for=admin"  onsubmit=" return  clicked()">
                                            <div class="form-group">
                                                For
                                                <input type="text" disabled="disabled"  value='admin'/>
                                                
                                            </div>
                                            <textarea name="cmnt" rows="4" cols="50">

                                                </textarea>
                                            <br>

                                            <button type="submit" class="btn  btn-success " >SEND </button>

                                        </form>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-3" ></div>

                        </div>


                        <div class="row content">
                            <div class="col-sm-6">
                                <center>
                                    <h3>INBOX</h3>
                                </center>
                                <table class="table table-striped" style="width: 100%">
                                    <thead><tr>

                                            <th><strong>TIME</strong></th>
                                            <th><strong>FROM</strong></th>
                                            <th><strong>TEXT</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (String[] strings : List) {

                                                // String name= strings[0];
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
                            <div class="col-sm-6">
                                <center>
                                    <h3>SENT</h3>
                                </center>
                                <table class="table table-striped">
                                    <thead><tr>

                                            <th><strong>TIME</strong></th>
                                            <th><strong>TO</strong></th>
                                            <th><strong>TEXT</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (String[] strings : List2) {

                                                // String name= strings[0];
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

