<%-- 
    Document   : newjsp
    Created on : Apr 26, 2016, 9:58:48 PM
    Author     : Lalendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            $(document).on("click", ".open-AddBookDialog", function () {
     var myBookId = $(this).data('id');
     $(".modal-body #bookId").val( myBookId );
    $('#addBookDialog').modal('show');
});
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Link 1</p>
<a data-toggle="modal" data-id="ISBN564541" data-toggle="modal" title="Add this item" class="open-AddBookDialog btn btn-primary" href="#addBookDialog">test</a>

<p>&nbsp;</p>


<p>Link 2</p>
<a data-toggle="modal" data-id="ISBN-001122" data-toggle="modal" title="Add this item" class="open-AddBookDialog btn btn-primary" href="#addBookDialog">test</a>

<div class="modal hide" id="addBookDialog">
 <div class="modal-header">
    <button class="close" data-dismiss="modal">×</button>
    <h3>Modal header</h3>
  </div>
    <div class="modal-body">
        <p>some content</p>
        <input type="text" name="bookId" id="bookId" value=""/>
    </div>
</div>

    </body>
</html>
