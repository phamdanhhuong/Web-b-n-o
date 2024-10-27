<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="home">Shop</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item me-5">
            <form class="d-flex">
	          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	          <button class="btn btn-outline-light" type="submit">Search</button>
	        </form>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/WebBanAo/cart">Giỏ hàng</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Theo giỏi đơn hàng</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/WebBanAo">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	
	<div class="container d-flex flex-wrap gap-3 p-3">
      <c:forEach var="item" items="${list}">
      	<div class="card" style="width: 18rem;">
		<a href="/WebBanAo/product?id=${item.id}">
			<img src="${item.link}" class="card-img-top">
		</a>
		<div class="card-body">
		    <p class="card-text">${item.loai}</p>
		    <h5 class="card-title">${item.ten}</h5>
		    <h5 class="card-title text-info">${item.gia} VND</h5>
		    <div>
		    	<form action="">
		    		<input type="hidden" name="id" value=">${item.id}">
		    		<input type="submit" class="btn btn-primary" value="Mua ngay">
		    	</form>
		    	<form action="/WebBanAo/cart" class="mt-3" method="post">
		    		<input type="hidden" name="id" value="${item.id}">
		    		<input type="hidden" value="post" name="_method">
		    		<input type="submit" class="btn btn-warning" value="Thêm vào giỏ hàng">
		    	</form>
		    </div>
		</div>
	    </div>
      </c:forEach>
	</div>
	<footer>
	    <p>&copy; 2024 Your Company. All rights reserved.</p>
	    <ul>
	      <li><a href="#privacy">Privacy Policy</a></li>
	      <li><a href="#terms">Terms of Service</a></li>
	    </ul>
	</footer>
</body>
</html>