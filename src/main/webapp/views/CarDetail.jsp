<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container my-5">
	<h1 class="text-center">Car Detail</h1>
	<hr>
	<div class="row">
		<div class="col">
			<img src="${car.getPhotosImagePath() }" width="500px" alt="">
		</div>
		<div class="col">
			<div class="card text-bg-dark mb-3" >
				<div class="card-header">Saler :${car.getPostedBy()}</div>
				<div class="card-body">
					<h3 class="card-title">${car.getName()}</h3>
					<h5 class="card-text">$${car.getPrice()}</h5>
					<p class="card-text">Make :${car.getMake()} | Model :${car.getModel()} | Year :${car.getYear()}</p>
					<c:if test="${car.biddingDate != null }">
			          <p class="card-text">End Of Bidding: ${car.biddingDate}</p>
			          <a class="btn btn-danger" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Bid on This Car</a>
			        	<div class="collapse" id="collapseExample">
						  <div class="card card-body mt-3">
						    <form action="bid" method="post">
						    <input type="hidden" value="${car.getId() }" name="car-id">
			            <div class="input-group mb-3">
			              <span class="input-group-text">$</span>
			              <input type="number" class="form-control" name="amount" aria-label="Amount (to the nearest dollar)">
			              <span class="input-group-text">.00</span>
			            </div>
			            <button type="submit" class="btn btn-outline-danger">Bid</button>
			          </form>
					</div>
					<hr>
					<h3>Bid List</h3>
					<table class="table table-hover bg-light">
					    <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Price</th>
						      <th scope="col">By</th>
						    </tr>
						  </thead>
						  <c:forEach items="${bids }" var="bid">						  
						  <tbody>
						    <tr>
						      <th scope="row">${bid.id }</th>
						      <td>${bid.price }</td>
						      <td>${bid.name }</td>
						    </tr>
						    
						  </tbody>
						  </c:forEach>
					</table>
			        </c:if>
			        <c:if test="${car.biddingDate == null }">			          
						<a href="#" class="btn btn-success">Buy this Car</a>
			        </c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer/ClassicFooter.jsp"></jsp:include>