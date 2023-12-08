<%-- 
    Document   : AddBook
    Created on : 11 Jun, 2023, 1:46:13 AM
    Author     : iamsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD BOOK</title>
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
            <div class="row mt-3 p-3">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center p-2">ADD BOOK</h4>
                            <c:if test="${not empty f1}">
                                <p class="text-center text-success">${f1}</p>
                                <c:remove var="f1" scope="session" />
                            </c:if>
                            <c:if test="${not empty f2}">
                                <p class="text-center text-danger">${f2}</p>
                                <c:remove var="f2" scope="session" />
                            </c:if>
                            <form action="AddBookServlet" method="post"  enctype="multipart/form-data">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="bname">Book Name</label>
                                        <input type="text" name="bname" id="bname" required class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="bdetails">Book Details</label>
                                        <input type="text" name="bdetails" id="bdetails" required class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="bauthor">Author</label>
                                        <input type="text" name="bauthor" id="bauthor" required class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="bpub">Publication</label>
                                        <input type="text" name="bpub" id="bpub" required class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="bprice">Price</label>
                                        <input type="number" name="bprice" id="bprice" required class="form-control">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="bqty">Quantity</label>
                                        <input type="number" name="bqty" id="bqty" required class="form-control">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="bimg">Book Image</label>
                                        <input type="file" class="form-control-file border" name="bimg" id="bimg" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="form-group">
                                            <label for="branch">Select Branch:</label>
                                            <select class="form-control" id="branch" name="branch">
                                                <option value="">--SELECT--</option>
                                                <option value="BSC IT">BSC IT</option>
                                                <option value="BSC CS">BSC CS</option>
                                                <option value="MCA">MCA</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-center"><button type="submit" class="btn btn-primary btn-lg" >Add</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    </script>
</body>
</html>
