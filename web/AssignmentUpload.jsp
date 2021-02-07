<%-- 
    Document   : AssignmentUpload
    Created on : 3 Feb, 2021, 2:58:55 PM
    Author     : Uttam Yadav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment Upload Dashboard</title>
        <style>
        .card {
                position: relative;
                z-index: 1;
                background: #FFFFFF;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                margin-top: 130px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            body{
                background-image: url("submit.png");
                background-position:left;
              }
    </style>
    </head>

    <body>
        <div class="card">
        <form action="AssignmentUpload" method="POST" enctype="multipart/form-data">
           <center>
            <h2>Upload your Assignment</h2><br><br>
            Enter the File Name:<input type="text" name="FileName"><br><br>
             <input type="file" name="fileupload" required/><br><br>
             <input type="submit" value="submit">
           </center>
       </form>
</div>  
           </body>
</html>