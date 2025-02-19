<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My boards</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="sidebar">
            <span class="text-logo" style="color: #000000;"><b>DORA</b></span>
            <a href="userprofile.jsp" class="text-decoration-none"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="search.jsp" class="text-decoration-none"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none active"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>
        <div class="content-container">
            <br>
            <h1 class="title-text">My Travel Boards</h1>
            <hr>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card board" style="background-image: url(images/cafe-in-paris.jpg);">
                            <div class="card-body board">
                              <h5 class="card-title">Paris trip</h5>
                              <p class="card-text">Currently contains 4 posts</p>
                              <a href="myboardresult.jsp" class="btn btn-primary" role="button">See full board</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card board" style="background-image: url(images/trevi-fountain.jpg);">
                            <div class="card-body board">
                              <h5 class="card-title">Rome trip</h5>
                              <p class="card-text">Currently contains 5 posts</p>
                              <a href="#" class="btn btn-primary" role="button">See full board</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/0ad12f985e.js"></script>
    </body>
</html>
