<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Phần mềm bán hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link href="adminPage.css" rel="stylesheet">
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
              <a href="/WebBanAo/AdminTrangChu" class="menu-item">Bảng điều khiển</a>
              <a href="/WebBanAo/AdminPage" class="menu-item">Quản lý sản phẩm</a>
              <a href="/WebBanAo/AdminQuanLyDonHang" class="menu-item">Quản lý đơn hàng</a>
              <a href="/WebBanAo/AdminThongKe" class="menu-item">Báo cáo doanh thu</a>
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
                  <tr>
                    <td>71390005</td>
                    <td>Bàn ăn gỗ Theresa</td>
                    <td><img src="path/to/image1.jpg" alt="Bàn ăn" style="width: 50px;"></td>
                    <td><input type="number" value="2" class="form-control" style="width: 60px;"></td>
                    <td>5,600,000 VND</td>
                  </tr>
                  <tr>
                    <td>62340003</td>
                    <td>Bàn ăn Vitali mặt đá</td>
                    <td><img src="path/to/image2.jpg" alt="Bàn ăn" style="width: 50px;"></td>
                    <td><input type="number" value="3" class="form-control" style="width: 60px;"></td>
                    <td>33,235,000 VND</td>
                  </tr>
                  <tr>
                    <td>71340032</td>
                    <td>Bàn ăn mở rộng Gepa</td>
                    <td><img src="path/to/image3.jpg" alt="Bàn ăn" style="width: 50px;"></td>
                    <td><input type="number" value="1" class="form-control" style="width: 60px;"></td>
                    <td>16,770,000 VND</td>
                  </tr>
                </tbody>
              </table>   
              <div class="mb-3 row">
                <div class="col-md-4">
                  <label class="form-label">Tạm tính tiền hàng:</label>
                  <p class="fw-bold text-danger">129,397,213 VND</p>
                </div>
                <div class="col-md-4">
                  <label for="discount" class="form-label">Giảm giá:</label>
                  <p class="fw-bold text-danger">129,397,213 VND</p>
                </div>
                <div class="col-md-4">
                  <label for="paymentMethod" class="form-label">Hình thức thanh toán:</label>
                  <input type="text" class="form-control" id="customerGender" placeholder="Thanh toán chuyển khoản" readonly>
                </div>
              </div>
  
              <div class="mb-3">
                <label for="amountPaid" class="form-label">Khách hàng đưa tiền:</label>
                <input type="number" class="form-control" id="amountPaid" placeholder="290000">
              </div>
    
              <div class="mb-3">
                <p class="fw-bold text-danger">Tổng tiền: 129,397,213 VND</p>
              </div>  
            </div>

            <!-- Thông tin thanh toán -->
            <div class="col-md-4 donhang-container">
              <h5 class="bg-primary text-white p-3">Thông tin thanh toán</h5>
              
              <form>
                <div class="mb-3">
                  <label for="customerName" class="form-label">Họ tên khách hàng</label>
                  <input type="text" class="form-control" id="customerName" placeholder="Tìm kiếm khách hàng" readonly>
                </div>
                
                <div class="mb-3">
                  <label for="customerAddress" class="form-label">Địa chỉ người mua</label>
                  <input type="text" class="form-control" id="customerAddress" placeholder="Nhập địa chỉ người mua" readonly>
                </div>
      
                <div class="mb-3 row">
                  <div class="col-md-6">
                    <label for="customerEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="customerEmail" placeholder="Nhập số Emalil" readonly>
                  </div>
                  <div class="col-md-6">
                    <label for="customerPhone" class="form-label">Số điện thoại</label>
                    <input type="tel" class="form-control" id="customerPhone" placeholder="Nhập số điện thoại" readonly>
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
                
      
                <button type="button" class="btn btn-primary w-100 mb-2">Xác nhận đơn hàng</button>
                <button type="button" class="btn btn-danger w-100 mb-2">Hủy đơn hàng</button>
                <button type="button" class="btn btn-secondary w-100">Quay về</button>
              </form>
            </div>
          </div>
          </div>
          </div>
        </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
