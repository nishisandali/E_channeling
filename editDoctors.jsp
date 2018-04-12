<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>

<%@page import="Eclass.doctorClass"%>
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
    if (userName == null || !userName.equals("admin")) {
        response.sendRedirect("Home.jsp");
    }

    adminClass adminobj = new adminClass();
    String docName = request.getParameter("val");
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
                                    <li ><a href="adminHome.jsp">Home</a></li>

                                    <li><a href="adminAccount.jsp">Account</a></li>
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
                            <li style="display: inline"><a href="adminHome.jsp">Home</a> <span class="divider">/</span></li>

                            <li style="display: inline" class="active">Edit Doctor Info </li>
                        </ul>

                        <div class="container-fluid" >



                            <script>
                                function clicked() {
                                    if (confirm('Do you want to Edit Details?')) {
                                        yourformelement.submit();
                                    } else {
                                        return false;
                                    }
                                }

                            </script>   
                            <%
                                ArrayList<String[]> List1 = new ArrayList<>();
                                List1 = adminobj.getDoctorDetails(docName);

                                String[] x = List1.get(0);
                                String name = x[0];
                                String sp = x[1];
                                String mobile = x[2];
                                String email = x[3];
                                String hospital = x[4];

                            %>

                            <div class="row content" >

                                <div class="col-sm-3" ></div>
                                <div class="col-sm-6" >
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            Doctor Information
                                        </div>
                                        <div class="panel-body">
                                            <form role="form" method="post" action="updateDocInfo?oldName=<%=name %>"  onsubmit=" return  clicked()">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text"  name="docName" value='<%=name%>'/>
                                                </div>

                                                <div class="form-group">
                                                    <label>Speciality</label>
                                                    <input type="text"  name="sp" value='<%=sp%>'/>

                                                </div>
                                                <div class="form-group">
                                                    <label>Mobile</label>
                                                    <input type="text"  name="Mobile" value='<%=mobile%>'/>

                                                </div>
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text"  name="email" value='<%=email%>'/>

                                                </div>
                                                <div class="form-group">
                                                    <label>Hospital</label>
                                                    <input type="text"  name="Hospital" value='<%=hospital%>'/>
                                                   
                                                </div>


                                                <br>

                                                <button type="submit" class="btn  btn-success " >Update </button>

                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-3" ></div>

                            </div>
                            <%

                                out.println("<h4>Time Schedule Of -" + docName + "</h4>");
                                out.println("<label>Morning from 9.00Am</label><br>");
                                out.println("<label>Evening from 7.00Pm</label>");

                                ArrayList<String[]> List = new ArrayList<>();

                                List = obj1.getScheduleInfo(docName);
                                String AVlist[] = List.get(0);

                            %>


                            <div class="row content">
                                <form action="UpdateDocSchedule?docName=<%=docName%>" method="POST" onsubmit="return checkEmpty()">
                                <table class="table table-striped" style="width: 100% ">
                                    <thead><tr>

                                            <th>Sunday</th>
                                            <th>Moday</th>
                                            <th>Tuesday</th>
                                            <th>Wendsday</th>
                                            <th>Thursday</th>
                                            <th>Friday</th>
                                            <th>Saturday</th>
                                        </tr>
                                    </thead>

                                    <%                                        /**
                                         * for (String[] strings : List) {
                                         * out.println("<tr>"); for (String s :
                                         * strings) { if (s == null) {
                                         * out.print("<td>
                                         * <span class='glyphicon  glyphicon-ban-circle'></span></td>");
                                         * } else { out.print("<td>" + s +
                                         * "</td>"); } } out.println("</tr>"); }
                                         */
                                       
                                        out.println("<tr>");
                                       
                                        if(AVlist[2]==null){
                                         out.print("<td>  <input type='text' name='sun'  id='sun'  style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                         out.print("<td>  <input type='text' name='sun'  id='sun'  style='width: 90px;' size='8' name='docName' value='"+AVlist[2]+"'/> </td>");
                                        }
                                        
                                         if(AVlist[3]==null){
                                         out.print("<td>  <input type='text' name='mon'  id='mon'  style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='mon'  id='mon'  style='width:90px;' size='8' name='docName' value='"+AVlist[3]+"'/> </td>");
                                         }
                                         
                                          if(AVlist[4]==null){
                                         out.print("<td>  <input type='text' name='tus'  id='tus'   style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='tus'  id='tus' style='width: 90px;' size='8' name='docName' value='"+AVlist[4]+"'/> </td>");
                                          }
                                          
                                           if(AVlist[5]==null){
                                         out.print("<td>  <input type='text' name='wed'  id='wed'  style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='wed'  id='wed' style='width: 90px;' size='8' name='docName' value='"+AVlist[5]+"'/> </td>");
                                           }
                                        
                                            if(AVlist[6]==null){
                                         out.print("<td>  <input type='text' name='thu'  id='thu' style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='thu'  id='thu' style='width: 90px;' size='8'  name='docName' value='"+AVlist[6]+"'/> </td>");
                                            }
                                            
                                            
                                         if(AVlist[7]==null){
                                         out.print("<td>  <input type='text' name='fri'  id='fri'  style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='fri'  id='fri' style='width: 90px;' size='8' name='docName' value='"+AVlist[7]+"'/> </td>");
                                         }
                                        
                                         if(AVlist[8]==null){
                                         out.print("<td>  <input type='text' name='sat'  id='sat' style='width: 90px;' size='8' name='docName'/> </td>");

                                        }else{
                                        out.print("<td> <input type='text' name='sat'  id='sat' style='width: 90px;' size='8' name='docName' value='"+AVlist[8]+"'/> </td>");
                                         }
                                        
                                        out.println("</tr>");
                                    %>

                                </table>
                                    <button  class="btn btn-warning">Update Schedule</button>
                                </form>
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
    
     <script>
            
            
            function checkEmpty() {
                var val1 = document.getElementById("sun").value;
                var val2 = document.getElementById("mon").value;
                var val3 = document.getElementById("tus").value;
                var val4 = document.getElementById("wed").value;
                var val5 = document.getElementById("thu").value;
                var val6 = document.getElementById("fri").value;
                var val7 = document.getElementById("sat").value;
              
                
              
                if(!(val1 === "" || val1 === "MORNING" || val1 === "EVENING")){
                    document.getElementById("sun").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val2 === "" || val2 === "MORNING" || val2 === "EVENING")){
                    document.getElementById("mon").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val3 === "" || val3 === "MORNING" || val3 === "EVENING")){
                    document.getElementById("tus").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val4 === "" || val4 === "MORNING" || val4 === "EVENING")){
                    document.getElementById("wed").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val5 === "" || val5 === "MORNING" || val5 === "EVENING")){
                    document.getElementById("thu").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val6 === "" || val6 === "MORNING" || val6 === "EVENING")){
                    document.getElementById("fri").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                if(!(val7 === "" || val7 === "MORNING" || val7 === "EVENING")){
                    document.getElementById("sat").style.borderColor = "#E34234";
                    alert("MORNING or EVENING or Leave it empty");
                    return false;
                }
                
               
               
                
              

            }
            
        </script>
</html>

