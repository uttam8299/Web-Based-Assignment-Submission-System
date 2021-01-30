<%-- 
    Document   : AddStudent
    Created on : 29 Jan, 2021, 10:17:44 PM
    Author     : Uttam Yadav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
    <style>
        .card {
                position: relative;
                z-index: 1;
                background: seashell;
                max-width: 360px;
                margin: 0 auto 100px;
                padding: 45px;
                margin-top: 130px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
                float: right;
            }
            body{
                background: -webkit-gradient(linear, left bottom, right top, from(#fc2c77), to(#6c4079));
                background: -webkit-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: -moz-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: -o-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: linear-gradient(to top right, #fc2c77 0%, #6c4079 100%);
                background-image: url("2.jpg");
                image-resolution: from-image;
              }
              h2{
                  color: red;
                  font-family: monospace;
              }
    </style>
    </head>
    <body>
        <div class="card">
        <form action="AddStudent" method="POST">
           
                <h2>Add Student</h2>     
            Enter the Student ID:<input type="number" name="studentid" required/><br><br>
            Enter the Student name:<input type="text" name="studentname" required/><br><br>
            Enter the Student mail:<input type="text" name="studentmail" required/><br><br>
            Enter the Student Roll no:<input type="text" name="studentrollno" required/><br><br>
            <input type="submit" value="Add">
            
        </form>
        </div>
    </body>
</html>
