<jsp:include page="../header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container my-5">
	<h1>Register New User</h1>
	<form modelAttribute="user" method="post" action="process-register">

		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Name</label>
			<input type="text" class="form-control" id="exampleInputEmail1" required="required" name="name" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email address</label>
			<input type="email" class="form-control" id="exampleInputEmail1" required="required" name="email" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" class="form-control" name="password" required="required" id="exampleInputPassword1">
		  </div>
		  <button type="submit" class="btn btn-success">Submit</button>
		  <br>
		  <a href="/login">have account?</a>
		</form>
</div>

<jsp:include page="../footer/ClassicFooter.jsp"></jsp:include> 