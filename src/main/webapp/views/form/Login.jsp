<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header/ClassicNavbar.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>

<div class="container my-5">
	<h1>Login</h1>
	<form method="post" action="/login">
	 <c:if test="${msg != null}">
		<div class="alert alert-danger" role="alert">
		  ${msg}
		</div>
	</c:if>
	<c:if test="${errorMsg != null}">
		<div class="alert alert-danger" role="alert">
		  ${errorMsg}
		</div>
	</c:if>
	
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Name</label>
			<input type="text" class="form-control" id="name" required="required" name="username" aria-describedby="emailHelp">
		  </div>
		  <div id="validationServer03Feedback" class="error-msg invalid-feedback" style="display: none">
      Please don't include any special char
    </div>
		  
		  <div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" class="form-control" name="password" required="required" id="exampleInputPassword1">
		  </div>
		  <button type="submit" class="btn btn-success">Submit</button>
		  <br>
		  <a href="/register">Don't have account?</a>
		</form>
		
</div>

<script>
const nameInput = document.getElementById('name');

nameInput.addEventListener('input', function() {
  const nameValue = this.value;
  const specialChars = /^[a-zA-Z0-9 ]*$/;

  if (!specialChars.test(nameValue)) {
    const errorMsg = document.querySelector('.error-msg');
    errorMsg.style.display = 'block';
  } else {
    const errorMsg = document.querySelector('.error-msg');
    errorMsg.style.display = 'none';
  }
});
</script>

<jsp:include page="../footer/ClassicFooter.jsp"></jsp:include> 