<jsp:include page="header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container my-5">
	<h1>User Profile</h1>
	<div class="card w-100">
		<div class="card-body">
			<h5 class="card-title">${user.get().getName()}</h5>
			<p class="card-text">${user.get().getEmail()}</p>
			<a href="edit-profile?name=${user.get().getName()}" class="btn btn-success">Edit Profile</a>
		</div>
	</div>
</div>

<jsp:include page="footer/ClassicFooter.jsp"></jsp:include> 