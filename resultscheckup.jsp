<%-- 
    Document   : checkup
    Created on : Apr 22, 2016, 2:13:06 PM
    Author     : Maheshi
--%>

<%@page import="Eclass.dbSetup"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
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
        <div class="container-fluid" >

<header id="header">
      <div id="navigation-wrap" class="clr fixed-scroll fixed-nav">
    <div id="navigation-inner" class="container">
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
          <li ><a href="Home.jsp">Home</a></li>
          <li><a href="channeling.jsp"> Search Doctors</a></li>
          <li class="active"><a href="checkup.jsp">MEDICAL CHECKUP</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" data-toggle="modal" data-target="#signup" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li ><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
         
      </ul>
    </div>
  </div>
</nav>
       
        
        </div>
           
  </div>
    </header>
<br />
<br></br>
<div id="wrap" class="container-fluid">
    <div class="col-sm-1" style="   margin-left: 50px;" > </div>
      <div class="slider-wrapper theme-default" >
    <ul class="rslides" id="slider1">
      <li><img src="theme/imgs/01.jpg" alt=""/></li>
      <li><img src="theme/imgs/02.jpg" alt=""/></li>
      <li><img src="theme/imgs/03.jpg" alt=""/></li>
    </ul>
  </div>
    <div  id="wrap" class="container-fluid">

     <div class="col-sm-1" > </div>

  <div class="col-sm-4" style="background-color:lavender;">
      <table border="1" style="background: #0090ff;">
      <%  
          try{
        
        String[] names = request.getParameterValues("test");
        List list =  Arrays.asList(names); 
	request.setAttribute("test", list); 
        Statement st;
        ResultSet rs;  
        st = dbSetup.getMyConnection().createStatement();
        
        List<String> employees  = (List<String>)request.getAttribute("test");
        
			for(String e: employees){
                            rs= st.executeQuery("SELECT * FROM pricecheck where test_type='"+e+"'");
                        
                            out.println(e + "\n");
                        while(rs.next()){
                            String n=rs.getString(1);
                            String p=rs.getString(2);
                            
                            
                            out.println(p);
                            out.println();
                        }
                        
                            
                        }
                        
                        

            
          
        } catch (Exception ex) {
            System.out.println("error");
        }
            
       %>
      </table>
       
       
       
       
       
       
       
       

  </div>
            <div class="col-sm-1" > </div>
            <article id="post-578" class="">
    <div class="col-sm-5" style="background-color: lightblue; height: 615;" >
        <div class="post-entry-details" >
            <form action="resultscheckup.jsp" method="post">
            <h2 style="color:#ffffff; font-size:24px; padding-top:30px;"> | Medical CheckUp |</h2><hr>
            
            <br></br>
                <h3 style="color:#ffffff;">Test Type</h3>
               
                <div id="radio" style="color:#ffffff; ">
                    <input type="checkbox" name="test" value="Diabetic check"/> Diabetic check<br></br>
                    <input type="checkbox" name="test" value="F.B.Checkup-Female" /> Full body checkup-female<br></br>
                    <input type="checkbox" name="test" value="F.B.Checkup-Male"/>Full body checkup-male <br></br>
                    <input type="checkbox" name="test" value="cancer screening"/> Cancer screening<br></br>
                    <input type="checkbox" name="test" value="U.F.R"/> U.F.R<br></br>
                    <input type="checkbox" name="test" value="E.C.G"/> E.C.G<br></br>
                    <input type="checkbox" name="test" value="Liver Profile"/> Liver Profile<br></br>
                    <input type="checkbox" name="test" value="Creatinine"/> Creatinine<br></br>
                    <input type="checkbox" name="test" value="Cholesterol"/> Cholesterol<br></br><br></br>

                    </div>
                <input type="submit" value="SEARCH" style="background:#808080; " /></form>
            
            
            
            </div>
    </div>
            </article>



        </div>
  </div>
 <div class="col-sm-1" > </div>
<div id="footer" class="col-sm-10" style="background-color: black">
      <footer class="container-fluid"  >
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


        </div>
        
   
        
        
        <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <form  action="Login" method="POST">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control"  name="uName" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control"  name="psw" placeholder="Enter password">
            </div>
           
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
         
        </div>
      </div>
      
    </div>
  </div>

        
<div class="modal fade" id="signup" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> SIGN UP</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
             <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Full Name</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter Full Name">
            </div>
              
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Email</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="psw" placeholder="Enter password">
            </div>
             <div class="form-group">
              <label for="usrname">Gender</label>
              <select class="form-control" id="usrname" placeholder="Genter"> 
                  <option value="F" >Female</option>
                  <option value="M" selected="Selected">Male</option>
                  
              </select>
            </div>
              <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-phone"></span> Mobile-No</label>
              <input type="text" class="form-control" id="usrname" placeholder="mobile">
            </div>
              <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Home Town</label>
              <input type="text" class="form-control" id="usrname" placeholder="Home Town">
            </div>
           
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel  </button>
         
        </div>
      </div>
      
    </div>
  </div>

<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
        
</body>
</html>
