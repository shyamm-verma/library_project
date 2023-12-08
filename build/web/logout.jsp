<%-- 
    Document   : logout
    Created on : 25 Jun, 2023, 10:26:17 AM
    Author     : iamsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            if (session.getAttribute("username") != null && session.getAttribute("id")!=null) {
                session.removeAttribute("username");
                session.removeAttribute("id");
                session.removeAttribute("msg1");
                 response.sendRedirect("login.jsp");
                 session.removeAttribute("adminEmail");
                 session.removeAttribute("adminId");
            }else{
                response.sendRedirect("login.jsp");
            }

        %>
    </body>
</html>
