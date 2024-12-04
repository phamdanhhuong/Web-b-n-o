<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>


<title>Shop Clothing</title>
<head>


    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">    
    <link href="views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">    
<link href="./views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
<link href="./views/ShopPage/ShopPage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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

<body style="background-color: #f5f5f5;">
	<div id="toast_"></div>
	<div id="response" style="display: none"></div>
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

    <div class="container gap-3"  style="margin-top: 150px !important;">
        <div class="row bg-white p-3 mt-5" style="border-radius: 10px;">
            <div class="col">
                <img style="height: 700px; width: auto;" src="${item.link}">
            </div> 
            <div class="col-5 p-3">
                <h3>${item.ten}</h3>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex">
                        <span class="rating">5.0</span>
                        <span class="text-muted" style="font-size: 1.2rem;">| 1 Đánh Giá | 11 Đã Bán</span>
                    </div>
                </div>
                <h4 class="text-primary"><fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/> VND</h4>
				<div class="divider my-3"></div>
                <form class="mt-2" id="productForm" method="post">
                    <div class="d-flex align-items-center mb-3" style="height: 5vh;">
                        <h5 class="me-2">Chọn size:</h5>
                        <input type="radio" class="btn-check" name="sizeoption" id="size-s" value="S" autocomplete="off"
                            checked>
                        <label class="btn btn-outline-secondary fs-5 text" for="size-s">S</label>

                        <input type="radio" class="btn-check" name="sizeoption" id="size-m" value="M" autocomplete="off">
                        <label class="btn btn-outline-secondary fs-5 text" for="size-m">M</label>

                        <input type="radio" class="btn-check" name="sizeoption" id="size-l" value="L" autocomplete="off">
                        <label class="btn btn-outline-secondary fs-5 text" for="size-l">L</label>

                        <input type="radio" class="btn-check" name="sizeoption" id="size-xl" value="XL" autocomplete="off">
                        <label class="btn btn-outline-secondary fs-5 text" for="size-xl">XL</label>
                    </div>
                    <!--
                    <div class="d-flex align-items-center mb-3" style="height: 5vh;">
					    <h5 class="me-2">Chọn màu:</h5>
					    <input type="radio" class="btn-check" name="coloroption" id="color-red" value="Red" autocomplete="off" checked>
					    <label class="btn btn-outline-secondary fs-5 text" for="color-red">Đỏ</label>
					
					    <input type="radio" class="btn-check" name="coloroption" id="color-blue" value="Blue" autocomplete="off">
					    <label class="btn btn-outline-secondary fs-5 text" for="color-blue">Xanh dương</label>
					
					    <input type="radio" class="btn-check" name="coloroption" id="color-green" value="Green" autocomplete="off">
					    <label class="btn btn-outline-secondary fs-5 text" for="color-green">Xanh lá</label>
					
					    <input type="radio" class="btn-check" name="coloroption" id="color-black" value="Black" autocomplete="off">
					    <label class="btn btn-outline-secondary fs-5 text" for="color-black">Đen</label>
					</div>
					-->
                    <div class="d-flex align-items-center mb-3" style="height: 5vh;">
                        <h5 class="me-2">Số lượng: </h5>
                        <div class="d-flex border border-3 rounded-pill" style="width: 38%;">
                            <button type="button" onclick="decrease()"
                                class="btn btn-light border border-0 rounded-start-pill">-</button>
                            <input type="text" name="quantity" id="quantity" value="1" class="form-control text-center border border-0" readonly>
                            <button type="button" onclick="increase()"
                                class="btn btn-light border border-0 rounded-end-circle">+</button>
                        </div>
                    </div>

					<div class="divider my-3"></div>
                    <input type="hidden" value="${item.id}" name="id">
                    <input type="hidden" value="post" name="_method">
                    <input type="hidden" value="buynow" name="phanbiet">
                    <div class="d-flex gap-3">
                        <div>
                            <input type="submit" class="btn btn-primary" onclick="setAction('buy')" value="Mua ngay" style="width: 162px;">
                        </div>
                    </div>
                </form>
                 <div class="mt-3">
                     <button type="submit" class="btn btn-outline-primary" onclick="addToCart_product(${item.id})">Thêm vào giỏ hàng</button>
                 </div>
            </div>
        </div>
        <div class="row bg-white p-3 mt-5" style="border-radius: 10px;">
            <div class="row align-items-center">
                <div class="col-md-4 align-items-center">
                    <div class="row">
						<div class="col-md-3">
							<img src="https://via.placeholder.com/80" class="shop-logo me-3" alt="Shop Logo">
						</div>
						<div class="col-md-9">
							<div>
								<div class="shop-name"><span class="mall-badge">Chính hãng</span>Official Store</div>
								<div class="text-muted">Online 2 Phút Trước</div>
								<div class="col-md-2 d-flex align-items-center gap-2">
									<button class="btn btn-chat" style="min-width: 150px;">Chat Ngay</button>
									<button class="btn btn-outline-secondary" style="min-width: 130px;">Xem Shop</button>
								</div>
							</div>
						</div>
                    </div>
                </div>
                <div class="col-md-8 align-items-center" style="display: none">
                    <div class="row">
                        <div class="col d-flex gap-4">
							<div>
								<div class="text-muted mb-3">Đánh Giá</div>
								<div class="text-muted">Tỉ Lệ Phản Hồi</div>
							</div>
							<div>
								<div class="text-highlight mb-3">3k</div>
								<div class="text-highlight">98%</div>
							</div>
                        </div>
                        <div class="col d-flex gap-4">
							<div>
								<div class="text-muted mb-3">Sản Phẩm</div>
								<div class="text-muted">Thời Gian Phản Hồi</div>
							</div>
							<div>
								<div class="text-highlight mb-3">135</div>
								<div class="text-highlight">trong vài giờ</div>
							</div>
                        </div>
                        <div class="col d-flex gap-4">
							<div>
								<div class="text-muted mb-3">Tham Gia</div>
								<div class="text-muted">Người Theo Dõi</div>
							</div>
							<div>
								<div class="text-highlight mb-3">4 năm trước</div>
								<div class="text-highlight">31,1k</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<div class="row">
			<!-- Chi tiết sản phẩm -->
			<div class="col bg-white p-3 mt-5" style="border-radius: 10px; max-width: 73%;">
				<div class="p-3">
					<h3>CHI TIẾT SẢN PHẨM</h3>
					<div class="divider my-3"></div>
					<div class="product-info">
						<p><strong>Danh Mục: </strong>${item.loai}</p>
						<p><strong>Kho:</strong> ${item.tonKho}</p>
						<p><strong>Thương hiệu:</strong> ${item.thuongHieu}</p>
						<p><strong>Xuất xứ:</strong> ${item.xuatXu}</p>
						<p><strong>Chất liệu:</strong> ${item.chatLieu}</p>
					</div>
		
					<h4 class="mt-3">MÔ TẢ SẢN PHẨM</h4>
					<p class="lh-1 fs-5 text">
						${item.mota}
					</p>
					<!--
					<p>Áo Thun In Chữ NGHÈO Overco Vải Cotton Cao Cấp Mềm Mịn Thoáng Mát Không Xù Lông</p>
					<ul>
						<li><strong>T-SHIRT</strong> - Mẫu áo thun có form ÂU MỸ sử dụng chất liệu COTTON 100% - co giãn 2 chiều để phối đồ theo các nhu cầu sử dụng khác nhau.</li>
						<li>Form áo Châu Âu.</li>
						<li>Định lượng: 250 gsm. 100% cotton.</li>
						<li>Tag logo được gắn ở tay áo.</li>
					</ul>
					-->
				</div>
			</div>
	
			<!-- Sản phẩm nổi bật -->
			<div class="col-md-3 bg-white p-3 mt-5 ms-auto" style="border-radius: 10px;">
				<div class="sidebar">
					<h5>Sản Phẩm Liên Quan</h5>
					<c:forEach var="item" items="${list3sp}">
						<div class="product-item">
							<div class="row">
								<div class="col">
									<a href="/WebBanAo/product?id=${item.id}">
										<img src="${item.link}" alt="Sản phẩm" class="img-fluid">
									</a>
								</div>
								<div class="col">
									<p>${item.ten}</p>
									<p class="text-danger"><strong><fmt:formatNumber value="${item.gia}" type="number" pattern="#,###"/>đ</strong></p>
								</div>
							</div>
							<div class="divider my-3"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row bg-white p-3 mt-5" style="border-radius: 10px;">
			<h2 class="mt-3">ĐÁNH GIÁ SẢN PHẨM</h2>
			<div class="divider my-3"></div>
			<div>
				<div class="row ms-5 me-5" style="border-radius: 15px; border: 1px solid #f9ede5; border-radius: 10px; background-color: #fffbf8; padding: 15px; ">
					<div class="col-md-3">
						<div class="rating">5 trên 5</div>
						<div class="text-warning">★★★★★</div>
					</div>
					
					<div class="col">
						<!-- Filter buttons -->
						<div class="review-filter mt-3">
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">Tất Cả</button>
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">5 Sao (1)</button>
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">4 Sao (0)</button>
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">3 Sao (0)</button>
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">2 Sao (0)</button>
							<button class="btn btn-outline-primary" style="border: 1px solid #ccc;">1 Sao (0)</button>
						</div>
					</div>
				</div>
			<!-- Review section -->
			<div class="divider my-3"></div>
			<div class="review-section mt-3">
				<div class="d-flex align-items-center p-2">
					<img src="https://via.placeholder.com/50" class="rounded-circle me-3" alt="Avatar">
					<div>
						<span class="reviewer">dailybiasaigon_43</span>
						<div class="rating">★★★★★</div>
						<div><small>2024-09-23 22:40 | Phân loại hàng: Trắng - Hết Tiền, S(45-60KG)</small></div>
						<div class="review-response mt-2">
							<strong>Phản Hồi Của Người Bán</strong>
							<p>Cảm ơn bạn đã tin tưởng và lựa chọn OVERCO ạ. Mong rằng bạn sẽ có những trải nghiệm tuyệt vời từ sản phẩm và OVERCO, hy vọng sẽ tiếp tục nhận được sự ủng hộ của bạn trong thời gian sắp tới ạ! Chúc bạn và gia đình có nhiều sức khoẻ và niềm vui nhé!</p>
						</div>
					</div>
				</div>
				<div class="divider my-3"></div>
			</div>

			<!-- Pagination -->
			<nav aria-label="Page navigation example" class="mt-4">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">1</a></li>
				</ul>
			</nav>
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
    
    <script>    
        function setAction(actionType) {
            var form = document.getElementById('productForm');
            if (actionType === 'buy') {
                form.action = '/WebBanAo/cart';
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
        function addToCart_product(id) {  
			const selectedSize = document.querySelector('input[name="sizeoption"]:checked').value;
			var quantityInput = document.getElementById('quantity').value;
	        $.ajax({
	            type: "POST",
	            url: "/WebBanAo/cart", // Đường dẫn của Servlet
	            data: { id: id ,
	            	_method: "post",
	            	phanbiet: "addtocart",
	            	sizeoption: selectedSize,
	            	quantity: quantityInput},
	            success: function(response) {
	            	showSuccessToast(response.message);
	                $("#response").text(response.message);
	            },
	            error: function(xhr, status, error) {
	                console.error("Error: " + error);
	            }
	        });
	    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript" src="./views/HomePage/HomePage.js"></script>
</body>

</html>