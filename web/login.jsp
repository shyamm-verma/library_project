<%-- 
    Document   : login
    Created on : 24 Jun, 2023, 3:53:30 PM
    Author     : iamsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
        <%@include file="all_css.jsp" %>
        <style>
            body {
                background-color: #f0f1f2;
            }
            .login-container {
                max-width: 400px;
                margin: 0 auto;
                margin-top: 100px;
            }
            .login-card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .login-card-header {
                background-color: #007bff;
                color: #fff;
                text-align: center;
                padding: 20px;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            .login-card-title {
                margin-bottom: 0;
            }
            .login-card-body {
                padding: 20px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .form-group button {
                width: 100%;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="login-container">
                        <div class="card login-card">
                            <div class="card-header login-card-header bg-success">
                                <h4 class="login-card-title text-dark">User Login</h4>
                            </div>
                            <div class="card-body login-card-body">
                                <form action="/library_project/CheckUser" method="post">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                                    </div>
                                    <div class="text-center p-2">
                                        <label class="radio-inline mr-1">
                                            <input type="radio" name="option" value="admin" checked> admin
                                        </label>
                                        <label class="radio-inline ml-1">
                                            <input type="radio" name="option" value="user"> user
                                        </label>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-success text-dark">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
