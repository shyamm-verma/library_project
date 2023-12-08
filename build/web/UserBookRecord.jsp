<%-- 
    Document   : UserBookRecord
    Created on : 24 Jun, 2023, 11:02:31 PM
    Author     : iamsh
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <%@include file="user_navbar.jsp" %>


        <%!
            // Initialization block
            int counter;

            // Method to initialize the counter
            public void initCounter() {
                counter = 0;
            }
        %>
        <%
            String username = null;
            String u_id = null;
            int uid = 0;
            String msg1 = "";

            if (session.getAttribute("username") != null && session.getAttribute("id") != null) {
                username = (String) session.getAttribute("username");
                u_id = (String) session.getAttribute("id");
                uid = Integer.parseInt(u_id);
                msg1 = (String) session.getAttribute("msg1");
                //out.println(uid + " " + username);
            } else {
                response.sendRedirect("login.jsp");
            }
            Connection conn = DBConnect.getConnection();
            String returnDate = "";
            int newFine = 0;


        %>

        <%            try {
                if (msg1 != null || counter <= 0) {

                    if (msg1.equals("pass")) {
                        String sql1 = "SELECT * FROM issuebook where userid=?";
                        PreparedStatement ps1 = conn.prepareStatement(sql1);
                        ps1.setInt(1, uid);
                        ResultSet rs1 = ps1.executeQuery();
                        while (rs1.next()) {

                            String bname = rs1.getString(4);
                            returnDate = rs1.getString(8);
                            int fine = rs1.getInt(9);

                            if (bname != null) {

                                LocalDate currentDate = LocalDate.now();
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                                String currentDateStr = currentDate.format(formatter);
                                //out.println(returnDate + " " + currentDateStr + " " + returnDate.getClass().getSimpleName() + " " + currentDateStr.getClass().getSimpleName());
                                String m1 = returnDate;
                                String m2 = currentDateStr;
                                DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");

                                try {
                                    LocalDate date1 = LocalDate.parse(m1, dateFormat);
                                    LocalDate date2 = LocalDate.parse(m2, dateFormat);

                                    if (date1.isBefore(date2)) {
                                        out.println(m1 + " is before " + m2);
                                        out.println();
                                        String sql3 = "UPDATE issuebook SET fine=? WHERE userid=? AND issuebook=?";
                                        PreparedStatement ps3 = conn.prepareStatement(sql3);
                                        fine += 20;
                                        out.println(fine + " " + uid + " " + bname);
                                        ps3.setInt(1, fine);
                                        ps3.setInt(2, uid);
                                        ps3.setString(3, bname);
                                        int rsupdate1 = ps3.executeUpdate();
                                        if (rsupdate1 > 0) {
                                            out.println("done");
                                        } else {
                                            out.println("not done");
                                        }
                                    } else if (date1.isAfter(date2)) {
                                        out.println(m1 + " is after " + m2);
                                        out.println();
                                        String sql2 = "UPDATE issuebook SET fine=? WHERE userid=? AND issuebook=?";
                                        PreparedStatement ps2 = conn.prepareStatement(sql2);
                                        ps2.setInt(1, fine);
                                        ps2.setInt(2, uid);
                                        ps2.setString(3, bname);
                                        int rsupdate = ps2.executeUpdate();
                                        if (rsupdate > 0) {
                                            out.println("success");
                                        } else {
                                            out.println("fail");
                                        }

                                    } else {
                                        out.println(m1 + " is equal to " + m2);
                                    }

                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                out.println(msg1);
                            }

                        }

                    } else {
                        response.sendRedirect("UserBookRecord.jsp");
                    }

                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>


        <div class="container-fluid">
            <div class="row text-center mt-3">
                <table class="table table-striped m-3 fw-bold">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">NAME</th>
                            <th scope="col">BOOK NAME</th>
                            <th scope="col">ISSUE DATE</th>
                            <th scope="col">RETURN DATE</th>
                            <th scope="col">FINE</th>
                            <th scope="col">RETURN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            String sql = "SELECT * FROM issuebook where userid=?";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ps.setInt(1, uid);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {%>
                        <tr>
                            <th scope="row"><%=  rs.getString(3)%></th>
                            <td><%= rs.getString(4)%></td>
                            <td><%= rs.getString(7)%></td>
                            <td><%= rs.getString(8)%></td>
                            <td ><%= rs.getInt(9)%></td>
                            <td ><a href="ReturnServlet?uiid=<%= rs.getInt(1)%>&bname=<%= rs.getString(4)%>" id="bookreport" ><button type='button' class='btn btn-primary'> RETURN<%= rs.getInt(1)%> </button></a></td>
                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

