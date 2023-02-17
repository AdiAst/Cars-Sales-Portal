<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car Sales Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  <style>
    body{
        background-image: url(/images/background.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        height: 100vh;
        color: white;
        overflow: hidden;
    }
    .home-quote{
        width: fit-content;
        padding:30px 100px 30px 300px;
        border-radius: 5px;
        margin-top: 150px;
        backdrop-filter: blur(20px);
    }
    .home-quote span{
        display: block;
        font-size: 48px;
    }
  </style>
  <body>
   
   <jsp:include page="header/Navbar.jsp"></jsp:include> 


	<div class="row">
	    <div class="col">
	        <div class="home-quote fw-bold">
	            <span class="text-danger fs-1">SALE YOUR CAR</span>
	            <span>GET A NEW CAR</span>
	        </div>
	    </div>
	</div>

	<jsp:include page="footer/Footer.jsp"></jsp:include> 