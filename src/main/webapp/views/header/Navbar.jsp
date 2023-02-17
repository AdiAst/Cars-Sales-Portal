<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    

<div class="container-fluid">
    <div class="row p-4 d-flex align-items-center">
        <div class="col-5"><a href="home" class="text-decoration-none text-white fs-3 fw-bold">Car Sales Portal</a></div>
        <div class="col-3">
            <form action="search">
                <div class="input-group">
                    <input type="text" class="form-control" name="search" placeholder="Model, Year" aria-describedby="button-addon2">
                    <button class="btn btn-outline-danger text-white border-2 border-white fw-bold" type="submit" id="button-addon2">Search</button>
                  </div>
            </form>
        </div>
        <div class="col"><a href="carlist" class="text-decoration-none text-white fs-5 fw-bold btn btn-outline-danger border-0">Car List</a></div>
        <div class="col"><a href="about" class="text-decoration-none text-white fs-5 fw-bold btn btn-outline-danger border-0">About Us</a></div>
        <div class="col"><a href="contact" class="text-decoration-none text-white fs-6 fw-bold btn btn-outline-danger border-0">Contact Us</a></div>
        <% 
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && !authentication.getName().equals("anonymousUser")) { %>
		  	<div class="col dropdown">
			  <button class="text-white fw-bold btn btn-outline-danger border-0 dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <%= authentication.getName() %>
			  </button>
			  <ul class="dropdown-menu dropdown-menu-dark">
			    <li><a class="dropdown-item" href="profile">Profile</a></li>
			    <li><a class="dropdown-item" href="store">My Store</a></li>
			    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
			 	 <li>
	              <a class="dropdown-item" href="list-of-user">Administrator Panel</a>
	            </li>
				</sec:authorize>
			    <li><a class="dropdown-item" href="logout">Log Out</a></li>
			  </ul>
			</div>
		<% } else{ %>
        	<div class="col"><a href="login" class="text-decoration-none text-white fs-5 fw-bold btn btn-outline-success border-0">Login</a></div>
		<% } %>
    </div>
    
</div>