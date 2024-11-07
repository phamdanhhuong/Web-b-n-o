<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="./views/AdminPage/adminPage.css" rel="stylesheet">
    <style>
        .badge-success { background-color: #28a745; }
        .badge-info { background-color: #17a2b8; }
        .badge-warning { background-color: #ffc107; }
        .badge-danger { background-color: #dc3545; }
        .btn-primary { background-color: #007bff; border: none; }
    </style>
</head>
<body>
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar">
                <div class="profile">
                    <img src="path/to/profile-image.png" alt="Profile Image">
                    <p>Danh Hưởng</p>
                    <small>Chào mừng bạn trở lại</small>
                </div>
                <div class="menu">
                    <a href="/WebBanAo/home" class="menu-item">Bảng điều khiển</a>
                    <a href="/WebBanAo/admin" class="menu-item">Quản lý sản phẩm</a>
                    <a href="/WebBanAo/quanly" class="menu-item">Quản lý đơn hàng</a>
                    <a href="/WebBanAo/AdminThongKe" class="menu-item">Báo cáo doanh thu</a>
                </div>
            </div>
        </div>
        <div class="col-md-10">

            <div class="container mt-5">
                <div class="row mb-4">
                    <div class="header-container">
                        <div class="header-left col-md-6">
                            <span class="title">Danh Sách Đơn Hàng</span>
                        </div>
                        <div class="header-right col-md-6">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nhập mã đơn hàng hoặc tên khách hàng để tìm kiếm...">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row thongke-container p-3 mb-4">
                    
                    <h4 class="mb-4 mt-3"><b>Số lượng đơn hàng: 40</b></h4>
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-body card-custom success ">
                                    <h5 class="card-title">Hoàn thành</h5>
                                    <p class="card-text">3</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-body card-custom info">
                                    <h5 class="card-title">Chờ thanh toán</h5>
                                    <p class="card-text">1</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-body card-custom warning">
                                    <h5 class="card-title">Đang giao hàng</h5>
                                    <p class="card-text">1</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-body card-custom danger">
                                    <h5 class="card-title">Đã hủy</h5>
                                    <p class="card-text">1</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row order-container p-3">
        
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th><input type="checkbox" id="all"></th>
                                <th>ID đơn hàng</th>
                                <th>Khách hàng</th>
                                <th>Đơn hàng</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                                <th>Tình trạng</th>
                                <th>Tính năng</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="item" items="${list}">
	                            <tr>
	                                <td><input type="checkbox" name="check1" value="1"></td>
	                                <td>${item.id}</td>
	                                <td>${item.tenNguoiNhan}</td>
	                                <td>${item.listDetail.get(0).shirt.ten}</td>
	                                <td>${item.listDetail.size()}</td>
	                                <td><fmt:formatNumber value="${item.tongTien}" type="number" pattern="#,###"/>đ</td>
	                                <td><span class="badge badge-success">${item.trangThai}</span></td>
	                                <td>
	                                    <div class="action-buttons">
	                                        <button class="btn btn-delete btn-sm trash">
	                                            <i class="fas fa-trash-alt"></i>
	                                        </button>
	                                        <a href="/WebBanAo/tuychinh?idHoaDon=${item.id}" class="btn btn-edit btn-sm edit">
		                                            <i class="fas fa-edit"></i>
	                                        </a>
	                                    </div>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



</body>
</html>

</html>