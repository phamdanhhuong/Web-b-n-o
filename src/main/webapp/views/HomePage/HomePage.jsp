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
<link href="./views/ShopPage/ShopPage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">


<title>Shop Clothing</title>
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
</head>
<body>
	<div id="toast_"></div>
	

    <div class=" fixed-header">
	    <div class="container-fluid">
		    <div class="row align-items-center bg-white shadow py-3 px-xl-5 d-none d-lg-flex">
		        <!-- Logo -->
		        <div class="col-lg-4">
		            <a href="home" class="text-decoration-none">
		                <span class="h1 text-uppercase text-primary bg-dark px-2 rounded">Clothing</span>
		                <span class="h1 text-uppercase text-dark bg-primary px-2 rounded ml-n1">Shop</span>
		            </a>
		        </div>
		
		        <!-- Search Bar -->
		        <div class="col-lg-4 text-center">
		            <form action="/WebBanAo/home" method="get" id="formLoc">
		                <div class="input-group">
		                    <input class="form-control border-primary shadow-sm rounded-start" 
		                           type="text" 
		                           name="searchText" 
		                           id="searchText" 
		                           placeholder="Tìm kiếm sản phẩm..." 
		                           aria-label="Search" 
		                           value="${searchText == null ? '' : searchText}">
		                    <button class="btn btn-primary shadow-sm rounded-end" 
		                            type="button" 
		                            onclick="document.getElementById('formLoc').submit();">
		                        <i class="fas fa-search"></i>
		                    </button>
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
	    <div class="container-fluid bg-dark mb-30">
		    <div class="row px-xl-5">
		        <div class="col-lg-3 d-none d-lg-block">
				    <div class="btn d-flex align-items-center justify-content-between bg-primary w-100" style="height: 100%; padding: 0 30px; background: #343a40 !important;" data-bs-toggle="collapse" data-bs-target="#navbar-vertical">
				        
				        <span class="text-white ml-2">Danh mục sản phẩm</span>
				        <i class="fa fa-bars text-white"></i>
				    </div>
				    <nav class="collapse position-absolute navbar navbar-vertical navbar-dark align-items-start p-0 bg-dark" id="navbar-vertical" style="width: 20%; z-index: 999; border-radius: 8px;">
				        <div class="navbar-nav w-100">
				            <!-- Other Categories -->
				            <a href="#t-shirt" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">T-Shirts</a>
	            			<a href="#polo" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">Polo</a>
				        </div>
				    </nav>
				</div>
		        <div class="col-lg-9">
		            <nav class="navbar navbar-expand-lg navbar-dark py-lg-0 px-0">
		                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		                    <span class="navbar-toggler-icon"></span>
		                </button>
		
		                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
		                    <div class="navbar-nav mr-auto"></div>
		                    <div class="navbar-nav ml-auto d-none d-lg-block">
		                        <div class="text-right d-flex gap-3">
		                            <a class="nav-link active" aria-current="page" href="home">
				                        <i class="fas fa-home"></i> Trang Chủ
				                    </a>
		                            <a class="nav-link" href="/WebBanAo/cart">
		                                <i class="fas fa-shopping-cart"></i> Giỏ hàng
		                            </a>
		                            <a class="nav-link" href="/WebBanAo/theodoi">
		                                <i class="fas fa-box"></i> Theo dõi đơn hàng
		                            </a>
		                            <a class="nav-link" href="/WebBanAo">
				                        <i class="fas fa-sign-out-alt"></i> Logout
				                    </a>
		                        </div>
		                    </div>
		                </div>
		            </nav>
		        </div>
		    </div>
		</div>
	</div>

    <div class="container-fluid d-flex gap-3 p-3" style="margin-top: 150px !important;">
        <div class="col-3 ms-2" style="width: 450px !important">
		    <form action="/WebBanAo/home" method="get" id="formLoc">
		        <div class="filter p-4 bg-white border rounded shadow-lg">
		            <h2 class="text-center mb-4 font-weight-bold text-primary">Bộ Lọc</h2>
		
		            <!-- Danh mục sản phẩm -->
		            <div class="category mb-4">
		                <h5 class="mb-3 text-secondary">Danh mục sản phẩm</h5>
		                <ul class="list-unstyled">
		                    <li class="mb-2">
		                        <input class="form-check-input" type="radio" name="loc-alphabet" value="asc" id="a-z"
		                            <c:if test="${alphabet == null || alphabet == 'asc'}">checked</c:if>> 
		                        <label for="a-z" class="ml-2">A-Z</label>
		                    </li>
		                    <li class="mb-2">
		                        <input class="form-check-input" type="radio" name="loc-alphabet" value="desc" id="z-a"
		                            <c:if test="${alphabet != null && alphabet == 'desc'}">checked</c:if>> 
		                        <label for="z-a" class="ml-2">Z-A</label>
		                    </li>
		                    <li class="mb-2">
		                        <input class="form-check-input" type="radio" name="loc-price" value="asc" id="price-asc"
		                            <c:if test="${price == null || price == 'asc'}">checked</c:if>> 
		                        <label for="price-asc" class="ml-2">Giá tăng dần</label>
		                    </li>
		                    <li class="mb-2">
		                        <input class="form-check-input" type="radio" name="loc-price" value="desc" id="price-desc"
		                            <c:if test="${price != null && price == 'desc'}">checked</c:if>> 
		                        <label for="price-desc" class="ml-2">Giá giảm dần</label>
		                    </li>
		                </ul>
		            </div>
		
		            <!-- Loại áo -->
		            <h5 class="mb-3 text-secondary">Loại áo</h5>
		            <select class="form-select mb-4 border border-primary rounded" id="combo-box" name="loc-loai">
		                <option value="" <c:if test="${loai == null || loai == ''}">selected</c:if>>Tất cả</option>
		                <c:forEach var="itemLoai" items="${dsLoai}">
		                    <option value="${itemLoai}" <c:if test="${loai != null && loai == itemLoai}">selected</c:if>>${itemLoai}</option>
		                </c:forEach>
		            </select>
		
		            <!-- Khoảng giá -->
		            <div class="price-range mb-4">
		                <h5 class="mb-3 text-secondary">Khoảng giá</h5>
		                <div class="d-flex justify-content-between text-secondary">
		                    <span>Từ <b>0đ</b></span>
		                    <span>đến <b id="priceLabel">${range == null ? 1500000 : range}đ</b></span>
		                </div>
		                <input type="range" min="0" max="3000000" value="${range == null ? 1500000 : range}" step="10000" name="loc-range" class="form-range border-primary mt-2" oninput="updatePriceLabel(this.value)">
		            </div>
		
		            <!-- Màu sắc -->
		            <div class="color mb-4">
		                <h5 class="mb-3 text-secondary">Màu sắc</h5>
		                <div class="form-check d-flex flex-wrap gap-2">
		                    <div>
		                        <input class="form-check-input" type="radio" name="loc-color" value="" id="all-color"
		                            <c:if test="${color == null || color == ''}">checked</c:if>> 
		                        <label for="all-color">Tất cả</label>
		                    </div>
		                    <c:forEach var="mau" items="${dsMau}">
		                        <div class="d-flex align-items-center gap-3 mb-2">
		                            <input class="form-check-input" type="radio" name="loc-color" value="${mau}" id="color-${mau}" 
		                                <c:if test="${color != null && color == mau}">checked</c:if>>
		                            <span class="color-circle" style="background-color: ${mau}; width: 20px; height: 20px; border-radius: 50%;"></span>
		                        </div>
		                    </c:forEach>
		                </div>
		            </div>
		
		            <!-- Nút lọc -->
		            <input id="result" value="${searchText == null ? '' : searchText}" type="hidden" name="loc-searchText">
		            <button class="btn btn-primary mt-3 w-100 shadow-sm" type="submit"><i class="fa-solid fa-filter"></i> Lọc</button>
		        </div>
		    </form>
		</div>


        <div class="col-9">  
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