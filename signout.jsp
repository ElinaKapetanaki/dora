<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Sign-Out</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
	<meta http-equiv="refresh" content="3;url=login.jsp" />
	</head>
<body>	

	<div class="container theme-showcase" role="main">

		<div class="alert alert-success text-center" role="alert">You have successfully signed-out of Dora</div>		

	</div>
</body>
</html>
