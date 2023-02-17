<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container mt-5">
<ul class="nav nav-tabs d-none d-lg-flex" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">User Table</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Car Table</button>
  </li>
</ul>
<div class="tab-content accordion" id="myTabContent">
  <div class="tab-pane fade show active accordion-item" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">

    <h2 class="accordion-header d-lg-none" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Accordion Item #1</button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show  d-lg-block" aria-labelledby="headingOne" data-bs-parent="#myTabContent">
      <div class="accordion-body">
     <h1 >List of Users</h1>
	<hr>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${users}" var="user">
	    <tr>
	      <th scope="row">${user.getId()}</th>
	      <td>${user.getName()}</td>
	      <td>${user.getEmail()} </td>
	      <td>
	      <a class="btn btn-primary" href="edit-profile?name=${user.getName() }" role="button">Update Profile</a>
	      <a class="btn btn-warning" href="delete-user?id=${user.getId() }"  role="button">Delete User</a>
	      <c:if test="${user.getRole() == 'ROLE_ADMIN' }">
	       <a class="btn btn-secondary" href="#" role="button">Is an Administrator</a>
	      </c:if>
	      <c:if test="${user.getRole() == 'ROLE_USER' }">
	       <a class="btn btn-danger" href="grand-authorities?name=${user.getName()}" role="button">Turn to Administrator</a>
	      </c:if>
	      </td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
      </div>
    </div>

  </div>
  <div class="tab-pane fade accordion-item" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
    <h2 class="accordion-header d-lg-none" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse d-lg-block" aria-labelledby="headingTwo" data-bs-parent="#myTabContent">
      <div class="accordion-body">
        <h1 >List of Users</h1>
	<hr>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Image</th>
	      <th scope="col">Name</th>
	      <th scope="col">Make</th>
	      <th scope="col">Model</th>
	      <th scope="col">Year</th>
	      <th scope="col">Bidding Date</th>
	      <th scope="col">Price</th>
	      <th scope="col">Posted By</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${cars}" var="car">
	    <tr>
	      <th scope="row">${car.getId()}</th>
	      <td><img alt="${car.getName()}" width="200px" src="${car.getPhotosImagePath() }"></td>
	      <td>${car.getName()}</td>
	      <td>${car.getMake()} </td>
	      <td>${car.getModel()} </td>
	      <td>${car.getYear()} </td>
	      <td>${car.getBiddingDate()} </td>
	      <td>${car.getPrice()} </td>
	      <td>${car.getPostedBy()} </td>
	      <td>
	      <a class="btn btn-primary m-3" href="edit-car/${car.getId() }" role="button">Update Car</a>
	      <a class="btn btn-warning m-3" href="delete-car?id=${car.getId() }"  role="button">Delete Car</a>
	      </td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
      </div>
    </div>
  </div>
  
</div>
	
</div>


<jsp:include page="footer/ClassicFooter.jsp"></jsp:include> 