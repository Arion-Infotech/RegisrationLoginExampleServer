<%-- 
    Document   : login
    Created on : 08-Sep-2019, 14:58:13
    Author     : umer
--%>

<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
    try {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
                + "webservicedb?zeroDateTimeBehavior=convertToNull", "root", "root");
        Statement stmt = con.createStatement();
        String query = "select * from registration where email = '" + email + "' and password = '" + password + "'";
        System.out.println("query=" + query);
        ResultSet rset = stmt.executeQuery(query);
        JsonObject jobj = new JsonObject();
        String res = "";
        if (rset.next()) {            
            jobj.addProperty("msg", "success");
        } else {     
            jobj.addProperty("msg", "failed");   
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().write(jobj.toString());
    } catch (Exception e) {
        System.out.println(e);
    }
%>
