/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Uttam Yadav
 */
public class AddStudent extends HttpServlet {
     
    String password;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter();
        
        HttpSession session=request.getSession();
        Integer Facultyid=Integer.parseInt(session.getAttribute("Faculty_id").toString());
        //out1.println("Facultyid"+Facultyid);
        
        String username=request.getParameter("studentname");
        String email=request.getParameter("studentmail");
        Integer rollno=Integer.parseInt(request.getParameter("studentrollno"));
        String no=Integer.toString(rollno);
        Integer sid = Integer.parseInt(request.getParameter("studentid"));
        password=username+no;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/wbass?useSSL=false","root","");
            String query="Insert into student values (?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setInt(1,sid);
            ps.setString(2,username);
            ps.setString(3,password);
            ps.setString(4,email);
            ps.setInt(5,Facultyid);
            ps.setInt(6,rollno);
            
            int result=ps.executeUpdate();
            if(result == 1)
            {
                 response.setContentType("text/html");
                  PrintWriter pw=response.getWriter();
                  pw.println("<script type=\"text/javascript\">");
                  pw.println("alert('Student Data Inserted Successfully!');");
                  pw.println("</script>");
              response.setHeader("Refresh", "0.5; URL=AddStudent.jsp");
            }
            else
            {
              out1.print("No Data inserted");
            }    
          } 
        catch (Exception e) {
            out1.print(e);
            
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
