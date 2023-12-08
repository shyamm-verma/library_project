<%-- 
    Document   : BookReport
    Created on : 11 Jun, 2023, 12:41:16 PM
    Author     : iamsh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="com.entity.AddBookEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOK REPORT</title>
        <%@include file="all_css.jsp" %>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="navbar.jsp" %>
        <div class="container p-3">
            <div class="row">

                <%
                    int bid = (Integer) session.getAttribute("bid");
                    AddBookEntity abe = new AddBookEntity();
                    try {
                        if (bid != 0) {
                            Connection conn = DBConnect.getConnection();
                            String sql = "SELECT * FROM book where id =?";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ps.setInt(1, bid);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                abe.setBname(rs.getString(3));
                                abe.setBdetails(rs.getString(4));
                                abe.setBauthor(rs.getString(5));
                                abe.setBranch(rs.getString(7));
                                abe.setBprice(rs.getString(8));
                                abe.setBqty(rs.getString(9));
                                abe.setBimg(rs.getString(2));
                                abe.setBavailabel(rs.getInt(10));
                                abe.setBrent(rs.getInt(11));
                                abe.setBpub(rs.getString(6));
                            }

                            System.out.println(abe);
                        }

                    } catch (Exception e) {
                    }

                %>

                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src=img_folder/<%= abe.getBimg()%>  style="height: 180px; width: 150px;">
                    <h4 class="mt-3">Book Name: <%= abe.getBname()%></h4>
                    <h4 class="mt-3">Author: <%= abe.getBauthor()%></h4>
                    <h4 class="mt-3">Price: Rs. <%= abe.getBprice()%></h4>
                </div>
                <div class="col-md-6 border bg-white p-5">
                    <form>

                        <div class="form-row m-3">
                            <div class="form-group col-md-6">
                                <h4>Book Details:</h4>
                            </div>
                            <div class="form-group col-md-6">
                                <h4><%=abe.getBdetails()%></h4>
                            </div>
                        </div>

                        <div class="form-row m-3">
                            <div class="form-group col-md-6">
                                <h4>Publisher:</h4>
                            </div>
                            <div class="form-group col-md-6">
                                <h4><%=abe.getBpub()%></h4>
                            </div>
                        </div>

                        <div class="form-row m-3">
                            <div class="form-group col-md-6">
                                <h4>Branch:</h4>
                            </div>
                            <div class="form-group col-md-6">
                                <h4><%=abe.getBranch()%></h4>
                            </div>
                        </div>

                        <div class="form-row m-3">
                            <div class="form-group col-md-6">
                                <h4>Available:</h4>
                            </div>
                            <div class="form-group col-md-6">
                                <h4><%=abe.getBavailabel()%></h4>
                            </div>
                        </div>
                            
                        <div class="form-row m-3">
                            <div class="form-group col-md-6">
                                <h4>Rent</h4>
                            </div>
                            <div class="form-group col-md-6">
                                <h4><%=abe.getBrent()%></h4>
                            </div>
                        </div>

                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
