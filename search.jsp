<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body class="body-search"> 
        <div class="sidebar">
            <span class="text-logo"><b>DORA</b></span>
            <a href="userprofile.jsp" class="text-decoration-none"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="search.jsp" class="text-decoration-none active"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>
        <div id="first-search-container">
            <form action="searchresult.jsp">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for a Area, City..">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </form>
            <div id="monuments-photo">
                <img src="images/monuments.jpg" alt="Monuments">
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/0ad12f985e.js"></script>
    </body>
</html>
