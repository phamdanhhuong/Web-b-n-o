<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


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

    <div class="navbar-filter">
        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom">
            <div class="container">
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mx-auto">
                      <li class="nav-item"><a class="nav-link" href="#">Sản Phẩm Mới <span class="text-danger">New</span></a></li>
                      <li class="nav-item"><a class="nav-link" href="#">SALE</a></li>
                      <li class="nav-item"><a class="nav-link" href="#">Thời Trang</a></li>
                      <li class="nav-item"><a class="nav-link" href="#">Công Sở</a></li>
                      <li class="nav-item"><a class="nav-link" href="#">Áo Khoác</a></li>
                      <li class="nav-item"><a class="nav-link" href="#">Thể Thao</a></li>
                      <li class="nav-item"><a class="nav-link" href="#">Bộ Sưu Tập</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="container d-flex gap-3 p-3">
        <div class="col-4">
          <div class="filter">
              <h2>Bộ lọc</h2>
              <div class="category">
                <h5>Danh mục sản phẩm</h5>
                <ul>
                  <li><a href="#">Sản phẩm mới</a></li>
                  <li><a href="#">Sale</a></li>
                  <li><a href="#">Áo nam</a></li>
                  <li><a href="#">Quần nam</a></li>
                  <li><a href="#">Bộ sưu tập</a></li>
                  <li><a href="#">Hệ thống cửa hàng</a></li>
                </ul>
              </div>
              <div class="price-range">
                <h5>Khoảng giá</h5>
                <input type="range" min="0" max="3000000" value="1500000" step="10000" class="form-range">
                <div class="price-label">
                  <span>0đ</span> - <span>3,000,000đ</span>
                </div>
              </div>
              <div class="color">
                <h5>Màu sắc</h5>
                <!-- Add color options as needed -->
              </div>
              <div class="size">
                <h5>Size</h5>
                <div class="btn-group" role="group">
                  <button type="button" class="btn btn-outline-secondary">S</button>
                  <button type="button" class="btn btn-outline-secondary">M</button>
                  <button type="button" class="btn btn-outline-secondary">L</button>
                  <button type="button" class="btn btn-outline-secondary">XL</button>
                  <button type="button" class="btn btn-outline-secondary">XXL</button>
                  <button type="button" class="btn btn-outline-secondary">36</button>
                  <button type="button" class="btn btn-outline-secondary">37</button>
                  <button type="button" class="btn btn-outline-secondary">38</button>
                  <button type="button" class="btn btn-outline-secondary">39</button>
                </div>
              </div>
            </div>
        </div>
        <div class="col-8">
          <div class="row">
            <div class="col-12" style="height: 3vh;">
              <div class="dropdown">
                  <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                      Tên: A-Z
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <li><a class="dropdown-item" href="#">Sản phẩm nổi bật</a></li>
                      <li><a class="dropdown-item" href="#">Giá: Tăng dần</a></li>
                      <li><a class="dropdown-item" href="#">Giá: Giảm dần</a></li>
                      <li><a class="dropdown-item" href="#">Tên: A-Z</a></li>
                      <li><a class="dropdown-item" href="#">Tên: Z-A</a></li>
                      <li><a class="dropdown-item" href="#">Cũ nhất</a></li>
                      <li><a class="dropdown-item" href="#">Mới nhất</a></li>
                      <li><a class="dropdown-item" href="#">Bán chạy nhất</a></li>
                      <li><a class="dropdown-item" href="#">Tồn kho giảm dần</a></li>
                  </ul>
              </div>
            </div>
          </div>   
          <div class="col-12" style="height: 75vh; overflow-y: auto;">
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
                                <input type="hidden" name="id" value="${item.id}">
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