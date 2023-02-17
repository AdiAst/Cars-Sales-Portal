<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

 <div class="container my-5">
     <h2 class="text-center mb-5">Car Form</h2>
     <form class="form" method="post" modelAttribute="car" action="" enctype="multipart/form-data">
	
	  <div class="form-group">
	    <label for="name">Name:</label>
	    <input type="text" id="name" name="name" value="${car.getName() }" class="form-control">
	  </div>
	  <div class="form-group">
	    <label for="make">Make:</label>
	    <input type="text" id="make" name="make" value="${car.getMake() }" class="form-control">
	  </div>
	  <div class="form-group">
	    <label for="model">Model:</label>
	    <input type="text" id="model" name="model" value="${car.getModel() }" class="form-control">
	  </div>
	  <div class="form-group">
	    <label for="price">Price:</label>
	    <input type="number" id="price" name="price" value="${car.getPrice() }" class="form-control">
	  </div>
	  <div class="form-group">
	    <label for="year">Year:</label>
	    <input type="number" id="year" name="year" value="${car.getYear() }" class="form-control">
	  </div>
	  <c:if test="${bid}">
	  <div class="form-group">
	    <label for="biddingDate">Bidding Date:</label>
	    <input type="date" id="biddingDate" name="biddingDate" class="form-control">
	  </div>
	  </c:if>
	  <div class="form-group">
	    <label for="image">Image:</label>
	    <input type="file" id="image" name="imagess"  class="form-control">
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>
    
<jsp:include page="../footer/ClassicFooter.jsp"></jsp:include> 