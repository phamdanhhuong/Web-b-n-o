<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="./views/AdminPage/adminPage.css" rel="stylesheet">
</head>
<body>

    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2">
		    <div class="sidebar">
		        <div class="profile">
		            <i class="fas fa-store me-2"></i> 
		            <p>Danh Hưởng</p>
		            <small>Chào mừng bạn trở lại</small>
		        </div>
		        <div class="menu">
		            <a href="/WebBanAo/home" class="menu-item">
		                <i class="fas fa-tachometer-alt me-2"></i> Bảng điều khiển
		            </a>
		            <a href="/WebBanAo/admin" class="menu-item">
		                <i class="fas fa-box me-2"></i> Quản lý sản phẩm
		            </a>
		            <a href="/WebBanAo/quanly" class="menu-item">
		                <i class="fas fa-clipboard-list me-2"></i> Quản lý đơn hàng
		            </a>
		            <a href="/WebBanAo" class="menu-item">
		                <i class="fas fa-sign-out-alt me-2"></i> Logout
		            </a>
		        </div>
		    </div>
		</div>


        <!-- Main Content -->
        <main class="col-md-10">
            <div class="container my-4">
                <h2>Bảng Điều Khiển</h2>
                <div class="row mb-1 thongke-admin-container">
	                
	                    <div class="col-md-3">
						    <div class="card">
						        <div class="card-body card-custom success p-3">
						            <h5 class="card-title">Tổng Khách Hàng</h5>
						            <h5 class="card-title">Trong Năm</h5>
						            <p class="card-text">${totalCustomers}</p> <!-- Hiển thị tổng số khách hàng -->
						        </div>
						    </div>
						</div>
						
						<div class="col-md-3">
						    <div class="card">
						        <div class="card-body card-custom info p-3">
						            <h5 class="card-title">Tổng Sản Phẩm</h5>
						            <h5 class="card-title">Trong Năm</h5>
						            <p class="card-text">${totalProducts}</p> <!-- Hiển thị tổng số sản phẩm -->
						        </div>
						    </div>
						</div>
						
						<div class="col-md-3">
						    <div class="card">
						        <div class="card-body card-custom warning p-3">
						            <h5 class="card-title">Tổng Đơn Hàng</h5>
						            <h5 class="card-title">Trong Năm</h5>
						            <p class="card-text">${totalOrders}</p> <!-- Hiển thị tổng số đơn hàng -->
						        </div>
						    </div>
						</div>
						
						<div class="col-md-3">
						    <div class="card">
						        <div class="card-body card-custom danger p-3">
						            <h5 class="card-title">Số Sản Phẩm</h5>
						            <h5 class="card-title">Sắp Hết Hàng</h5>
						            <p class="card-text">${totalLowStockProducts}</p> <!-- Hiển thị số sản phẩm sắp hết hàng -->
						        </div>
						    </div>
						</div>
                </div>
                <div class="row">
				    <div class="col-md-12">
		                <!-- Tình trạng đơn hàng -->
		                <div class="row mb-4">
						    <div class="col-md-6">
						        <div class="card">
				                    <div class="card-header">
				                        <h5>Tình trạng đơn hàng</h5>
				                    </div>
				                    <div class="card-body" style="max-height: 36vh; overflow-y: auto;">
				                        <table class="table table-bordered">
				                            <thead class="table-light">
					                            <tr>
					                                <th>ID đơn hàng</th>
				                                    <th>Tên khách hàng</th>
				                                    <th>Tổng tiền</th>
				                                    <th>Trạng thái</th>
					                            </tr>
					                        </thead>
					                        <tbody>
					                        	<c:forEach var="item" items="${list}">
						                            <tr>
						                                <td>${item.id}</td>
						                                <td>${item.tenNguoiNhan}</td>
						                                <td><fmt:formatNumber value="${item.tongTien}" type="number" pattern="#,###"/>đ</td>
						                                <td>${item.trangThai}</td>
						                            </tr>
					                            </c:forEach>
					                        </tbody>
				                        </table>
				                    </div>
			                    </div>
		                    </div>
						    <div class="col-md-6">
						        <div class="card">
						            <div class="card-header">
						                <h5>Thống kê 6 tháng doanh thu</h5>
						            </div>
						            <div class="card-body">
						                <canvas id="revenueChart"></canvas>
						            </div>
						        </div>
						    </div>
		                </div>
	                </div>
                </div>
                <div class="row mb-4">
						    <div class="col-md-12">
						        <div class="card">
				                    <div class="card-header">
				                        <h5>Khách hàng mới</h5>
				                    </div>
				                    <div class="card-body" style="max-height: 23vh; overflow-y: auto; width: 100%">
				                        <table class="table table-bordered">
				                            <thead>
				                                <tr>
				                                    <th>Tên khách hàng</th>
				                                    <th>Địa chỉ</th>
				                                    <th>Điện thoại</th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                                <c:forEach var="item" items="${list}">
						                            <tr>
						                                <td>${item.tenNguoiNhan}</td>
						                                <td>${item.diaChi}</td>
						                                <td>${item.sdtNguoiNhan}</td>
						                            </tr>
					                            </c:forEach>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
			                </div>
		                </div>
            </div>
        </main>
    </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // Chuyển đổi chuỗi JSON thành đối tượng
    const revenueByMonth = JSON.parse('${revenueByMonthJson}');
    console.log("Dữ liệu doanh thu theo tháng:", revenueByMonth); // Log dữ liệu doanh thu theo tháng

    const labels = Object.keys(revenueByMonth); // Danh sách các tháng: "MM-yyyy"
    const data = Object.values(revenueByMonth); // Tổng doanh thu theo tháng

    console.log("Danh sách tháng:", labels); // Log các tháng
    console.log("Tổng doanh thu theo tháng:", data); // Log tổng doanh thu của từng tháng

    const revenueData = {
        labels: labels.slice(-6), // Lấy 6 tháng gần nhất
        datasets: [{
            label: 'Doanh thu theo tháng',
            data: data.slice(-6), // Doanh thu của 6 tháng gần nhất
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    console.log("Dữ liệu biểu đồ doanh thu 6 tháng gần nhất:", revenueData); // Log dữ liệu biểu đồ

    const ctx = document.getElementById('revenueChart').getContext('2d');
    
    new Chart(ctx, {
        type: 'line',
        data: revenueData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Doanh thu (VND)'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Tháng'
                    }
                }
            }
        }
    });
</script>


</html>
