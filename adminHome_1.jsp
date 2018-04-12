<%-- 
    Document   : adminHome
    Created on : Apr 22, 2016, 12:12:53 PM
    Author     : SNM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
       <%
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null){
    response.sendRedirect("Home.jsp");
}
else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = cookie.getValue();
    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}

if(userName==null ||  !userName.equals("admin")){
response.sendRedirect("Home.jsp");
}


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> E channeling </title>
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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
        <!--<li><a href="#">Register Doctors</a></li>
        <li><a href="#">Search Patients</a></li>
        <li><a href="#">Update channels</a></li>-->
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
      <h4>Welcome Admin To The Doctor Channeling</h4>
      <div class="container">
            
  

            <table class="table table-striped">
    <thead>
      <tr>
          
           <p style="width:80%; "> The Doctor Channeling is renowned for offering Sri Lanka’s most empathetic, technologically-driven and cutting-edge health care service. With a history of providing a number of ‘Firsts’ to the Sri Lankan healthcare sector, the group is poised to offer an even greater array of services while catering to the healthcare needs of the South Asian region. The group’s four hospitals – Asiri Surgical Hospital PLC, Asiri Hospital Holdings PLC, The Central Hospital and Asiri Hospital Matara (Pvt) Ltd - specialize in a number of medical services. 
 
            Asiri Group of Hospitals has a reputation for continuously investing in its infrastructure in order to offer patients the very latest in medical care. For instance, the group was the first Sri Lankan healthcare provider to invest in a 64 slice CT scanner.</p>
          </tr>
      <tr>
          <td><a href="registerdoc.jsp"<button type="button" class="btn btn-primary" style="width: 80%; ">REGISTER DOCTORS</button></a></td>
          <td><button type="button" class="btn btn-success" style="width: 80%;">UPDATE CHANNELS</button></td>
          <td><button type="button" class="btn btn-warning" style="width:80%; ">SEARCH PATIENTS</button></td>
          
          
      </tr>
    </thead>
    <tbody>
      
    </tbody>
  </table>
          
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
        
