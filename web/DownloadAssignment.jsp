<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("Assignment_id");
 
String connectionURL = "jdbc:mysql://localhost:3306/wbass";
String user = "root";
String pass = "";
 
Connection con = null;
 
try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(connectionURL, user, pass);
    
    PreparedStatement ps = con.prepareStatement("select * from Assignment where Assignment_id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
 
    if(rs.next()){
        Blob blob = rs.getBlob("FileUpload");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
 
        response.setContentType("application/pdf");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
}
catch(Exception e){
    e.printStackTrace();
}   
finally{
    if(con != null){
        try{
            con.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
%>