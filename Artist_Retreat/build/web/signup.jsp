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
            String email=request.getParameter("email");
            String psw=request.getParameter("psw");
            String rpsw=request.getParameter("rpsw");
            String aid=request.getParameter("aid");
            String pno=request.getParameter("pno");
       
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/artist_retreat?useSSL=false", "root", "root");
     
                PreparedStatement calstat=con.prepareStatement("insert into signup(email,psw, rpsw, aid, pno) values(?,?,?,?,?)");
                calstat.setString(1,email);
                calstat.setString(2,psw);
                calstat.setString(3,rpsw);
                calstat.setString(4,aid);
                calstat.setString(5,pno);
               
                   
                calstat.executeUpdate();
            
                 con.close();
                 calstat.close();
                 //out.println("you data has inserted into the table.");
                 response.sendRedirect("signin.html");
            %>
    </body>
</html>
