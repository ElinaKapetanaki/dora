<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="dora_app.UserAccount" %>
<%@ page import="dora_app.Account" %>
<%@ page import="dora_app.Post" %>


<%
if (session.getAttribute("authenticatedUser") == null) {
	request.setAttribute("error_message", "You are not authorized to access this resource. Please login.");
	%>
	<jsp:forward page="login.jsp"/>
	<%
} 
UserAccount authenticatedUser = (UserAccount) session.getAttribute("authenticatedUser");
%>



<!DOCTYPE html>
<html>
    <head>
        <title>UserProfile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
    </head>
    <body>
        <div class="sidebar">
            <span class="text-logo" style="color: #000000;"> <b>DORA</b></span>
            <a href="userprofile.jsp" class="text-decoration-none active"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="search.jsp" class="text-decoration-none"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>

        <div class="content-container">
            <div class="image">
                <img src="images/profile.png" alt="Profile Image" class="round-image">
            </div>
                <div class="title-text">
                    <h5 class="aligned-name"><%=authenticatedUser.getFullName() %></h5>
                    <p id="aligned-username"><%=authenticatedUser.getUsername() %></p>
                    <p class="aligned-bio-info"><%=authenticatedUser.getBio() %></p>
                </div>

                <div class="frame">
                    <button class="btn sign-out"><a href="signout.jsp">Sign Out</a></button>
                </div>
                <hr>
                <% if(request.getAttribute("message") != null) { %>		
                    <div class="alert alert-success text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
                <% } %> 
                  <div class="container-fluid">
                    <div class="row">
        <% try {
                    ArrayList<Post> userPosts = Post.getUserPosts(authenticatedUser.getAccountID());
                    Iterator<Post> iterator = userPosts.iterator();
                    while (iterator.hasNext()) {
                        Post post = iterator.next();
            %>
                        <div class="col-md-3">
                            <a href="viewpost.jsp?postID=<%=post.getPostID()%>" class="card">
                                <img src="images/<%= post.getImageURL() %>" class="card-img-top" alt="Post Image">
                                <div class="card-body">
                                    <p class="card-text"><%= post.getTitle() %></p>
                                </div>
                            </a>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/0ad12f985e.js"></script>
    </body>
</html>