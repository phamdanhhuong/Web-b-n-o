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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a class="nav-link" href="#">Theo giỏi đơn hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/WebBanAo">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container d-flex flex-wrap gap-3 p-3 mt-5">
        <div style="width: 60%; min-height: 1000px;">
            <div class="d-flex justify-content-between align-items-end">
                <span class="fs-4 text fw-bold">Giỏ hàng:</span>
                <span class="fs-5 text">Số sản phẩm: ${quantity}</span>
            </div>
            <c:forEach var="item" items="${list}">
            	<div class="d-flex mt-5">
	                <img style="width: auto; height: 200px;"
	                    src="${item.shirt.link}">
	                <div>
	                    <p class="text fw-medium fs-5">${item.shirt.ten}</p>                   
	                    <form action="/WebBanAo/cart" method="post">
	                    	<p class="text fw-medium fs-6">
								<select class="form-select" id="combo-box" name="size-option" style="width: 150px">
								    <option value="S" ${item.cart.size == 'S' ? 'selected' : ''}>S</option>
								    <option value="M" ${item.cart.size == 'M' ? 'selected' : ''}>M</option>
								    <option value="L" ${item.cart.size == 'L' ? 'selected' : ''}>L</option>
								    <option value="XL" ${item.cart.size == 'XL' ? 'selected' : ''}>XL</option>
								</select>
	                    	</p>
	                        <h5 class="mt-3">Số lượng:</h5>
	                        <div class="d-flex gap-5">
	                        	<div class="d-flex border border-4 rounded-pill" style="width: 150px;">
		                            <button type="button" onclick="decrease(${item.cart.id})"
		                                class="btn btn-light border border-0 rounded-start-pill">-</button>
		                            <input type="text" id="quantity${item.cart.id}" name="quantity" value="${item.cart.quantity}" class="form-control text-center border border-0"
		                                readonly>
		                            <button type="button" onclick="increase(${item.cart.id})"
		                                class="btn btn-light border border-0 rounded-end-circle">+</button>
		                        </div>
		                        <input type="hidden" name="_method" value="put">
		                        <input type="hidden" name="idCart" value="${item.cart.id}">
		                        <input type="submit" class="btn btn-primary mt-3 align-self-end" value="Save">
	                        </div>
	                    </form>
	                </div>
	                <form class="mx-5" action="/WebBanAo/cart" method="post">
	                    <input type="hidden" name="_method" value="delete">
	                    <input type="hidden" name="idCart" value="${item.cart.id}">
	                    <input type="submit" class="text fs-5 fw-bold btn btn-warning align-self-start" value="Xóa">
	                </form>
	            </div>
            </c:forEach>
        </div>
        <div></div>
    </div>
    <footer>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
        <ul>
            <li><a href="#privacy">Privacy Policy</a></li>
            <li><a href="#terms">Terms of Service</a></li>
        </ul>
    </footer>
    <script>
        function decrease(id) {
            var quantityInput = document.getElementById('quantity'+id);
            var currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        }

        function increase(id) {
            var quantityInput = document.getElementById('quantity'+id);
            var currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        }
    </script>
</body>

</html>