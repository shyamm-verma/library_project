<%-- 
    Document   : AddPerson
    Created on : 11 Jun, 2023, 2:49:57 PM
    Author     : iamsh
--%>

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
                            <h4 class="text-center p-2">ADD PERSON</h4>
                            <c:if test="${not empty f3}">
                                <p class="text-center text-success">${f3}</p>
                                <c:remove var="f3" scope="session" />
                            </c:if>
                            <c:if test="${not empty f4}">
                                <p class="text-center text-danger">${f4}</p>
                                <c:remove var="f4" scope="session" />
                            </c:if>
                            <form action="AddPerson" method="post">
                                <div class="form-group p-3">
                                    <label for="uname">Name:</label>
                                    <input type="text" name="uname" id="uname" required class="form-control">                
                                </div>
                                <div class="form-group p-3">
                                    <label for="uemail">Email address</label>
                                    <input type="email" name="uemail" id="uemail" required class="form-control">                
                                </div>
                                <div class="form-group p-3">
                                    <label for="upass">Password</label>
                                    <input type="text" name="upass" id="upass" required class="form-control">
                                </div>
                                <div class="form-group p-3">
                                    <label for="utype">Choose Type:</label>
                                    <select class="form-control" id="utype" name="utype">
                                        <option value="">--SELECT--</option>
                                        <option value=" student">STUDENT</option>
                                        <option value="teacher">TEACHER</option>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary btn-lg">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
