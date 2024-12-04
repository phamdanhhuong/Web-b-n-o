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
</head>
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
<body style="background-color: #f5f5f5">
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
			            <a href="#t-shirt" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">Áo T-Shirts</a>
            			<a href="#polo" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">Áo Polo</a>
            			<a href="#ni" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">Áo Nỉ</a>
            			<a href="#unisex" class="nav-item nav-link" style="border-radius: 8px; transition: background-color 0.3s ease;">Áo Unisex</a>
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
	                            <a class="nav-link" href="/WebBanAo/trangchu">
	                                <i class="fas fa-tshirt"></i> Sản Phẩm
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

    <div class=" body-content mt-5">
	    <div class="container-fluid mb-3">
	        <div class="row px-xl-5">
	            <div class="col-lg-8">
	                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
	                    <div class="carousel-inner">
	                        <div class="carousel-item position-relative active" style="height: 430px;">
	                            <img class="position-absolute w-100 h-100" src="https://media3.coolmate.me/cdn-cgi/image/width=1920,quality=90,format=auto/uploads/November2024/len-deal-don-dong-giam-50-hero-banner-desktop.jpg" style="object-fit: cover;">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-4">
				    <div class="product-offer mb-30 position-relative" style="height: 430px; border-radius: 10px; overflow: hidden; transition: transform 0.3s ease, box-shadow 0.3s ease; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
				        <!-- Hình ảnh sản phẩm -->
				
				        <!-- Nội dung khuyến mãi -->
				        <div class="offer-overlay position-absolute w-100 h-100 top-0 start-0" style="background-color: rgba(0, 0, 0, 0.5); opacity: 0; transition: opacity 0.3s;"></div>
				        <div class="offer-text position-absolute top-50 start-50 translate-middle text-center" style="z-index: 2;">
				            <h6 class="text-white text-uppercase" style="background-color: #dc3545; padding: 5px 15px; display: inline-block; border-radius: 5px;">Save 20%</h6>
				            <h3 class="text-white mb-3" style="background-color: #343a40; padding: 10px 20px; display: inline-block; border-radius: 5px;">Special Offer</h3>
				            <a href="/WebBanAo/trangchu" class="btn btn-outline-light btn-sm" style="padding: 10px 20px; margin-top: 15px; border-radius: 5px; text-decoration: none; transition: background-color 0.3s ease, color 0.3s ease;">Shop Now</a>
				        </div>
				    </div>
				</div>


	        </div>
	    </div>
	    
	    <div class="container-fluid pt-5">
		    <div class="row px-xl-5 pb-3">
		        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		            <div class="d-flex align-items-center bg-light mb-4">
		                <h1 class="fa fa-check text-primary m-0"></h1>
		                <h5 class="font-weight-semi-bold m-0">Sản Phẩm Chất Lượng</h5>
		            </div>
		        </div>
		        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		            <div class="d-flex align-items-center bg-light mb-4">
		                <h1 class="fa fa-shipping-fast text-primary m-0"></h1>
		                <h5 class="font-weight-semi-bold m-0">Miễn Phí Vận Chuyển</h5>
		            </div>
		        </div>
		        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		            <div class="d-flex align-items-center bg-light mb-4">
		                <h1 class="fas fa-exchange-alt text-primary m-0"></h1>
		                <h5 class="font-weight-semi-bold m-0">Hoàn Trả Trong 14 Ngày</h5>
		            </div>
		        </div>
		        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		            <div class="d-flex align-items-center bg-light mb-4">
		                <h1 class="fa fa-phone-volume text-primary m-0"></h1>
		                <h5 class="font-weight-semi-bold m-0">Hỗ Trợ 24/7</h5>
		            </div>
		        </div>
		    </div>
		</div>
	
	    <h1 id="polo" class="text-center text-uppercase text-primary mt-3">Áo Polo</h1>
		<div class="d-flex gap-3 container-fluid pt-3">
		    <div class="col-12" style="overflow-x: auto;">
		        <div class="container-fluid d-flex flex-wrap gap-3 p-3 justify-content-center">
		            <c:forEach var="item" items="${list}">
		                <c:if test="${item.loai == 'Áo Polo'}">
		                    <div class="card hover-effect" style="width: 18rem;">
		                        <a href="/WebBanAo/product?id=${item.id}">
		                            <img src="${item.link}" class="card-img-top" alt="${item.ten}">
		                        </a>
		                        <div class="card-body text-center">
		                            <p class="card-text text-muted">${item.loai}</p>
		                            <h5 class="card-title">${item.ten}</h5>
		                            <h5 class="card-title text-info">
		                                <fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND
		                            </h5>
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
		                </c:if>
		            </c:forEach>
		        </div>
		    </div>
		</div>
	
		
		<h1 id="t-shirt" class="text-center text-uppercase text-primary mt-3">Áo T-Shirt</h1>
		<div class="d-flex gap-3 container-fluid pt-3">
		    <div class="col-12" style="overflow-x: auto;">
		        <div class="container-fluid d-flex flex-wrap gap-3 p-3 justify-content-center">
		            <c:forEach var="item" items="${list}">
		                <c:if test="${item.loai == 'T-shirt'}">
		                <div class="card hover-effect" style="width: 18rem;">
		                    <a href="/WebBanAo/product?id=${item.id}">
		                        <img src="${item.link}" class="card-img-top">
		                    </a>
		                    <div class="card-body text-center">
		                        <p class="card-text text-muted">${item.loai}</p>
		                        <h5 class="card-title">${item.ten}</h5>
		                        <h5 class="card-title text-info">
		                            <fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND
		                        </h5>
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
		                </c:if>
		            </c:forEach>
		        </div>
		    </div>
		</div>
		
		<h1 id="ni" class="text-center text-uppercase text-primary mt-3">Áo Nỉ</h1>
		<div class="d-flex gap-3 container-fluid pt-3">
		    <div class="col-12" style="overflow-x: auto;">
		        <div class="container-fluid d-flex flex-wrap gap-3 p-3 justify-content-center">
		            <c:forEach var="item" items="${list}">
		                <c:if test="${item.loai == 'Áo nỉ'}">
		                <div class="card hover-effect" style="width: 18rem;">
		                    <a href="/WebBanAo/product?id=${item.id}">
		                        <img src="${item.link}" class="card-img-top">
		                    </a>
		                    <div class="card-body text-center">
		                        <p class="card-text text-muted">${item.loai}</p>
		                        <h5 class="card-title">${item.ten}</h5>
		                        <h5 class="card-title text-info">
		                            <fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND
		                        </h5>
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
		                </c:if>
		            </c:forEach>
		        </div>
		    </div>
		</div>
	
	
		<h1 id="unisex" class="text-center text-uppercase text-primary mt-3">Áo Unisex</h1>
		<div class="d-flex gap-3 container-fluid pt-3">
		    <div class="col-12" style="overflow-x: auto;">
		        <div class="container-fluid d-flex flex-wrap gap-3 p-3 justify-content-center">
		            <c:forEach var="item" items="${list}">
		                <c:if test="${item.loai == 'Áo unisex'}">
		                <div class="card hover-effect" style="width: 18rem;">
		                    <a href="/WebBanAo/product?id=${item.id}">
		                        <img src="${item.link}" class="card-img-top">
		                    </a>
		                    <div class="card-body text-center">
		                        <p class="card-text text-muted">${item.loai}</p>
		                        <h5 class="card-title">${item.ten}</h5>
		                        <h5 class="card-title text-info">
		                            <fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND
		                        </h5>
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
		                </c:if>
		            </c:forEach>
		        </div>
		    </div>
		</div>
	     <h1 id="thuonghieu" class="text-center text-uppercase text-primary mt-3">Thương Hiệu</h1>
		<div class="d-flex gap-3 container-fluid pt-3">
	    <div class="container-fluid d-flex flex-wrap gap-3 p-3 justify-content-center">
	        <!-- Card Thương Hiệu -->
	        <div class="brand-card">
	            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/725px-Adidas_Logo.svg.png" alt="Adidas">
	            <h5>Adidas</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://inkythuatso.com/uploads/thumbnails/800/2021/11/logo-nike-inkythuatso-2-01-04-15-43-59.jpg" alt="Nike">
	            <h5>Nike</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://bota.vn/wp-content/uploads/2018/11/gg-768x496.jpg" alt="Gucci">
	            <h5>Gucci</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://vudigital.co/wp-content/uploads/2022/02/PUMA-Logo-1980.webp" alt="Puma">
	            <h5>Puma</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://logoeps.com/wp-content/uploads/2013/06/zara-retailer-vector-logo.png" alt="Zara">
	            <h5>Zara</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://jordan1.vn/wp-content/uploads/2023/09/levis-symbol-700x394_82b12a11dd8b41e2a88ece0d11b1cfe1_1024x1024.png" alt="Levis">
	            <h5>Levi's</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://www.pngkey.com/png/detail/306-3062265_uniqlo-logo-black-and-white.png" alt="Uniqlo">
	            <h5>Uniqlo</h5>
	        </div>
	        <div class="brand-card">
	            <img src="https://freepngdesign.com/content/uploads/images/hm-black-logo-4543.png" alt="H&M">
	            <h5>H&M</h5>
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
	<script>
    // Sử dụng JavaScript để thêm hiệu ứng hover
    document.querySelector('.product-offer').addEventListener('mouseover', function() {
        this.style.transform = 'scale(1.05)';
        this.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.4)';
        document.querySelector('.offer-overlay').style.opacity = '0.6';
        document.querySelector('img').style.transform = 'scale(1.1)';
    });

    document.querySelector('.product-offer').addEventListener('mouseout', function() {
        this.style.transform = 'scale(1)';
        this.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
        document.querySelector('.offer-overlay').style.opacity = '0';
        document.querySelector('img').style.transform = 'scale(1)';
    });
</script>
<script>
    // Sử dụng JavaScript để thêm hiệu ứng hover
    document.querySelector('.product-offer').addEventListener('mouseover', function() {
        this.style.transform = 'scale(1.05)';
        this.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.4)';
        document.querySelector('.offer-overlay').style.opacity = '0.6';
        document.querySelector('img').style.transform = 'scale(1.1)';
    });

    document.querySelector('.product-offer').addEventListener('mouseout', function() {
        this.style.transform = 'scale(1)';
        this.style.boxShadow = '0 4px 8px rgba(0, 0, 0, 0.2)';
        document.querySelector('.offer-overlay').style.opacity = '0';
        document.querySelector('img').style.transform = 'scale(1)';
    });
</script>
	
</body>
</html>