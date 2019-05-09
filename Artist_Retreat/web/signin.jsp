<%-- 
    Document   : signin
    Created on : 25 Nov, 2018, 9:28:02 AM
    Author     : Gudiya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <body>
        <%@page import ="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
           String email=request.getParameter("email");
            String psw=request.getParameter("psw");
           
           
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/artist_retreat?useSSL=false", "root", "root");
               String Que="select * from signup where email=? and psw=?";
                PreparedStatement calstat=con.prepareStatement(Que);
              calstat.setString(1,email);
                calstat.setString(2,psw);
               ResultSet rs=calstat.executeQuery();
               if(rs.next())
               {
                   response.sendRedirect("index.html");
               }
               else
            {
                  response.sendError(401,"Invalid Credentials");
            }
         
        
        
            
%>
    </body>
</html>
