<%-- 
    Document   : UserRequest
    Created on : 24 Jun, 2023, 6:22:22 PM
    Author     : iamsh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Request</title>
        <%@include file="all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="user_navbar.jsp" %>


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



        <div class="container">
            <div class="row mt-3 p-3">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <h3 class="text-center text-danger">REQUEST BOOK</h3>

                        <%
                            Connection conn = DBConnect.getConnection();
                            String sql1 = "SELECT * FROM book where bookava !=0 ";
                            PreparedStatement ps1 = conn.prepareStatement(sql1);
                            ResultSet rs1 = ps1.executeQuery();
                            while (rs1.next()) {%>

                        <div class="card-body border m-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <img src="img_folder/<%= rs1.getString(2)%>"  height="150px" width="150px  >
                                         <!--out.println("img_folder/"<%= rs1.getString(2)%>);-->
                                </div>
                                <div class="col-md-6">
                                    <h6>BOOK NAME: <span class="text-danger"><%= rs1.getString(3)%></span></h6>
                                    <h6>BOOK AUTHOR: <span class="text-primary"><%= rs1.getString(5)%></h6>
                                    <h6>BRANCH: <span class="text-primary"><%= rs1.getString(7)%></h6>
                                    <h6>PRICE: <span class="text-primary">Rs. <%= rs1.getString(8)%></h6>
                                    <a href="PersonBookRequest?uid=<%= uid%>&bid=<%= rs1.getInt(1)%>" id="bookreport" ><button type='button' class='btn btn-primary' onclick="callalert();"> REQUEST</button></a>
                                </div>
                            </div>
                        </div>

                        <% }

                        %>


                    </div>
                </div>
            </div>
        </div>
                        
                        <script type="text/javascript">
                            function callalert(){
                                confirm("send book request to admin?");
                            }
                        </script>
                        
    </body>
</html>
