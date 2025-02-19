<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%
List<String> errors = (List<String>) request.getAttribute("errors"); 
%>

<!DOCTYPE html>
<html>
    <head>
        <title>User Sign Up</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    <body class="login-body">
        <img src="images/Dora_Logo.png" alt="Dora Logo" class="banner-image">
        <h2 class="form-title">User Account Form</h2>

        <form class="form-container" action="usersignupController.jsp" method="post">
            <% if (errors != null && !errors.isEmpty()) { %>
                <div class="alert alert-danger text-center" role="alert">
                    <ol class="list-unstyled">
                        <% for (String error : errors) { %>
                            <li><%= error %></li>
                        <% } %>
                    </ol>
                </div>
                <% } %>
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" name="username" class="form-control" id="username" placeholder="johndoe" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
            </div>
            <div class="mb-3">
                <label for="full-name" class="form-label">Full Name:</label>
                <input type="text" name="fullName" class="form-control" id="full-name" placeholder="John Doe" required>
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">Age:</label>
                <input type="number" name="age" class="form-control" id="age" placeholder="Age" required>
            </div>
            <div class="mb-3">
                <label for="country" class="form-label">Country:</label>
                <input type="text" name="country" class="form-control" id="country" placeholder="Country" required>
            </div>
            <div class="mb-3">
                <label for="gender" class="form-label">Gender:</label>
                <select id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="input-group">
                <span class="input-group-text">Bio</span>
                <textarea  name="bio" class="form-control" aria-label="With textarea"></textarea>
            </div>
            <div class="mb-3 text-center">
                </br>
                <button class="btn btn-primary" type="submit">Sign up</button>
            </div>
        </form>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>