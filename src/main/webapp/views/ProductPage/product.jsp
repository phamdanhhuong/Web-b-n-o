<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">    
    <link href="views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
    <title>Insert title here</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	    <div class="container-fluid">
	        <a class="navbar-brand" href="home">
	            <i class="fas fa-store"></i> Shop
	        </a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
	            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNav">
	            <ul class="navbar-nav ms-auto">
	                <li class="nav-item me-5">
	                    <form class="d-flex">
	                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	                        <button class="btn btn-outline-light" type="submit">
	                            <i class="fas fa-search"></i>
	                        </button>
	                    </form>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link active" aria-current="page" href="home">
	                        <i class="fas fa-home"></i> Home
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">
	                        <i class="fas fa-shopping-cart"></i> Giỏ hàng
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="#">
	                        <i class="fas fa-box"></i> Theo dõi đơn hàng
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/WebBanAo">
	                        <i class="fas fa-sign-out-alt"></i> Logout
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>

    <div class="container d-flex flex-wrap gap-3 p-3 mt-5">
        <div class="d-flex">
            <img style="height: 700px; width: auto;"
                src="${item.link}">
            <div>
                <h3>${item.ten}</h3>
                <h4 class="text-primary">${item.gia} VND</h4>
                <form class="mt-5" id="productForm" method="post">
                    <h5>Chọn size:</h5>
                    <input type="radio" class="btn-check" name="size-option" id="size-s" value="S" autocomplete="off"
                        checked>
                    <label class="btn btn-outline-secondary fs-5 text" for="size-s">S</label>

                    <input type="radio" class="btn-check" name="size-option" id="size-m" value="M" autocomplete="off">
                    <label class="btn btn-outline-secondary fs-5 text" for="size-m">M</label>

                    <input type="radio" class="btn-check" name="size-option" id="size-l" value="L" autocomplete="off">
                    <label class="btn btn-outline-secondary fs-5 text" for="size-l">L</label>

                    <input type="radio" class="btn-check" name="size-option" id="size-xl" value="XL" autocomplete="off">
                    <label class="btn btn-outline-secondary fs-5 text" for="size-xl">XL</label>
                    <h5 class="mt-5">Số lượng:</h5>
                    <div class="d-flex border border-3 rounded-pill" style="width: 150px;">
                        <button type="button" onclick="decrease()"
                            class="btn btn-light border border-0 rounded-start-pill">-</button>
                        <input type="text" name="quantity" id="quantity" value="1" class="form-control text-center border border-0"
                            readonly>
                        <button type="button" onclick="increase()"
                            class="btn btn-light border border-0 rounded-end-circle">+</button>
                    </div>
                    <input type="hidden" value="${item.id}" name="id">
                    <input type="hidden" value="post" name="_method">
                    <div class="d-flex flex-column gap-3 mt-5">
                        <input type="submit" class="btn btn-primary" onclick="setAction('buy')" value="Mua ngay">
                        <input type="submit" class="btn btn-outline-primary" onclick="setAction('add-to-cart')"
                            value="Thêm vào giỏ hàng">
                    </div>
                </form>
            </div>
        </div>
        <div>
            <h3>Mô tả</h3>
            <p class="lh-1 fs-5 text">
                ${item.mota}
            </p>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
        <ul>
            <li><a href="#privacy">Privacy Policy</a></li>
            <li><a href="#terms">Terms of Service</a></li>
        </ul>
    </footer>
    <script>
        function setAction(actionType) {
            var form = document.getElementById('productForm');
            if (actionType === 'buy') {
                form.action = '';
            } else if (actionType === 'add-to-cart') {
                form.action = '/WebBanAo/cart';
            }
        }
        function decrease() {
            var quantityInput = document.getElementById('quantity');
            var currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        }

        function increase() {
            var quantityInput = document.getElementById('quantity');
            var currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        }
    </script>
</body>

</html>