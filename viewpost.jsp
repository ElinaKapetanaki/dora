<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dora_app.*" %>

<%
if (session.getAttribute("authenticatedUser") == null) {
	request.setAttribute("error_message", "You are not authorized to access this resource. Please login.");
	%>
	<jsp:forward page="login.jsp"/>
	<%
} 
UserAccount authenticatedUser = (UserAccount) session.getAttribute("authenticatedUser");
String postID = request.getParameter("postID");
int pid = -1;
if (postID != null) {
    pid = Integer.parseInt(postID);
}
%>

<!DOCTYPE html>
<html>
    <head>
        <title>View Post</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="sidebar">
            <span class="text-logo" style="color: #000000;"> <b>DORA</b></span>
            <a href="userprofile.jsp" class="text-decoration-none"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="search.jsp" class="text-decoration-none"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>
        <br>
        <div class="content-container">
            <div class="post-container">
                <% 
                Post post = Post.getPostByID(pid);
                if (post != null) { 
                %>
                <div class="basic-info">
                    <div>
                        <% 
                        Spot spot = Spot.getSpotById(post.getSpotID()); 
                        Location loc = Location.getLocationByID(spot.getLocationID());
                        UserAccount ua = UserAccount.getUserAccountById(post.getCreatorID()); %>
                        <p id="name"><b><%= ua.getUsername() %></b></p>
                        <p id="loc"><b><%=loc.getCity() %>, <%=loc.getArea() %></b></p>
                        <%
                             if (post.getRating()==3) { %>
                               <i class="fa-regular fa-face-smile" style="color: #000000;"></i> 
                           <% } else if (post.getRating()== 2) { %>
                              <i class="fas fa-meh" style="color: #000000;"></i>
                            <% } else { %>
                              <i class="fas fa-frown" style="color: #000000;"></i>
                            <% } %>
                    </div>
                    
                    <br>
                    <% if (post.getCreatorID()!= authenticatedUser.getAccountID()) { %>
                        <a href="boardchoice.jsp" class="save-post">
                        <i class="fa-regular fa-bookmark" style="color: #000000;"></i>
                      </a> 
                    <% } %>
                </div>
                <a href="userprofile.jsp" class="go-back-icon">
                    <i class="fas fa-chevron-left"></i>
                </a>
                <br>
                <h3 class="title-text"><%=post.getTitle()%></h3>
                <img src="images/<%= post.getImageURL() %>" class="card-img-top" alt="Post Image"> 
                <p id="hash"><b><a href="viewspot.jsp">#<%=spot.getName() %></a></b></p>
                
                <p id="inform"><%=post.getDescription()%></p>
                <%} else {%>
                    <div class="alert alert-warning"> Post not found. </div>
                <%}%>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/0ad12f985e.js"></script>
    </body>   
</html>