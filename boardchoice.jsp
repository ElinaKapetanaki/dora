<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Choose a board</title>
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
            <h1 class="title-text">Choose a board to save your new spot post..</h1>
            <hr>
            <div id="new-board">
                <p>Create a new board</p>
                <div class="search-container">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Choose new board name">
                        <a class="btn btn-primary save" role="submit">Create and Save</a>
                    </div>
                </div>    
                <p>or choose an already existing board from the list down below.</p>
            </div>
            <hr>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card board" style="background-image: url(images/cafe-in-paris.jpg);">
                            <div class="card-body board">
                                <h5 class="card-title">Paris trip</h5>
                                <p class="card-text">Currently contains 4 posts</p>
                                <button class="btn btn-primary" type="button">Save in board</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card board" style="background-image: url(images/trevi-fountain.jpg);">
                            <div class="card-body board">
                                <h5 class="card-title">Rome trip</h5>
                                <p class="card-text">Currently contains 5 posts</p>
                                <button class="btn btn-primary" type="button">Save in board</button>
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
