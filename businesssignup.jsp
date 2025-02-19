<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Business Sign Up</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body class= "login-body">
        <img src="images/Dora_Logo.png" alt="Dora Logo" class="banner-image">
        <h2 class="form-title">Business Account Form</h2>
        <form class="form-container" action="businessprofile.jsp">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" class="form-control" id="username" placeholder="mycompany" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="text" class="form-control" id="password" placeholder="Password" required>
            </div>
            <div class="mb-3">
                <label for="spot-name" class="form-label">Spot Name</label>
                <input type="text" class="form-control" id="spot-name" placeholder="Spot Name" required>
            </div>
            <div class="mb-3">
                <label for="spot-category" class="form-label">Select the category of the spot</label>
                <select class="form-select" id="spot-category" required>
                    <option value="" disabled selected>Select an option</option>
                    <option value="landmark">Landmark</option>
                    <option value="museum">Museum</option>
                    <option value="cafe">CafΓ©</option>
                    <option value="bar">Bar</option>
                    <option value="restaurant">Restaurant</option>
                    <option value="park">Park</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="location" class="form-label">Spot Location</label>
                <input type="text" class="form-control" id="location" placeholder="Spot Location" required>
            </div>
            <div class="input-group">
                <span class="input-group-text">Info</span>
                <textarea class="form-control" aria-label="With textarea"></textarea>
            </div>
            <div class="mb-3 text-center">
            </br>
                <button class="btn btn-primary" type="submit">Sign up</button>
            </div>
        </form>  
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>