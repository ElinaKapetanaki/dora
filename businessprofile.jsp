<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Business Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="sidebar">
            <span class="text-logo" style="color: #000000;"> <b>DORA</b></span>
            <a href="businessprofile.jsp" class="text-decoration-none active"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="businessstats.jsp" class="text-decoration-none"><i class="fa-solid fa-chart-simple" style="color: #000000;"></i></a>
        </div>
        <div class="content-container">
            <div class="image">
                <img src="images/logo-business.png" class="rounded-image" width="100"/>
            </div>   
            <div class="title-text">
                <h5 class="aligned-name">Tanpopo</h5>
                <p id="card-location">Center, London</p>
                <p class="aligned-bio-info">Noodles made from wheat flour in a bowl filled with broth made from meat, fish, and vegetables, 
                    with a sauce called tare that defines the character of the recipe, along with aromatic (animal or plant-based) oil and 
                    toppings such as nori seaweed and chashu, the pork (belly, neck, or shoulder) cooked in soy sauce, mirin (rice wine), and sake.
                </p>           
            </div>
            <div class="frame">
                <button class="btn sign-out"><a href="login.jsp">Sign Out</a></button>
            </div>
            <hr>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <a href="viewpost.jsp" class="card">
                            <img src="images/tampopo-2.jpg" class="card-img-top" alt="Post Image 1">
                            <div class="card-body">
                                <p class="card-text">A ramen restaurant of pure confort</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/tanpopo.jpg" class="card-img-top" alt="Post Image 2">
                            <div class="card-body">
                                <p class="card-text">A world of flavor on one plate</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/tampopo-3.jpg" class="card-img-top" alt="Post Image 3">
                            <div class="card-body">
                                <p class="card-text">An enjoyable yet overated noodle experiance</p>
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