<jsp:include page="../header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container my-5">
	<h1>Edit Profile</h1>
	<form modelAttribute="user" method="post" action="process-edit-user">
	<input type="hidden" name="id" value="${user.getId()}">
	<input type="hidden" name="role" value="${user.getRole()}">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Name</label>
			<input type="text" class="form-control" id="exampleInputEmail1" value="${user.getName()}" name="name" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email address</label>
			<input type="email" class="form-control" id="exampleInputEmail1" name="email" value="${user.getEmail()}" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" class="form-control" name="password" id="exampleInputPassword1">
		  </div>
		  <button type="submit" class="btn btn-success">Submit</button>
		</form>
</div>

<jsp:include page="../footer/ClassicFooter.jsp"></jsp:include> 