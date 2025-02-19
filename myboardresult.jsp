<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Board</title>
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
            <a href="search.jsp"  class="text-decoration-none"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none active"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>
        <div class="content-container">
            <br>
            <h1 class="title-text">Paris trip</h1>
            <hr>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/eiffel-tower.jpg" class="card-img-top" alt="Post Image 2">
                            <div class="card-body">
                                <p class="card-text">Eiffel Tower's Timeless Majesty</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/cafe-in-paris.jpg" class="card-img-top" alt="Post Image 1">
                            <div class="card-body">
                                <p class="card-text">Cozy and beautiful spot in the center of Paris</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/0ad12f985e.js"></script>
    </body>
</html>
