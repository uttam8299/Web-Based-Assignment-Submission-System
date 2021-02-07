
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
        PrintWriter out1 = response.getWriter();
        String message=null;
        session=request.getSession();
        int Assigment_id=Integer.parseInt(session.getAttribute("Assigment_id").toString());
        out1.println("Assigment_id"+Assigment_id);
        //Error:from ViewAssignment.java Current Session Assignment ID is Taking always at tha start hence
        
        int Student_id=Integer.parseInt(session.getAttribute("Studentid").toString());
        out1.println("Studentid"+Student_id);
        
        String FileName=request.getParameter("Filename");
        
        
       // Date date=new Date();
     //   java.sql.Date sqlDate= new java.sql.Date(date.getTime());
        
        InputStream input=null;
        Part filePart=request.getPart("fileupload");
        
        if (filePart != null) {
            input = filePart.getInputStream();
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/wbass?useSSL=false","root","");
            String query1="select AssignmentFileUpload from AssignmentUpload where Student_id='"+Student_id+"' and AssignmentGiven_id='"+Assigment_id+"'";
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(query1);
            out1.println("First Part Executed");
            
            if(rs!=null){
              String query2="delete from AssignmentUpload where Student_id='"+Student_id+"' and AssignmentGiven_id='"+Assigment_id+"' ";
              Statement stmt1=con.createStatement();
              int r=stmt1.executeUpdate(query2);
              out1.println("No of Rows Deleted"+r);
            }
            
           
            String query="Insert into  AssignmentUpload(AssignmentGiven_id,SubmittedDate,AssignmentFileUpload,Student_id,Filename) values(?,?,?,?,?)";
            
            PreparedStatement ps=con.prepareStatement(query);
            out1.println("Second Part");
            ps.setInt(1,Assigment_id);
           // ps.setDate(2, sqlDate);
            
            //Bug 2:Always Inserting the Same File At the Start fisrt File
            if(input!=null){
             ps.setBlob(3,input);
                
            }
            ps.setInt(4,Student_id);
            ps.setString(5,FileName);
            
            int row = ps.executeUpdate();
            if (row > 0) {
                 message = "File uploaded and saved into database";
            }
//            session.invalidate();
           
//            String query3="select StudentUploadAssignment_id from StudentUploadAssignment where Student_id='"+Student_id+"'";
//            Statement stmt3=con.createStatement();
//            ResultSet rs3=stmt3.executeQuery(query3);
            
//            if(rs3.next())
//            {
//                int i=rs3.getInt("StudentUploadAssignment_id");
//                out1.println("StudentUploadAssignment_id"+i);
//                session.setAttribute("StudentUploadAssignment_id",i);
//               
//            }    
            
         
            
            

        } catch (Exception e) {
            e.printStackTrace();
        }
%>