<%-- 
    Document   : FacultyLogin
    Created on : 28 Jan, 2021, 8:19:52 PM
    Author     : Uttam Yadav
--%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Login</title>
        <style>
            .card {
                z-index: 1;
                background: #FFFFFF;
                background-color: seashell;
                max-width: 360px;
                margin: 0 auto 80px;
                margin-top: 80px;
                margin-right: 400px;
                padding: 45px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            body{
                height: 600px;
                background-image: url("bb.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                 
            }
        </style>
    </head>
    <%@include file="header.html" %>
    <body>
        
        <div class="card">
        <form action="FacultyLogin" method="POST">
            <h2>Faculty Login </h2><br><br>
                Enter the username:<input type="text" name="Faculty_Username" required/><br><br>
                Enter the password:<input type="password" name="Faculty_Password" required/><br><br>
            <input type="submit" value="submit"/>
        </form>
        </div>
    </body>
    
    
</html>

