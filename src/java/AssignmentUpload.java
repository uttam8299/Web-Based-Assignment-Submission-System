/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Uttam Yadav
 */
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class AssignmentUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter(); 
        
        HttpSession session=request.getSession();
        int Student_id=Integer.parseInt(session.getAttribute("Studentid").toString());
       // String name=(String) session.getAttribute("Student_name");
        //String message = null;
        String topic=request.getParameter("FileName");
        
        
        InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("fileupload");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        try 
        {
            Date date=new Date();
            java.sql.Date sqlDate= new java.sql.Date(date.getTime());
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/wbass?useSSL=false","root","");
            
           // String name = "select student_name from Student where Student_id=?" ;
            
            String sql = "INSERT INTO AssignmentUpload(Student_id, SubmittedDate,FileName,AssignmentFileUpload) values (?,?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            //statement.setInt(1,Assigment_id);
            
            statement.setInt(1, Student_id);
            statement.setDate(2,sqlDate);
            statement.setString(3,topic);
            
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                response.setContentType("text/html");
                  PrintWriter pw=response.getWriter();
                  pw.println("<script type=\"text/javascript\">");
                  pw.println("alert('Assignment Submitted Successfully!');");
                  pw.println("</script>");
                  response.setHeader("Refresh", "0.1; URL=AssignmentUpload.jsp");
            }
        }
        catch (Exception e) {
            out1.print(e);
            
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssignmentGenerate</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println("<h1>" + message + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
