<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About Us</title>
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
    }
    .card{
    	background: none;
    	backdrop-filter: blur(40px);
    }
    .card-body{
    text-align: justify;
    }
  </style>
  <body>
    
<jsp:include page="header/Navbar.jsp"></jsp:include>

<div class="container">
  <div class="card p-5 my-5">
    <div class="row g-0">
      <div class="col-md-4 d-flex align-items-center">
        <img src="/images/about.jpg" class="rounded img-fluid" alt="">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">Cars Sales Portal</h5>
          <p class="card-text ">Cars Sales Portal is a leading online platform that specializes in providing a seamless car buying experience to customers. Our platform brings together buyers and sellers of cars, making it easy for people to find their dream car at an affordable price. We are dedicated to ensuring that our customers get the best car deals without having to go through the stress of searching for a car dealer or physically inspecting cars.</p>
          <p class="card-text">At Cars Sales Portal, we have a team of highly skilled professionals who are passionate about providing quality service to our customers. Our customer service team is available 24/7 to attend to any inquiries or issues that customers may have. We are committed to providing a user-friendly interface that allows customers to search for cars based on their preferences, including make, model, year, and price range.</p>
          <p class="card-text">
            We also provide resources and tools to help customers make informed decisions about their car purchase. Our platform includes a car inspection feature that enables customers to inspect the condition of the car before making a purchase. We also provide financing options to customers who require financial assistance to purchase a car.
          </p>
          <p class="card-text">
            In summary, Cars Sales Portal is the go-to platform for anyone looking to buy a car. Our dedication to providing quality service, user-friendly interface, and resources to help customers make informed decisions sets us apart from our competitors.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
	
<jsp:include page="footer/Footer.jsp"></jsp:include> 
