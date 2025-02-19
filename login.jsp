<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        </head>
    <body class="login-body">
        <img src="images/Dora_Logo.png" alt="Dora Logo" class="banner-image">
        <div id="log-in-container">
            <div id="welcome-phrase">
                <br>
                <br>
                <h1><b>Welcome!</b><h1>
                
                <h3><b>Get ready to explore...</b></h3>
            </div>
            <div class="form-container">
                <% if(request.getAttribute("error_message") != null) { %>		
                    <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("error_message") %></div>
                <% } %>

                <!--Through this form you will dynamically be able to userprofile or businessprofile
                depending on your type of account-->
                <form action="loginController.jsp" method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="******" required>
                    </div>
                    <div class="mb-3">
                        <br>
                        <button id="submitlogin" type="submit" class="btn btn-primary">Login</button>
                    </div>
                    <p id="signup-links">or Create a <a href="usersignup.jsp">User</a> or <a href="businesssignup.jsp">Business</a> Account</p>
                </form>
            </div>  
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
