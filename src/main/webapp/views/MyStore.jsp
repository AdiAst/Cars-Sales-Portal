<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container">
	<h1 class="mt-5">My Store</h1>
	<a class="btn btn-success" href="sale-car">Sale a Car</a>
	<a class="btn btn-primary" href="sale-bid-car">Sale a Bid Car</a>
	<hr>
<c:forEach items="${cars}" var="car">	
<div class="card mb-3" >
  <div class="row g-0">
    <div class="col-md-4">
      <img src="${car.getPhotosImagePath() }" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
     <div class="card-body">
          <h5 class="card-title">${car.name}</h5>
          <p class="card-text">Price: $${car.price}</p>
          <c:if test="${car.biddingDate != null }">
          <p class="card-text">End Of Bidding: ${car.biddingDate}</p>
          </c:if>
          <a href="car-detail?id=${car.id}" class="btn btn-primary">View Details</a>
        </div>
    </div>
  </div>
</div>
</c:forEach>
</div>

<jsp:include page="footer/ClassicFooter.jsp"></jsp:include> 