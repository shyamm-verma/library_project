<%-- 
    Document   : UserProfile
    Created on : 24 Jun, 2023, 5:37:50 PM
    Author     : iamsh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            
            String username = null;
            String u_id = null;
            int uid=0;

            if (session.getAttribute("username") != null && session.getAttribute("id")!=null) {
                username = (String) session.getAttribute("username");
                u_id = (String) session.getAttribute("id");
                uid = Integer.parseInt(u_id);
                //out.println(uid + " " + username);
            }else{
                response.sendRedirect("login.jsp");
            }

        %>


        <%@include file="user_navbar.jsp" %>

        <div class="container">
            <div class="row mt-3 p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <h3 class="text-center text-danger">MY ACCOUNT</h3>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="text-primary">Person Name: </h4>
                                    <h4 class="text-primary">Person Email: </h4>
                                    <h4 class="text-primary">Person Type: </h4>
                                </div>
                                <div class="col-md-6">

                                    <%                                        String pname = "";
                                        String utype = "";
                                        Connection conn = DBConnect.getConnection();
                                        String sql2 = "SELECT * FROM userdata where email=?";
                                        PreparedStatement ps2 = conn.prepareStatement(sql2);
                                        ps2.setString(1, username);
                                        ResultSet rs2 = ps2.executeQuery();
                                        while (rs2.next()) {
                                            pname = rs2.getString(2);
                                            utype = rs2.getString(5);
                                        }

                                    %>
                                    <h4><%= username%></h4>
                                    <h4><%= pname%></h4>
                                    <h4><%= utype%></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
