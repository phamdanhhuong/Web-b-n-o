<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@page import="beans.hoaDon" %>
<%@page import="beans.chiTietHoaDon" %>
<%@page import="beans.shirt" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">  
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
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
  
	<div class="container p-3" style="min-height: 95vh">
		<div class="row gap-3 bg-light">
			<!-- Cột 1 -->
			<div class="col">
			    <div class="container my-4">
			        <c:forEach var="item" items="${list}">
			            <div class="order-card">
			                <div class="d-flex justify-content-between align-items-center">
			                    <div>
			                        <span class="mall-badge">Shop</span>
			                        <strong>Chính hãng</strong>
			                    </div>
			                    <span class="status-text">Hoàn thành</span>
			                </div>
			                <div class="d-flex mt-3">
			                    <a onclick="displayDetail(${item.id})">
			                        <img src="${item.listDetail.get(0).shirt.link}" alt="${item.listDetail.get(0).shirt.ten}" class="img-thumbnail mr-3" style="width: 170px; height: auto;">
			                    </a>
			                    <div class="mx-3">
			                        <p class="mb-1">${item.listDetail.get(0).shirt.ten}</p>      
			                        <small class="text-muted">Size M</small>      
			                        <p class="text-muted mt-2"><fmt:formatNumber value="${item.listDetail.get(0).gia}" type="number" pattern="#,###"/>đ x ${item.listDetail.get(0).quantity}</p>
			                        <p class="mt-2">(Và ${item.listDetail.size() - 1} sản phẩm khác)</p>
			                        <p class="total-price">Tổng số tiền (${item.listDetail.size()} sản phẩm): đ</p>
			                        <p class="mt-2">Ngày thanh toán: <fmt:formatDate value="${item.ngayThanhToan}" pattern="dd/MM/yyyy" /></p>
			                    </div>
			                </div>
			                <div class="mt-3">
			                    <button class="btn btn-outline-secondary btn-sm">Xem đánh giá</button>
			                    <button class="btn btn-outline-danger btn-sm">Mua lại</button>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			</div>
			
			<!-- Cột 2 -->
			<div class="col">
				<c:forEach var="item" items="${list}">
					<div class="container mt-4" style="display: none" id="hoadon${item.id}">
					      <div class="container mt-4 p-2">
					        <div class="order-container shadow-sm">
					            <!-- Đơn hàng đã hoàn thành -->
					        <div class="order-status text-center" style="border-radius: 8px 8px 0 0;">
					            <p style="margin-bottom: 5px;">Đơn hàng đã hoàn thành</p>
					        </div>
					
					        <!-- Thông tin vận chuyển -->
					        <div class="row p-2">
					            <strong class="mb-2 ms-3">Thông tin vận chuyển</strong>
					            <div class="col-10 d-flex ms-3 rounded">
					                <i class="bi bi-truck me-2"></i>
					                <p class="mb-0">Nhanh - J&T Express</p>
					            </div>
					        </div>
					
					        <div class="divider"></div>
					
					        <!-- Địa chỉ nhận hàng -->
					        <div class="row p-2">
					            <strong class="mb-2 ms-3">Địa chỉ nhận hàng</strong>
					            <div class="col-10 d-flex ms-3 rounded">
					                <i class="bi bi-geo-alt me-2"></i>
					                <div>
					                    <div class="d-flex gap-2">
					                        <p class="mb-0" style="font-weight: bold;">${item.tenNguoiNhan}</p>  
					                        <p class="mb-0" style="font-style: italic; color: gray; font-size: medium;">(+84) <fmt:formatNumber value="${item.sdtNguoiNhan}" type="number" pattern="###,###"/></p>
					                    </div>
					                    <p class="mb-0" style="font-size: medium;" id="diachi">${item.diaChi}</p>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="container mt-4">
					  <div class="order-summary">
					      <!-- Thông tin sản phẩm -->
					      <div class="d-flex justify-content-between align-items-center p-2">
					        <div class="d-flex">
					            <i class="bi bi-shop me-2"></i>
					            <p style="font-weight: bold;">Shop Chính hãng</p>
					            <a href="#" style="color: lightgray; text-decoration: none; margin-left: 8px;">></a>
					        </div>
					      </div>
					      <div class="product-card p-3 mb-3">
					      	<c:forEach var="detail" items="${item.listDetail}">
					          <div class="d-flex align-items-center mb-2">
					              <img src="${detail.shirt.link}" alt="Sản phẩm 1" class="product-img me-2">
					              <div>
					                  <strong>${detail.shirt.ten}</strong><br>
					              </div>
					              <div class="ms-auto">
					                  <p class="price mb-0"><fmt:formatNumber value="${detail.gia}" type="number" pattern="#,###"/>đ x ${detail.quantity}</p>
					              </div>
					          </div>
					       </c:forEach>
					      </div>
					
					      <div class="divider"></div>
					
					      <!-- Tổng cộng -->
					      <div class="row mb-3">
					          <div class="col-6"><strong>Thành tiền:</strong></div>
					          <div class="col-6 text-end"><strong ><fmt:formatNumber value="${item.tongTien}" type="number" pattern="#,###"/>đ</strong></div>
					          <div class="col-6">Phương thức thanh toán</div>
					          <div class="col-6 text-end">${item.phuongThuc}</div>
					      </div>
					
					      <div class="divider"></div>
					
					      <!-- Nút mua lại -->
					      <button class="btn btn-outline-danger w-100">Mua lại</button>
					    </div>
					  </div>
					</div>
				</c:forEach>
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
	<script type="text/javascript">
		
		const displayDetail =(id)=>{
			const allDivs = document.querySelectorAll("[id^='hoadon']");
	        allDivs.forEach(div => {
	            div.style.display = 'none'; // Ẩn tất cả
	        });

			var div = document.getElementById('hoadon'+id);
	        if (div.style.display === 'none') {
	            div.style.display = 'block'; // Hiện div
	        } else {
	            div.style.display = 'none'; // Ẩn div
	        }
		}
	</script>
</body>
</html>
