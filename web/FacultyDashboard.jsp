<%-- 
    Document   : FacultyDashboard
    Created on : 29 Jan, 2021, 9:44:40 PM
    Author     : Uttam Yadav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Dashboard</title>
        <style>
        .card {
                position: relative;
                z-index: 1;
                background-color: seashell;
                max-width: 500px;
                margin: 0 auto 100px;
                padding: 45px;
                margin-top: 130px;
                text-align: center;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            }
            .my-text {
                 animation: pop 0.4s ease-in-out;
                 animation-delay: 1s;
            }

           @keyframes pop {
             50%  {
                      transform: scale(1.25);
                  }
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
                .bdy{
                    background-color: background;
                    background-image: url(blackboard.png);
                }
            
    </style>
    </head>
    <body class="bdy">
        <h1 class="blinking"><center>Welcome Faculty!</center></h1>
        <div class="card">
            <center>
        <h2>Faculty DashBoard</h2>
        <table border="1" width="50%">
            <tr>
                <td>To add Student</td>
                <td><a href="AddStudent.jsp">Click Here</a></td>
            </tr>
            <tr>
                <td>To generate Assignment</td>
                <td><a href="AssignmentGenerate.jsp">Click Here</a></td>
            </tr>
            
            <tr>
                <td>To view Assignments</td>
                <td><a href="ViewStudent.jsp">Click Here</a></td>
            </tr>
        </table>
            </center>
        </div>
    </body>
</html>
