<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Phần mềm bán hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link href="./views/AdminPage/adminPage.css" rel="stylesheet">
</head>
<body>
  
    <div class="row">
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

      <!-- Bảng sản phẩm -->
      <div class="col-md-10">
        <div class="container mt-5">
          <div class="row gap-3">
            <!--Bang Thong Tin-->
            <div class="col-md-7 donhang-container">
              <h5 class="bg-primary text-white p-3">Thông tin đơn hàng</h5>              
              <table class="table table-bordered">
                <thead class="table-light">
                  <tr>
                    <th>Mã hàng</th>
                    <th>Tên sản phẩm</th>
                    <th>Ảnh</th>
                    <th>Số lượng</th>
                    <th>Giá bán</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach var="detail" items="${hoadon.listDetail}">
	                  <tr>
	                    <td>${detail.shirt.id}</td>
	                    <td>${detail.shirt.ten}</td>
	                    <td><img src="${detail.shirt.link}" alt="Bàn ăn" style="width: 50px;"></td>
	                    <td><input type="number" value="${detail.quantity}" class="form-control" style="width: 60px;"></td>
	                    <td><fmt:formatNumber value="${detail.gia}" type="number" pattern="#,###"/> VND</td>
	                  </tr>
                  	</c:forEach>
                </tbody>
              </table>   
              <div class="mb-3 row">
                <div class="col-md-4">
                  <label class="form-label">Tạm tính tiền hàng:</label>
                  <p class="fw-bold text-danger"><fmt:formatNumber value="${hoadon.tongTien}" type="number" pattern="#,###"/> VND</p>
                </div>
                <div class="col-md-4">
                  <label for="discount" class="form-label">Giảm giá:</label>
                  <p class="fw-bold text-danger"><fmt:formatNumber value="${hoadon.tongTien}" type="number" pattern="#,###"/> VND</p>
                </div>
                <div class="col-md-4">
                  <label for="paymentMethod" class="form-label">Hình thức thanh toán:</label>
                  <input type="text" class="form-control" id="customerGender" placeholder="${hoadon.phuongThuc}" readonly>
                </div>
              </div>
  
              <div class="mb-3">
                <label for="amountPaid" class="form-label">Khách hàng đưa tiền:</label>
                <input type="number" class="form-control" id="amountPaid" placeholder="290000">
              </div>
    
              <div class="mb-3">
                <p class="fw-bold text-danger">Tổng tiền: <fmt:formatNumber value="${hoadon.tongTien}" type="number" pattern="#,###"/> VND</p>
              </div>  
            </div>

            <!-- Thông tin thanh toán -->
            <div class="col-md-4 donhang-container">
              <h5 class="bg-primary text-white p-3">Thông tin thanh toán</h5>
              
              <div>
                <div class="mb-3">
                  <label for="customerName" class="form-label">Họ tên khách hàng</label>
                  <input type="text" class="form-control" id="customerName" placeholder="${hoadon.tenNguoiNhan}" readonly>
                </div>
                
                <div class="mb-3">
                  <label for="customerAddress" class="form-label">Địa chỉ người mua</label>
                  <input type="text" class="form-control" id="customerAddress" placeholder="${hoadon.diaChi}" readonly>
                </div>
      
                <div class="mb-3 row">
                  <div class="col-md-6">
                    <label for="customerEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="customerEmail" placeholder="Nhập số Emalil" readonly>
                  </div>
                  <div class="col-md-6">
                    <label for="customerPhone" class="form-label">Số điện thoại</label>
                    <input type="tel" class="form-control" id="customerPhone" placeholder="${hoadon.sdtNguoiNhan}" readonly>
                  </div>
                </div>

                <div class="mb-3 row">
                  <div class="col-md-6">
                    <label for="customerGender" class="form-label">Giới tính</label>
                    <input type="text" class="form-control" id="customerGender" placeholder="Nam" readonly>
                  </div>
                  <div class="col-md-6">
                    <label for="customerDOB" class="form-label">Ngày sinh</label>
                    <input type="date" class="form-control" id="customerDOB" readonly>
                  </div>
                  
                </div>
                <div class="mb-3">
                </div>
                <div class="mb-3">
                  <label for="orderNotes" class="form-label">Ghi chú đơn hàng</label>
                  <textarea class="form-control" id="orderNotes" rows="3" placeholder="Ghi chú thêm đơn hàng" readonly></textarea>
                </div>
                
      			<form action="/WebBanAo/quanly" method="post">
                	<input type="hidden" name="trangthai" value="Đã xác nhận chờ giao hàng">
                	<input type="hidden" name="idHoaDon" value="${hoadon.id}">
                	<button type="submit" class="btn btn-primary w-100 mb-2" ${hoadon.trangThai == 'Đã xác nhận chờ giao hàng' ? 'disabled' : ''}>Xác nhận đơn hàng</button>
                </form>
                
                <form action="/WebBanAo/quanly" method="post">
                	<input type="hidden" name="trangthai" value="Đã hủy">
                	<input type="hidden" name="idHoaDon" value="${hoadon.id}">
                	<button type="submit" class="btn btn-danger w-100 mb-2" ${hoadon.trangThai == 'Đã hủy' ? 'disabled' : ''}>Hủy đơn hàng</button>
                </form>
                <a type="button" href="/WebBanAo/quanly" class="btn btn-secondary w-100">Quay về</a>
              </div>
            </div>
          </div>
          </div>
          </div>
        </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
