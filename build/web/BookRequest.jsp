<%-- 
    Document   : BookRequest
    Created on : 23 Jun, 2023, 11:39:03 PM
    Author     : iamsh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index page</title>
        <%@include file="all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
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
                            <th scope="col">PERSON NAME</th>
                            <th scope="col">PERSON TYPE</th>
                            <th scope="col">BOOK NAME</th>
                            <th scope="col">DAYS</th>
                            <th scope="col">APPROVE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            Connection conn = DBConnect.getConnection();
                            Statement st = conn.createStatement();
                            String sql = "SELECT * FROM requestbook ";
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {%>
                        <tr>
                            <th scope="row"><%=  rs.getString(4)%></th>
                            <td><%= rs.getString(5)%></td>
                            <td><%= rs.getString(6)%></td>
                            <td><%= rs.getInt(7)%></td>
                            <td ><a href="BookRequest?reqid=<%= rs.getInt(1)%>&uid=<%= rs.getString(2)%>&bid=<%= rs.getString(3)%>&idays=<%= rs.getInt(7)%>" id="bookreport" ><button type='button' class='btn btn-primary'> Approve<%= rs.getInt(1)%> </button></a></td>
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

