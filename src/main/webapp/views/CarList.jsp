<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-dark">
    <div class="col-md-5 p-lg-5 mx-auto my-5 ">
      <h1 class="display-4 fw-normal text-white">Post Your Old Car</h1>
      <p class="lead fw-normal text-white">And an even wittier subheading to boot. Jumpstart your marketing efforts with this example based on Apple’s marketing pages.</p>
      <a class="btn btn-outline-success fw-bold" href="sale-car">Post Now</a>
      <a class="btn btn-outline-danger fw-bold" href="auction-hall">Go to Auction Hall</a>
    </div>
</div>
<h1 class="text-center mt-5 mb-3">Car List</h1>
<div class="container-fluid d-flex flex-wrap">
<c:forEach items="${cars}" var="car">
    <div class="col-md-4">
      <div class="card m-3">
        <img src="${car.getPhotosImagePath() }" width="auto" height="300px" class="card-img-top" alt="${car.name}">
        <div class="card-body">
          <h5 class="card-title">${car.name} | Posted By: ${car.postedBy}</h5>
          <p class="card-text">Price: $${car.price}</p>
          <a href="car-detail?id=${car.id}" class="btn btn-primary">View Details</a>
        </div>
      </div>
    </div>
  </c:forEach>
</div>


<jsp:include page="footer/ClassicFooter.jsp"></jsp:include> 