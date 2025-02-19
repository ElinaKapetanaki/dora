<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Business Statistics</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="sidebar">
            <span class="text-logo" style="color: #000000;"> <b>DORA</b></span>
            <a href="businessprofile.jsp" class="text-decoration-none"><i class="fa-regular fa-user " style="color: #000000;"></i></a>
            <a href="businessstats.jsp" class="text-decoration-none active"><i class="fa-solid fa-chart-simple" style="color: #000000;"></i></a>
        </div>
        <div class="content-container">
            <h1 class="center"><b>Business Stats</b></h1>
            <div class="container-fluid">
                <hr>
                <div class="row mt-3 mb-3">
                    <div class="col-md-4">
                        <div class="stats">
                            <div class="circle green">3 &nbsp; <i class="fa-regular fa-face-smile" style="color: #000000;"></i></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stats">
                            <div class="circle orange">1 &nbsp; <i class="fa-regular fa-face-meh" style="color: #000000;"></i></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stats">
                            <div class="circle red">0 &nbsp; <i class="fa-regular fa-face-frown" style="color: #000000;"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <br>
            <div class="container-fluid">
                <div class="row stat">
                    <div class="col-sm-6">
                        <div class="card">
                            <h2 class="title-text">Gender Statistics</h2>
                            <div class="card-body d-flex justify-content-center">
                                <table>
                                    <tr>
                                        <td>Male</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>Female &nbsp;</td>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>Other</td>
                                        <td>1</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <h2 class="title-text">Ethnicity Statistics</h2>
                            <div class="card-body d-flex justify-content-center">
                                <table>
                                    <tr>
                                        <th>Top 4 ethnicities:</th>
                                    </tr>
                                    <tr>
                                        <td>Greek</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>American</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>English</td>
                                        <td>1</td>
                                    </tr>
                                    <tr>
                                        <td>Other</td>
                                        <td>1</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row stat">
                    <div class="col-sm-6">
                        <div class="card">
                            <h2 class="title-text">Page view and post saves</h2>
                            <div class="card-body d-flex justify-content-center">
                                <div class="views-saves">
                                    <br>
                                    <p id="views">Total Views: 503</p>
                                    <br>
                                    <p id="saves">Total Saves: 222</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <h2 class="title-text">Age Statistics</h2>
                            <div class="card-body d-flex justify-content-center">
                                <div class="chart">
                                    <div class="bar" style="height: 70px;">Ages <br> 16-25</div>
                                    <div class="bar" style="height: 130px;">Ages <br> 25-40</div>
                                    <div class="bar" style="height: 200px;">Ages <br> 40-70</div>  
                                    <div class="bar" style="height: 240px;">Ages <br> 70-over</div>
                                </div>
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
