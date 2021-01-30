<%-- 
    Document   : AssignmentGenerate
    Created on : 30 Jan, 2021, 7:54:03 PM
    Author     : Uttam Yadav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assignment Generate Dashboard</title>
        <style>
        .card {
                position: relative;
                z-index: 1;
                background: seashell;
                max-width: 360px;
                margin: 0 auto 50px;
                padding: 45px;
                margin-top: 50px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
                float: right;
            }
            .blinking{
                     animation:blinkingText 1.2s infinite;
                     background: yellow;
                     height: 50px;
                 }
               @keyframes blinkingText{
                    0%{     color: red;    }
                    49%{    color: red; }
                    60%{    color: transparent; }
                    99%{    color:transparent;  }
                    100%{   color: red;    }
                }
            body{
                background: -webkit-gradient(linear, left bottom, right top, from(#fc2c77), to(#6c4079));
                background: -webkit-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: -moz-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: -o-linear-gradient(bottom left, #fc2c77 0%, #6c4079 100%);
                background: linear-gradient(to top right, #fc2c77 0%, #6c4079 100%);
                background-image: url("1.jpg");
              }
    </style>
    </head>
    <body>
        <h1 class="blinking"><center>Assignment Generation Dashboard!</center></h1>
        <div class="card">
        <form action="AssignmentGenerate" method="POST" enctype="multipart/form-data">
            <center>
                <h2>Assignment</h2>
                Enter the Assignment topic <input type="text" name="Assignmenttopic" required/><br><br>
                Enter the Assignment Description <textarea rows="4" cols="25" name="AssignmentDesc" required></textarea><br><br>
                Enter the Date:<input type="date" name="SubmissionDate" required/><br><br>
                Please Upload the Assignment file:<input type="file" name="fileupload" required/><br><br>
                <input type="submit" value="submit"/>
                
            </center>   
        </form>
        </div>
    </body>
</html>

