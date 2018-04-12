<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>






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
    if (userName == null|| !userName.equals("admin")) {
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


            function myFunction() {
                var pass1 = document.getElementById("pass1").value;
                var pass2 = document.getElementById("pass2").value;
                var ok = true;
                if(pass1=="" || pass2==""){
                    document.getElementById("pass1").style.borderColor = "#E34234";
                    document.getElementById("pass2").style.borderColor = "#E34234";
                    alert("Enter New PassWords");
                    return false;
                }
                
                if (pass1 != pass2) {
                    //alert("Passwords Do not match");
                    document.getElementById("pass1").style.borderColor = "#E34234";
                    document.getElementById("pass2").style.borderColor = "#E34234";
                    alert("Password Not Match");
                    return false;

                } else {
                    if (confirm('Do you want to Changed the Password?')) {
                        yourformelement.submit();
                    } else {
                        return false;
                    }

                }

            }

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
                                    <li ><a href="adminHome.jsp">Home</a></li>
                                   <!-- <li ><a href="">Channel History</a></li>
                                    <li><a href="#">Check Up History</a></li>-->
                                    <li class="active"><a href="#">Admin Account</a></li>
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

                        ResultSet rs = obj.getUserDetails(userName);
                        rs.next();
                        String fName = rs.getString(3);
                        String email = rs.getString(4);
                        String twn = rs.getString(5);
                        String mob = rs.getString(6);
                        String x = rs.getString(7);
                        // out.println(x);
                        boolean xx = false;
                        if (x.equals("Male")) {
                            xx = true;

                        }
                    %>


                     <script>
                            function clicked() {
                                if (confirm('Do you want to update You Details?')) {
                                    yourformelement.submit();
                                } else {
                                    return false;
                                }
                            }

                        </script> 

                    <div class="container-fluid" >
                        <ul>
                            <li style="display: inline"><a href="userHome.jsp">Home</a> <span class="divider">/</span></li>

                            <li style="display: inline" class="active">Account Edit</li>
                        </ul>

                        <div class="row content">

                            <div class="col-sm-6" >
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        User Account Details
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" action="UserDetailsUpdate?uName=<%=userName%>" method="post" onsubmit="return clicked()">
                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Full Name</label>
                                                <input type="text" class="form-control" id="usrname" name="fName" placeholder="Enter Full Name" value="<%=fName%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Email</label>
                                                <input type="text" name="email" class="form-control" id="" placeholder="Enter email" value="<%=email%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="usrname">Gender</label>
                                                <select name="gender" class="form-control" id="usrname" placeholder="Genter"> 
                                                    <%
                                                        if (xx) {
                                                    %>
                                                    <option value="Female" >Female</option>
                                                    <option value="Male" selected="Selected">Male</option>
                                                    <% } else { %>
                                                    <option value="Female" selected="Selected" >Female</option>
                                                    <option value="Male" >Male</option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-phone"></span> Mobile-No</label>
                                                <input name="mob" type="text" class="form-control" id="usrname" placeholder="mobile" value="<%=mob%>">
                                            </div>
                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Home Town</label>
                                                <input name="twn" type="text" class="form-control" id="usrname" placeholder="Home Town" value="<%=twn%>">
                                            </div>

                                            <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Update</button>
                                        </form>
                                    </div>
                                </div>

                            </div>



                            <div class="col-sm-6" >
                                <div class="panel panel-warning">
                                    <div class="panel-heading">
                                        Change Password
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" onsubmit="return  myFunction()" action="PwChange?uName=<%=userName%>" method="POST">
                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> New Password</label>
                                                <input type="password" class="form-control" id="pass1" name="pass1" placeholder="New Password" >
                                            </div>


                                            <div class="form-group">
                                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Confirm Password</label>
                                                <input type="password" class="form-control" id="pass2" name="pass2" placeholder="Re-Enter">
                                            </div>

                                            <button type="submit" class="btn btn-warning btn-block"><span class="glyphicon glyphicon-off"></span> Change</button>
                                        </form>
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

