<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dora_app.UserAccount"%>
<%@ page errorPage="error.jsp" %>

<%
UserAccount authenticatedUser = (UserAccount) session.getAttribute("authenticatedUser");

if (authenticatedUser == null) {
    request.setAttribute("error_message", "You are not authorized to access this resource, please login");
    %>
    <jsp:forward page="login.jsp" />
   <%
}

String message = (String) request.getAttribute("message"); 
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Create a new Post</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
        <link rel="icon" href="<%=request.getContextPath() %>/images/favicon.png" type="image/png">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <body class= "create-body">
        <div class="sidebar">
            <span class="text-logo"><b>DORA</b></span>
            <a href="userprofile.jsp" class="text-decoration-none"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="search.jsp" class="text-decoration-none"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none active"><i class="fa-solid fa-plus" id="plus-icon" style="color: #000000"></i></a>
        </div>
        <div class="content-container create">
            <div class="form-title"> 
                <h2>Create a new Post!</h2>
                <h4>@angie</h4>
            </div>
            <form class="form-container" action="createPostController" method="post" enctype="multipart/form-data">
                <% if (message != null) { %>
                <div class="alert alert-danger text-center" role="alert">
                    <p><%= message %></p>
                </div>
                <% } %>
                <div class="mb-3">
                    <label class="form-label" for="file">Choose an image</label>
                    <input type="file" class="form-control" id="file" name="file" required>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Add the title of your post</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="A cozy afternoon in London" required>
                </div>
                <div class="mb-3">
                    <label for="city" class="form-label">Add the city of your post</label>
                    <input type="text" class="form-control" id="city" name="city" placeholder="London" required>
                </div>
                <div class="mb-3">
                    <label for="area" class="form-label">Add the area of your post</label>
                    <input type="text" class="form-control" id="area" name="area" placeholder="Brixton" required>
                </div>
                <div class="mb-3">
                    <label for="spot-name" class="form-label">Add the name of the spot</label>
                    <input type="text" class="form-control" id="spot-name" name="spotName" placeholder="Brixton Blend" required>
                </div>
                <div class="mb-3">
                    <label for="spot-category" class="form-label">Select the category of the spot</label>
                    <select class="form-select" id="spot-category" name="category" required>
                        <option value="" disabled selected>Select an option</option>
                        <option value="landmark">Landmark</option>
                        <option value="museum">Museum</option>
                        <option value="cafe">Café</option>
                        <option value="bar">Bar</option>
                        <option value="restaurant">Restaurant</option>
                        <option value="park">Park</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Add the description of your post</label>
                    <input type="text" class="form-control" id="description" name="description" placeholder="Brixton Blend is a lovely local cozy spot...">
                    <br>
                    <div class="mb-3">
                        <label for="satisfaction-dropdown" class="form-label">How would you rate the spot?</label>
                        <select class="form-select" id="satisfaction-dropdown" name="rating" required>
                            <option value="0" disabled selected>Select an option</option>
                            <option value="3">😊Must-Visit</option>
                            <option value="2">😐Meh</option>
                            <option value="1">☹️Avoid</option>
                        </select>
                    </div>         
                </div>
                <div class="mb-3 title-text">
                    <button class="btn btn-primary" type="submit">Post</button>
                </div>
            </form>
        </div> 
        <script src="<%=request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath() %>/js/0ad12f985e.js"></script>
    </body>
</html>