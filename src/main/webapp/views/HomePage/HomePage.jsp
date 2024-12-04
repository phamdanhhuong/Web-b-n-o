<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">    
<link href="./views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	#toast_ {
  position: fixed;
  top: 32px;
  right: 32px;
  z-index: 999999;
}

.toast_ {
  display: flex;
  align-items: center;
  background-color: #fff;
  border-radius: 2px;
  padding: 20px 0;
  min-width: 400px;
  max-width: 450px;
  border-left: 4px solid;
  box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
  transition: all linear 0.3s;
}

@keyframes slideInLeft {
  from {
    opacity: 0;
    transform: translateX(calc(100% + 32px));
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes fadeOut {
  to {
    opacity: 0;
  }
}

.toast--success {
  border-color: #47d864;
}

.toast--success .toast__icon {
  color: #47d864;
}

.toast--info {
  border-color: #2f86eb;
}

.toast--info .toast__icon {
  color: #2f86eb;
}

.toast--warning {
  border-color: #ffc021;
}

.toast--warning .toast__icon {
  color: #ffc021;
}

.toast--error {
  border-color: #ff623d;
}

.toast--error .toast__icon {
  color: #ff623d;
}

.toast_ + .toast_ {
  margin-top: 24px;
}

.toast__icon {
  font-size: 24px;
}

.toast__icon,
.toast__close {
  padding: 0 16px;
}

.toast__body {
  flex-grow: 1;
}

.toast__title {
  font-size: 16px;
  font-weight: 600;
  color: #333;
}

.toast__msg {
  font-size: 14px;
  color: #888;
  margin-top: 6px;
  line-height: 1.5;
}

.toast__close {
  font-size: 20px;
  color: rgba(0, 0, 0, 0.3);
  cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="toast_"></div>
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
	                	<div class="d-flex">
	                        <input class="form-control me-2" type="text" name="searchText" id="searchText" placeholder="Search" aria-label="Search" value="${searchText == null ? '' : searchText}">
	                        <button class="btn btn-outline-light" onclick="document.getElementById('formLoc').submit();">
	                            <i class="fas fa-search"></i>
	                        </button>
                        </div>
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
	                    <a class="nav-link" href="/WebBanAo/theodoi">
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
        <div class="col-3">
		    <form action="/WebBanAo/home" method="get" id="formLoc">
		        <div class="filter p-4 bg-light border rounded shadow-sm">
		            <h2 class="text-center mb-4 font-weight-bold">Bộ lọc</h2>
		
		            <div class="category mb-4">
		                <h5 class="mb-3">Danh mục sản phẩm</h5>
		                <ul class="list-unstyled">
		                    <li><input class="form-check-input" type="radio" name="loc-alphabet" value="asc" id="" <c:if test="${alphabet == null || alphabet == 'asc'}">checked</c:if>> A-Z</li>
		                    <li><input class="form-check-input" type="radio" name="loc-alphabet" value="desc" id="" <c:if test="${alphabet != null && alphabet == 'desc'}">checked</c:if>> Z-A</li>
		                    <li><input class="form-check-input" type="radio" name="loc-price" value="asc" id="" <c:if test="${price == null || price == 'asc'}">checked</c:if>> Giá tăng dần</li>
		                    <li><input class="form-check-input" type="radio" name="loc-price" value="desc" id="" <c:if test="${price != null && price == 'desc'}">checked</c:if>> Giá giảm dần</li>
		                </ul>
		            </div>
		
		            <h5 class="mb-3">Loại áo</h5>
		            <select class="form-select mb-4" id="combo-box" name="loc-loai" style="width: 100%; padding: 10px; border-radius: 8px;">
		                <option value="" <c:if test="${loai == null || loai == ''}">selected</c:if>>Tất cả</option>
		                <c:forEach var="itemLoai" items="${dsLoai}">
		                    <option value="${itemLoai}" <c:if test="${loai != null && loai == itemLoai}">selected</c:if>>${itemLoai}</option>
		                </c:forEach>
		            </select>
		
		            <div class="price-range mb-4">
		                <h5 class="mb-3">Khoảng giá</h5>
						<div style="display: flex; justify-content: space-between; width: 100%;">
						    <span>Từ </span>
						    <span style="font-weight: bold;">0đ</span> <!-- Nổi bật 0 -->
						    <span> đến </span>
						    <span id="priceLabel" style="font-weight: bold;">${range == null ? 1500000 : range}đ</span>
						</div>
		
		
		
		                <input type="range" min="0" max="3000000" value="${range == null ? 1500000 : range}" step="10000" name="loc-range" class="form-range" oninput="updatePriceLabel(this.value)" style="width: 100%;">
		            </div>
		
		            <div class="color mb-4">
		                <h5 class="mb-3">Màu sắc</h5>
		                <div class="form-check d-flex flex-column">
		                    <div class="d-flex align-items-center gap-3 mb-2">
		                        <input class="form-check-input" type="radio" name="loc-color" value="" id="" <c:if test="${color == null || color == ''}">checked</c:if>>
		                        <span>Tất cả</span>
		                    </div>
		                    <div class="d-flex gap-5 flex-wrap">
							    <c:forEach var="mau" items="${dsMau}">
							        <div class="d-flex align-items-center gap-3 mb-2">
							            <input class="form-check-input" type="radio" name="loc-color" value="${mau}" id="" <c:if test="${color != null && color == mau}">checked</c:if>>
							            <div class="color-options d-flex gap-2">
							                <span class="color-circle" style="background-color: ${mau}; width: 20px; height: 20px; border-radius: 50%;"></span>
							            </div>
							        </div>
							    </c:forEach>
							</div>
		                </div>
		            </div>
		
		            <input id="result" value="${searchText == null ? '' : searchText}" type="hidden" name="loc-searchText">
		            <button class="btn btn-primary mt-3 w-100" type="submit"><i class="fa-solid fa-filter"></i> Lọc</button>
		        </div>
		    </form>
		</div>

        <div class="col-9">
          <div class="row">
            <div class="col-12" style="height: 3vh;">
            </div>
          </div>   
          <c:if test="${empty list}">
		    <div class="alert alert-info text-center p-5 rounded shadow" 
		         style="font-family: 'Avenir', sans-serif; height: 80vh; background-color: #f0f8ff; 
		                display: flex; align-items: center; justify-content: center;">
		        <div class="text-center">
		            <div class="d-flex justify-content-center">
		                <i class="bi bi-cart-x text-warning fs-1" style="animation: shake 0.5s infinite;"></i>
		            </div>
		            <p class="fw-bold fs-4 mt-3 text-primary" style="font-size: 1.8rem;">Không có sản phẩm nào trong cửa hàng! <span class="text-danger">🛒</span></p>
		            <p class="text-muted" style="font-size: 1.2rem;">
		                Chúng tôi không tìm thấy bất kỳ sản phẩm nào. Vui lòng quay lại sau.
		                <i class="bi bi-bag-check-fill text-info"></i>
		            </p>
		        </div>
		    </div>
		</c:if>

          <div class="col-12" style="height: 80vh; overflow-y: auto;">
            <div class="container d-flex flex-wrap gap-3 p-3 justify-content-center">
			    <c:forEach var="item" items="${list}">
			        <div class="card hover-effect" style="width: 18rem;">
			            <a href="/WebBanAo/product?id=${item.id}">
			                <img src="${item.link}" class="card-img-top">
			            </a>
			            <div class="card-body text-center">
			                <p class="card-text text-muted">${item.loai}</p>
			                <h5 class="card-title">${item.ten}</h5>
			                <h5 class="card-title text-info"><fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND</h5>
			                <div class="d-flex flex-column gap-2 mt-3">
			                    <form action="/WebBanAo/cart" method="post">
			                        <input type="hidden" name="id" value="${item.id}">
			                        <input type="hidden" value="post" name="_method">
			                        <input type="hidden" value="buynow" name="phanbiet">
			                        <button type="submit" class="btn btn-primary w-100">
			                            <i class="fas fa-shopping-bag"></i> Mua ngay
			                        </button>
			                    </form>
			                    
			                    <button type="submit" class="btn btn-warning w-100" onclick="addToCart(${item.id})">
		                            <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
		                        </button>
		                        <div id="response" style="display: none"></div>
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
	<script type="text/javascript" src="./views/HomePage/HomePage.js"></script>
	<script>
        function addToCart(id) {
            $.ajax({
                type: "POST",
                url: "/WebBanAo/cart", // Đường dẫn của Servlet
                data: { id: id ,
                	_method: "post",
                	phanbiet: "addtocart"},
                success: function(response) {
                	showSuccessToast(response.message);
                    $("#response").text(response.message);
                },
                error: function(xhr, status, error) {
                    console.error("Error: " + error);
                }
            });
        }
        function updatePriceLabel(value) {
            // Định dạng giá trị với dấu phẩy và thêm "đ"
            document.getElementById('priceLabel').textContent = new Intl.NumberFormat('vi-VN').format(value) + 'đ';
        }
        document.getElementById('searchText').addEventListener('input', function() {
            // Gán giá trị của searchText vào input có id là result
            document.getElementById('result').value = this.value;
        });
    </script>
	
</body>
</html>