<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="index.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body class="d-flex justify-content-center align-items-center flex-column">
	<h2 class="mt-5">Login</h2>
	<form method="post" action="login" name="flogin" style="width: 500px">
		<div class="mb-3">
		  <label class="form-label">Username</label>
		  <input type="text" class="form-control" name="username" placeholder="username">
		</div>
		<div class="mb-3">
			<label  class="form-label">Password</label>
			<input type="password" name="password" class="form-control"	>
		</div>
		<input type="submit" value="login" class="btn btn-primary" style="width: 100%">
	</form>
	<a class="mt-3">Register</a>
</body>
</html>