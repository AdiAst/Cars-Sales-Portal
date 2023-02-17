<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact Us</title>
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
        <p>
          Email   : CarsSalesPortal@gmail.com <br>
          Phone   : +62 1111 3111 111 <br>
          Meet Us : Ponegoro Street no.21, South Denpasar, Bali. <br>
        </p>
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <form>
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email address :</label>
              <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
              <label for="exampleFormControlTextarea1" class="form-label">Message :</label>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <button type="submit" class="btn px-5 btn-success text-white fw-bold">SEND</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer/Footer.jsp"></jsp:include> 