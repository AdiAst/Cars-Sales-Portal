<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix = "x"  uri = "http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>${title}</title>
	
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/product/">

    

    

<link href="/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/css/product.css" rel="stylesheet">
  </head>
  <body>
    
    <nav class="navbar navbar-expand-lg bg-dark">
      <div class="container">
        <a class="navbar-brand text-white" href="home">Car Sales Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
              <a class="nav-link text-white active" aria-current="page" href="carlist">Car List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" aria-current="page" href="about">About Us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" aria-current="page" href="contact">Contact Us</a>
            </li>
           
            <% 
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null && !authentication.getName().equals("anonymousUser")) { %>
	  	 <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle text-white" href="profile" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <%= authentication.getName() %>
              </a>
              <ul class="dropdown-menu">
             	<li><a class="dropdown-item " href="profile">Profile</a></li>
                <li><a class="dropdown-item " href="store">My Store</a></li>
                <sec:authorize access="hasAuthority('ROLE_ADMIN')">
			 	 <li>
	              <a class="dropdown-item" href="list-of-user">Administrator Panel</a>
	            </li>
				</sec:authorize>
                <li><a class="dropdown-item text-danger" href="logout">Log Out</a></li>
                
              </ul>
            </li>
          
	<% } else{ %>
       <li class="nav-item">
              <a class="nav-link text-white" aria-current="page" href="login">Login</a>
            </li>
	<% } %>
           
          </ul>
          <form class="d-flex" role="search" action="search">
            <input class="form-control me-2" type="text" name="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>