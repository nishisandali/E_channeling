<%-- 
    Document   : Home
    Created on : Apr 22, 2016, 2:07:34 PM
    Author     : Lalendra
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <%
            int x = 0;
            try {
                x = Integer.parseInt(request.getParameter("id"));
            } catch (Exception ex) {

            }
        %>
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
                                        <li class="active"><a href="Home.jsp">Home</a></li>
                                        <li><a href="channeling.jsp"> Search Doctors</a></li>
                                        <li><a href="checkup.jsp">Medical Checkup</a></li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">^
                                        <li><a href="#" data-toggle="modal" data-target="#signup" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                        <li><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>

                                    </ul>
                                </div>

                            </div>

                        </nav>


                    </div>



                </div>
            </header>
            <br />
            <br></br>
            <% if (x == 1) {
            %>
            <div id="wrap" class="container-fluid">
                <div class="container" >
                    <div class="alert alert-danger" style="margin-left: 20px">
                        <strong>Login Fail</strong> Invalid User name or password
                    </div> 

                </div></div>
                <% }else if(x == 2){
                %>
                <div id="wrap" class="container-fluid">
                <div class="container" >
                    <div class="alert alert-success" style="margin-left: 20px">
                        <strong> SIGN UP success !  </strong> User Registered
                    </div> 

                </div></div>
                
                <% } else if(x == 3){
                %>
                <div id="wrap" class="container-fluid">
                <div class="container" >
                    <div class="alert alert-warning" style="margin-left: 20px">
                        <strong> User Name is Already Used </strong> Try Again
                    </div> 

                </div></div>
                
                <% } %>

            <div id="wrap" class="container-fluid">

                <div class="col-sm-1" style="   margin-left: 50px;" > </div>
                <div class="slider-wrapper theme-default" >
                    <ul class="rslides" id="slider1">
                        <li><img src="theme/imgs/01.jpg" alt=""/></li>
                        <li><img src="theme/imgs/02.jpg" alt=""/></li>
                        <li><img src="theme/imgs/03.jpg" alt=""/></li>
                        <li><img src="theme/imgs/04.jpg" alt=""/></li>
                        <li><img src="theme/imgs/05.jpg" alt=""/></li>
                    </ul>
                </div>
                <div  id="wrap" class="container-fluid">

                    <div class="col-sm-1" > </div>

                    <div class="col-sm-4" style="background-color:lavender;">
                        <img style="margin-left:-10px;"   id="aaaa" src="theme/imgs/BUP_DFTDFT-16.jpg" alt="Miami Heat"/>
                        <ul id="menu-sidebar" class="menu">
                            <h2 style="color:#282828; font:18px; font-family: 'Montserrat', Arial, Helvetica, sans-serif;">SIMPLE THREE STEPS</h2>
                            <li id="menu-item-603" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-603 " style="color:#808080;">1. Search Doctors</li>
                            <li id="menu-item-604" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-604" style="color:#808080;">2. Channel doctor</li>
                            <li id="menu-item-602" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-602" style="color:#808080;">3. Visit Doctor</li>

                        </ul>
                        <div id="doctor">
                            <img src="theme/imgs/stethoscope_icon.jpg" width="40px"  />

                            <button class="btn btn-danger">Search Doctors </button>


                        </div>

                        <div id="channell">
                            <img src="theme/imgs/Hospital-blue-icon.png" width="40px" />
                            <button class="btn btn-danger">Channell Doctors </button>

                        </div>

                        <div id="checkup">
                            <img src="theme/imgs/images (1).png" width="40px"  />

                            <button class="btn btn-danger">Medical Checkup </button>


                        </div>

                        <br></br>

                    </div>
                    <div class="col-sm-1" > </div>
                    <div class="col-sm-5" style="background-color: lightblue;">  <div class="post-entry-details" >

                            <h2 style="color:#ffffff; font-size:18px; padding-top:30px;"> | About US  |</h2><hr></hr>
                            <font color="Black">
                            Welcome to Hemas Hospitals - your chain of internationally accredited, multi-specialty, family hospitals situated in Wattala, Galle and most recently, Thalawathugoda.
                            We, at Hemas Hospitals, strive to give you the best in patient care validated by international accreditation. Renowned for unparalleled health care services and warmth in patient care, the hospital chain provides every visitor -scenic, state of the art facilities on par with world class healthcare service standards.
                            We are recognized locally as one of the most potent destination for all health care services.<br>
                            FOR ASSISTANCE <br>
                            Call our 24 hour call center on 0117 888 888 for appointments <br>
                            OR FIND DOCTORS... IT IS EASY.<br>
                            By Speciality By Doctor

                            </font>





                        </div></div>




                </div>
            </div>
            <div class="col-sm-1" > </div>
            <div id="footer" class="col-sm-10" style="background-color: black">
                <footer class="container-fluid"  >
                    <div class="menu-footer-container">

                    </div>
                    <div class="f-connect"></div>
                    <!--<div class="t-connect"></div>-->

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
                        <form role="form" action="SignUp" method="POST">
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> Full Name *</label>
                                <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter Full Name">
                            </div>
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-user"></span> User Name *</label>
                                <input type="text" class="form-control" id="uName" name="uName" placeholder="Loging User Name">
                            </div>

                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Email *</label>
                                <input type="text" class="form-control" name="email"  id="email" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password *</label>
                                <input type="password" class="form-control" id="psw" name="psw" placeholder="Enter password">
                            </div>
                            <div class="form-group">
                                <label for="usrname">Gender *</label>
                                <select class="form-control" name="sex" id="sex" placeholder="Genter"> 
                                    <option value="Female" >Female</option>
                                    <option value="Male" selected="Selected">Male </option>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-phone"></span> Mobile-No *</label>
                                <input type="text" class="form-control" name="mobile" id="mobile" placeholder="mobile">
                            </div>
                            <div class="form-group">
                                <label for="usrname"><span class="glyphicon glyphicon-info-sign"></span> Home Town *</label>
                                <input type="text" class="form-control"  name="town" id="town"  placeholder="Home Town">
                            </div>

                            <button onclick="return checkEmpty()" type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button  type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel  </button>

                    </div>
                </div>

            </div>
        </div> 

        <script>
            $(document).ready(function () {
                $("#myBtn").click(function () {
                    $("#myModal").modal();
                });
            });
            
            function checkEmpty() {
                var val1 = document.getElementById("fname").value;
                var val2 = document.getElementById("uName").value;
                var val2 = document.getElementById("uName").value;
                var val3 = document.getElementById("email").value;
                var val4 = document.getElementById("psw").value;
                var val5 = document.getElementById("mobile").value;
                var val6 = document.getElementById("town").value;
                
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var re1 = /^\(?0\d{2}\)?[\s\-]?\d{7}$/;
                var ok = true;
                if(val1==""){
                    document.getElementById("fname").style.borderColor = "#E34234";
                    alert("Fill the Full Name");
                    return false;
                }
               else if(val2==""){
                    document.getElementById("uName").style.borderColor = "#E34234";
                    alert("User Cannot BE empty");
                    return false;
                }else if(val2.indexOf(' ') >= 0){
                    document.getElementById("uName").style.borderColor = "#E34234";
                    alert("White Spaces Are not Allows For User Name");
                    return false;  
                }else if(!re.test(val3)){
                    document.getElementById("email").style.borderColor = "#E34234";
                    alert("Invalid Email");
                    return false; 
                }else if(val4==""|| val4.indexOf(' ') >= 0){
                    document.getElementById("psw").style.borderColor = "#E34234";
                    alert("Invalid Password or Space Charactor Detected");
                    return false;  
                }else if (val5=="" || val5.indexOf(' ') >= 0){
                     document.getElementById("mobile").style.borderColor = "#E34234";
                    alert("Enter Mobile number");
                    return false;  
                }else if (!re1.test(val5)){
                    document.getElementById("mobile").style.borderColor = "#E34234";
                    alert("Invalid Mobile Number");
                    return false;     
                }else if (val6=="" ){
                     document.getElementById("town").style.borderColor = "#E34234";
                    alert("Enter Home town");
                    return false;  
                    
                }
               
                
              

            }
            
        </script>

    </body>
</html>

