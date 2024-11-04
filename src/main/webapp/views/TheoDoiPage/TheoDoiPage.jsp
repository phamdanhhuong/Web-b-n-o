<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">  
<link href="./views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


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
	                    <a class="nav-link" href="/WebBanAo/cart">
	                        <i class="fas fa-shopping-cart"></i> Giỏ hàng
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

	<div class="container d-flex gap-3 p-3" style="min-height: 1000px">
	    <div class="bg-light">

			<div class="container my-4">
			  <h3>Đã giao</h3>
			  
			  <!-- First Order Card -->
			  <div class="order-card">
			    <div class="d-flex justify-content-between align-items-center">
			      <div>
			        <span class="mall-badge">Mall</span>
			        <strong>Brushie Chính Hãng</strong>
			      </div>
			      <span class="status-text">Hoàn thành</span>
			    </div>
			    <div class="d-flex mt-3">
			      <img src="path/to/brushie-image.jpg" alt="Bàn chải điện Brushie" class="img-thumbnail mr-3" style="width: 100px;">
			      <div>
			        <p>Bàn chải điện Brushie tích hợp máy rửa mặt</p>
			        <small>Đen Mistery (box)</small>
			        <p class="text-muted mt-1">₫1.130.000 <del>₫696.000</del></p>
			        <p class="total-price">Tổng số tiền (1 sản phẩm): ₫577.280</p>
			      </div>
			    </div>
			    <div class="mt-3">
			      <button class="btn btn-outline-secondary btn-sm">Xem đánh giá</button>
			      <button class="btn btn-outline-danger btn-sm">Mua lại</button>
			    </div>
			  </div>
			
			  <!-- Second Order Card -->
			  <div class="order-card">
			    <div class="d-flex justify-content-between align-items-center">
			      <div>
			        <span class="mall-badge">Mall</span>
			        <strong>SOUNDPEATS OFFICIAL STORE</strong>
			      </div>
			      <span class="status-text">Hoàn thành</span>
			    </div>
			    <div class="d-flex mt-3">
			      <img src="path/to/soundpeats-image.jpg" alt="Tai nghe SOUNDPEATS" class="img-thumbnail mr-3" style="width: 100px;">
			      <div>
			        <p>Tai nghe True Wireless SoundPEATS Capsule3 Pro</p>
			        <small>Đen</small>
			        <p class="text-muted mt-1">₫1.690.000 <del>₫953.000</del></p>
			        <p class="total-price">Tổng số tiền (1 sản phẩm): ₫778.000</p>
			      </div>
			    </div>
			    <div class="mt-3">
			      <button class="btn btn-outline-secondary btn-sm">Xem đánh giá</button>
			      <button class="btn btn-outline-danger btn-sm">Mua lại</button>
			    </div>
			  </div>
			  </div>
			</div>
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