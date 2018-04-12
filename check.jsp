<%-- 
    Document   : check
    Created on : Apr 22, 2016, 1:05:22 PM
    Author     : Lalendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>check</h1>
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
if(userName==null){
response.sendRedirect("Home.jsp");
}
%>
<h3>Hi <%=userName %>, do the checkout.</h3>
<br>
<form action="Logout" method="post">
<input type="submit" value="Logout" >
</form>
        
    </body>
</html>
