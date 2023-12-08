<%-- 
    Document   : BookReport
    Created on : 11 Jun, 2023, 1:06:36 PM
    Author     : iamsh
--%>

<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Report</title>
        <%@include file="all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">

        <%

            String adminEmail = null;
            String u_id = null;
            int adminId = 0;

            if (session.getAttribute("adminEmail") != null && session.getAttribute("adminId") != null) {
                adminEmail = (String) session.getAttribute("adminEmail");
                u_id = (String) session.getAttribute("adminId");
                adminId = Integer.parseInt(u_id);
                //out.println(adminId + " " + adminEmail);
            } else {
                response.sendRedirect("login.jsp");
            }

        %>


        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row text-center mt-3">
                <table class="table table-striped m-3 fw-bold">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">NAME</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">TYPE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            Connection conn = DBConnect.getConnection();
                            Statement st = conn.createStatement();
                            String sql = "SELECT * FROM userdata";
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {%>
                        <tr>
                            <th scope="row"><%=  rs.getString(2)%></th>
                            <td><%= rs.getString(3)%></td>
                            <td><%= rs.getString(5)%></td>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
