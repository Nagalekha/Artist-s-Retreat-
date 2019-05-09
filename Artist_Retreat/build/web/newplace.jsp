<%-- 
    Document   : signup
    Created on : 25 Nov, 2018, 9:28:18 AM
    Author     : Gudiya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artist Retreat </title>
    </head>
    <body>
        <%@  page import ="java.sql.*"%> 
        <%@ page import="javax.sql.*"%>
        <% 
            String name=request.getParameter("name");
            String desc=request.getParameter("desc");
            String addr=request.getParameter("addr");
            String phno=request.getParameter("phno");
       
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/artist_retreat?useSSL=false", "root", "root");
     
                PreparedStatement calstat=con.prepareStatement("insert into addanewplace values(?,?,?,?)");
                calstat.setString(1,name);
                calstat.setString(2,desc);
                calstat.setString(3,addr);
                calstat.setString(4,phno);
                calstat.executeUpdate();
            
                 con.close();
                 calstat.close();
                 //out.println("you data has inserted into the table.");
                 response.sendRedirect("newplaces.html");
            %>
    </body>
</html>
