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
        <div class="container-fluid">
            <div class="row text-center mt-3">
                <table class="table table-striped m-3 fw-bold">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">BOOK NAME</th>
                            <th scope="col">PRICE</th>
                            <th scope="col">QUANTITY</th>
                            <th scope="col">AVAILABLE</th>
                            <th scope="col">RENT</th>
                            <th scope="col">VIEW</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            Connection conn = DBConnect.getConnection();
                            Statement st = conn.createStatement();
                            String sql = "SELECT * FROM book ";
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {%>
                        <tr>
                            <th scope="row"><%=  rs.getString(3)%></th>
                            <td><%= rs.getString(8)%></td>
                            <td><%= rs.getString(9)%></td>
                            <td><%= rs.getInt(10)%></td>
                            <td ><%= rs.getInt(11)%></td>
                            <td ><a href="BookDetail?bid=<%= rs.getInt(1)%>" id="bookreport" ><button type='button' class='btn btn-primary'> View BOOK<%= rs.getInt(1)%> </button></a></td>
                        </tr>
                        <%}
                            if (rs != null) {
                                rs.close();
                            }
                            if (st != null) {
                                st.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
