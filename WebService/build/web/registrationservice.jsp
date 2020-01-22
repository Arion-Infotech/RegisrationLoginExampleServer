<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("name");
    String place = request.getParameter("place");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con;
    Statement smt;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
            + "webservicedb?zeroDateTimeBehavior=convertToNull","root", "root");
    String sql = "insert into registration(name,place,email,password)values('" + name + "'"
            + ",'" + place + "','" + email + "','" + password + "')";

    smt = con.createStatement();
    int n = smt.executeUpdate(sql);

    JsonObject jobj = new JsonObject();
    if (n > 0) {
        jobj.addProperty("msg", "success");

    } else {
        jobj.addProperty("msg", "failed");
    }
%>