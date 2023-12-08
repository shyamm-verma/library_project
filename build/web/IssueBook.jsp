<%-- 
    Document   : AddPerson
    Created on : 11 Jun, 2023, 2:49:57 PM
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
        <title>Add Person</title>
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
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-body">
                            <h4 class="text-center p-2">ISSUE BOOK</h4>
                            <c:if test="${not empty f3}">
                                <p class="text-center text-success">${f3}</p>
                                <c:remove var="f3" scope="session" />
                            </c:if>
                            <c:if test="${not empty f4}">
                                <p class="text-center text-danger">${f4}</p>
                                <c:remove var="f4" scope="session" />
                            </c:if>
                            <form action="" method="post">

                                <div class="form-group p-3">
                                    <label for="btype">Select Book:</label>
                                    <select class="form-control" id="btype" name="btype">

                                        <%                                            Connection conn = DBConnect.getConnection();
                                            Statement st = conn.createStatement();
                                            String sql = "SELECT * FROM book where bookava !=0 ";
                                            ResultSet rs = st.executeQuery(sql);
                                            while (rs.next()) {
                                        %>
                                        <option value=<%= rs.getString(3)%> ><%= rs.getString(3)%></option>                           
                                        <%}
                                            if (rs != null) {
                                                rs.close();
                                            }
                                        %>
                                    </select>

                                </div>
                                <div class="form-group p-3">
                                    <label for="utype">Select Person:</label>
                                    <select class="form-control" id="utype" name="utype">
                                        <%
                                            String sql1 = "SELECT * FROM userdata";
                                            ResultSet rs1 = st.executeQuery(sql1);
                                            while (rs1.next()) {
                                        %>
                                        <option value=<%= rs1.getString(2)%> ><%= rs1.getString(2)%></option>                           
                                        <%}
                                            if (rs1 != null) {
                                                rs.close();
                                            }
                                            if (st != null) {
                                                st.close();
                                            }
                                            if (conn != null) {
                                                conn.close();
                                            }
                                        %>
                                    </select>

                                </div>
                                <div class="form-group p-3">
                                    <label for="bdays">Days:</label>
                                    <input type="number" name="bdays" id="bdays" required class="form-control">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
