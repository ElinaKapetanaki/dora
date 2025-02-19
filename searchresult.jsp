<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Result</title>
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
            <a href="search.jsp" class="text-decoration-none active"><i class="fa-solid fa-magnifying-glass" style="color: #000000;"></i></a>
            <a href="myboardsresult.jsp" class="text-decoration-none"><i class="fa-regular fa-bookmark" style="color: #000000;"></i></a>
            <a href="createapost.jsp" class="text-decoration-none"><i class="fa-solid fa-plus" style="color: #000000;"></i></a>
        </div>
        <div class="content-container">
            <br>
            <div class="search-container">
                <div class="input-group">
                    <input type="text" class="form-control" value="Center, London">
                    <a href="searchresult.jsp" class="btn btn-primary search" role="button">Search</a>
                </div>
                
            </div>
            <p class="title-text">Embark on a brand new journey through the hidden gems of Center, London!</p>
            <p class="title-text">Press on your favourite post to check it out..</p>
            <hr>
            
            <div class="button-array">
                <a href="searchresult.jsp"><button>All</button></a>
                <a href="#"><button>Landmarks</button></a>
                <a href="#"><button>Museums</button></a>
                <a href="#"><button>CafΓ©</button></a>
                <a href="#"><button>Bars</button></a>
                <a href="#"><button>Restaurants</button></a>
                <a href="#"><button>Parks</button></a>
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
                        <a href="" class="card">
                            <img src="images/natural-history-museum.jpg" class="card-img-top" alt="Post Image 2">
                            <div class="card-body">
                                <p class="card-text">Natural History Museum: where ancient wonders come to life</p>
                            </div>
                        </a>
                    </div> 
                    <div class="col-md-3">
                        <a href=# class="card">
                            <img src="images/London.jpg" class="card-img-top" alt="Post Image 3">
                            <div class="card-body">
                                <p class="card-text">Visited the BigBen, its a must!</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/drinks.jpg" class="card-img-top" alt="Post Image 3">
                            <div class="card-body">
                                <p class="card-text">Sip and savor the London nightlife</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <a href="#" class="card">
                            <img src="images/food.jpg" class="card-img-top" alt="Post Image 1">
                            <div class="card-body">
                                <p class="card-text">A foodie's heaven</p>
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
