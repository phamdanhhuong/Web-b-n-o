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
<link href="./views/CartPage/CartPage.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	/* CSS cho hiệu ứng đổ xuống */
	.slide-down {
		animation: slideDown 0.5s ease forwards;
	}

	@keyframes slideDown {
		0% {
			opacity: 0;
			transform: translateY(-20px);
		}
		100% {
			opacity: 1;
			transform: translateY(0);
		}
	}
	.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
	}
	
	.card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	}
	
	.card-body {
	    padding: 20px;
	    text-align: center;
	}
	
	.card-title {
	    font-size: 18px;
	    font-weight: bold;
	    margin-bottom: 10px;
	    color: #343a40;
	}
	
	.card-text {
	    font-size: 24px;
	    font-weight: bold;
	    color: #007bff;
	}
	.card-custom {
	    border-left: 5px solid;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    transition: transform 0.3s, box-shadow 0.3s;
	}.card-custom:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	}
	.card-custom.success {
	    border-color: #28a745;
	}
	.card-custom.info {
	    border-color: #17a2b8;
	}
	.card-custom.warning {
	    border-color: #ffc107;
	}
	.card-custom.danger {
	    border-color: #dc3545;
	}
</style>
<style>

</style>
</head>
<body>
	<div class=" fixed-header">
	    <div class="container-fluid">
		    <div class="row align-items-center bg-white shadow py-3 px-xl-5 d-none d-lg-flex">
		        <!-- Logo -->
		        <div class="col-lg-4">
		            <a href="home" class="text-decoration-none">
		                <span class="h1 text-uppercase text-primary bg-dark px-2 rounded">Clothing</span>
		                <span class="h1 text-uppercase text-dark bg-primary px-2 rounded ml-n1" style="background: linear-gradient(90deg, #007bff, #6f00ff);">Shop</span>
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
  
	<div class="container-fluid p-3" style="min-height: 95vh; margin-top: 150px !important;">
		<div class="row gap-3 bg-light">
		    <c:if test="${empty list}">
			    <div class="alert alert-warning text-center p-4 rounded shadow">
			        <i class="bi bi-exclamation-triangle-fill text-danger fs-1"></i>
			        <p class="fw-bold fs-4 mt-3 text-danger">Không có đơn hàng nào!</p>
			        <p class="text-muted">Chúng tôi không tìm thấy bất kỳ đơn hàng nào trong tài khoản của bạn. Vui lòng quay lại sau.</p>
			    </div>
			</c:if>
			<!-- Đếm số hóa đơn theo từng trạng thái -->
	        <div class="col-12 text-center">
	            <div class="row thongke-container p-3">
				    <div class="row">
				        <!-- Đếm số hóa đơn theo từng trạng thái -->
				        <c:set var="totalOrders" value="0" />
				        <c:set var="completedOrders" value="0" />
				        <c:set var="waitingOrders" value="0" />
				        <c:set var="shippingOrders" value="0" />
				        <c:set var="canceledOrders" value="0" />
				        
				        <c:forEach var="item" items="${list}">
				            <c:set var="totalOrders" value="${totalOrders + 1}" />
				            <c:if test="${item.trangThai == 'Hoàn thành'}">
				                <c:set var="completedOrders" value="${completedOrders + 1}" />
				            </c:if>
				            <c:if test="${item.trangThai == 'Đã xác nhận'}">
				                <c:set var="waitingOrders" value="${waitingOrders + 1}" />
				            </c:if>
				            <c:if test="${item.trangThai == 'Chờ xác nhận'}">
				                <c:set var="shippingOrders" value="${shippingOrders + 1}" />
				            </c:if>
				            <c:if test="${item.trangThai == 'Đã hủy'}">
				                <c:set var="canceledOrders" value="${canceledOrders + 1}" />
				            </c:if>
				        </c:forEach>
				
				        <!-- Card thống kê -->
				        <div class="col-md-3">
				            <div class="card">
				                <div class="card-body card-custom success">
				                    <h5 class="card-title">Hoàn thành</h5>
				                    <p class="card-text">${completedOrders}</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3">
				            <div class="card">
				                <div class="card-body card-custom info">
				                    <h5 class="card-title">Đã xác nhận</h5>
				                    <p class="card-text">${waitingOrders}</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3">
				            <div class="card">
				                <div class="card-body card-custom warning">
				                    <h5 class="card-title">Chờ xác nhận</h5>
				                    <p class="card-text">${shippingOrders}</p>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-3">
				            <div class="card">
				                <div class="card-body card-custom danger">
				                    <h5 class="card-title">Đã hủy</h5>
				                    <p class="card-text">${canceledOrders}</p>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
	        </div>
			<!-- Cột 1 -->
			<div class="col  ms-4" style="height: 69vh; overflow-y: auto; border-radius: 15px; background-color: white; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
			    <div class="container p-3">
			        <c:forEach var="item" items="${list}">
			            <div class="order-card p-4 mb-4 border rounded shadow-sm bg-white" style="border-radius: 15px;">
			                <!-- Thông tin trên cùng -->
			                <div class="d-flex justify-content-between align-items-center mb-3">
			                    <div class="d-flex align-items-center">
			                        <span class="mall-badge text-white px-2 py-1 rounded" style="background-color: #007bff; font-size: 0.9rem;">Shop</span>
			                        <strong class="ms-2 text-secondary">Chính hãng</strong>
			                    </div>
			                    <span class="badge ${item.trangThai == 'Chờ xác nhận' ? 'bg-success' : 'bg-warning'} text-white p-2">
			                        ${item.trangThai}
			                    </span>
			                </div>
			
			                <!-- Thông tin sản phẩm -->
			                <div class="d-flex">
			                    <a onclick="displayDetail(${item.id})" class="text-decoration-none">
			                        <img src="${item.listDetail.get(0).shirt.link}" alt="${item.listDetail.get(0).shirt.ten}" 
			                             class="img-thumbnail rounded" style="width: 170px; height: auto; object-fit: cover;">
			                    </a>
			                    <div class="ms-3 flex-grow-1">
			                        <p class="fw-bold text-dark mb-2" style="font-size: 1.1rem;">${item.listDetail.get(0).shirt.ten}</p>
			                        <small class="text-muted d-block">Size: M</small>
			                        <p class="text-muted mt-2 mb-2">
			                            <fmt:formatNumber value="${item.listDetail.get(0).gia}" type="number" pattern="#,###"/>đ x ${item.listDetail.get(0).quantity}
			                        </p>
			                        <p class="text-muted">(Và ${item.listDetail.size() - 1} sản phẩm khác)</p>
			                        <p class="fw-bold text-success mt-3" style="font-size: 1rem;">
			                            Tổng số tiền (${item.listDetail.size()} sản phẩm): 
			                            <fmt:formatNumber value="${item.tongTien}" type="number" pattern="#,###"/>đ
			                        </p>
			                        <p class="text-muted mt-2">Ngày thanh toán: 
			                            <fmt:formatDate value="${item.ngayThanhToan}" pattern="dd/MM/yyyy" />
			                        </p>
			                    </div>
			                </div>
			
			                <!-- Nút hành động -->
			                <div class="mt-3 d-flex">
			                    <button class="btn btn-outline-secondary btn-sm me-2">
			                        <i class="fas fa-star"></i> Xem đánh giá
			                    </button>
			                    <button class="btn btn-outline-danger btn-sm">
			                        <i class="fas fa-shopping-cart"></i> Mua lại
			                    </button>
			                </div>
			            </div>
			        </c:forEach>
			    </div>
			</div>

			
			<!-- Cột 2 -->
			<div class="col">
				<c:forEach var="item" items="${list}">
					<div class="container" style="display: none" id="hoadon${item.id}">
				      <div class="container p-2">
					        <div class="order-container shadow-sm rounded p-3 bg-white">
					            <!-- Đơn hàng đã hoàn thành -->
					        <div class="order-status text-center" style="border-radius: 8px 8px 0 0;">
					            <p style="margin-bottom: 5px;">${item.trangThai}</p>
					        </div>
					        <!-- Thông tin vận chuyển -->
					        <div class="row p-2">
					            <strong class="ms-3">Thông tin vận chuyển</strong>
					            <div class="col-10 d-flex ms-3 rounded">
					                <i class="bi bi-truck me-2"></i>
					                <p class="mb-0">Nhanh - J&T Express</p>
					            </div>
					        </div>
					        <div class="divider"></div>
					        <!-- Địa chỉ nhận hàng -->
					        <div class="row">
					            <strong class="ms-3">Địa chỉ nhận hàng</strong>
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
					
					<div class="container">
					  <div class="order-summary">
					      <!-- Thông tin sản phẩm -->
					      <div class="d-flex justify-content-between align-items-center p-2">
					        <div class="d-flex">
					            <i class="bi bi-shop me-2"></i>
					            <p style="font-weight: bold;">Shop Chính hãng</p>
					            <a href="#" style="color: lightgray; text-decoration: none; margin-left: 8px;">></a>
					        </div>
					      </div>
					      <div class="product-card p-3 mb-3" style="height: 20vh; overflow-y: auto;">
					      	<c:forEach var="detail" items="${item.listDetail}">
					          <div class="d-flex align-items-center mb-2">
					              <img src="${detail.shirt.link}" alt="Sản phẩm 1" class="product-img me-2">
					              <div>
					                  <strong>${detail.shirt.ten}</strong>
					                  <p class="mb-0" style="font-style: italic; color: gray; font-size: medium;">Size: ${detail.size}</p>
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
		const displayDetail = (id) => {
			const allDivs = document.querySelectorAll("[id^='hoadon']");
			allDivs.forEach(div => {
				div.style.display = 'none'; // Ẩn tất cả các div
				div.classList.remove('slide-down'); // Xóa lớp hiệu ứng đổ xuống nếu có
			});
	
			const selectedDiv = document.getElementById('hoadon' + id);
			if (selectedDiv.style.display === 'none') {
				selectedDiv.style.display = 'block'; // Hiện div được chọn
				selectedDiv.classList.add('slide-down'); // Thêm hiệu ứng đổ xuống
			} else {
				selectedDiv.style.display = 'none'; // Ẩn div nếu nó đang hiện
			}
		};
	</script>


</body>
</html>
