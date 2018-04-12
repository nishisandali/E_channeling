<%-- 
    Document   : userHome
    Created on : Apr 22, 2016, 12:16:13 PM
    Author     : Lalendra
--%>
<%@page import="Eclass.extra"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Eclass.channel"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
          <%
//allow access only if session exists
if(session.getAttribute("user") == null){
    response.sendRedirect("Home.jsp");
}
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName==null || !userName.equals("admin") ){
response.sendRedirect("Home.jsp");
}

channel obj= new channel();
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
            </form><br> <font style="color: blue">Welcome <%=userName %></font></li>
        
        
      </ul>
    </div>
  </div>
</nav>
         
            
           <div class="container-fluid" >
               <ul>
                   <li style="display: inline"><a href="adminHome.jsp">Home</a> <span class="divider">/</span></li>

                        <li style="display: inline" class="active">Channel History</li>
                    </ul>
          
              
               <%
                    
                   ArrayList<String[]> List = new ArrayList<>();
                   //date, docName, Speciality, time, number
              ResultSet rs= obj.getChannelHistory();
                while (rs.next()) {
                String dt = rs.getString(1);
                String doc = rs.getString(2);
                String sp = rs.getString(3);
                String time= rs.getString(4);
                String Num = rs.getString(5);
                List.add(new String[]{dt, time, doc, sp, Num});
            }
               %>
                
   
               
          
                
          
                <div class="row content">
                    <label style="color:rgba(0, 255, 67, 0.34) ; background-color: rgba(0, 255, 67, 0.34)">............</label><label>-To Visit</label>
                    <table class="table table-striped">
                        <thead><tr>
                                
                       <th>Date</th>
                       <th>Time</th>
                       <th>Doctor</th>
                       <th>Speciality</th>
                       <th>Channel Number</th>
                       
                      
                            </tr>
                    </thead>
                    <tbody>
                    <%
                        
                     for (String[] strings : List) {
                       String date1= strings[0];
                      // out.println(date1);
                      boolean x= extra.chechWithCurrentDate(date1);
                     // out.println(x);
                      if(x){
                           out.println("<tr style='background-color:rgba(0, 255, 67, 0.34)'>");
                      }else{
                       out.println("<tr>");
                      }
                              
                        
                       for(String s : strings){
                         
                           out.print("<td>"+s+"</td>");
                           
                       }
                       out.println("</tr>");
                         }
                    %>
                    </tbody>
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
        
