<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="./views/AdminPage/adminPage.css" rel="stylesheet">
</head>
<body>

    <div class="row">
        <!-- Sidebar -->
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

        <!-- Main Content -->
        <main class="col-md-10">
            <div class="container my-4">
                <h2>Bảng Điều Khiển</h2>
                
                <!-- Thẻ thống kê -->
                <div class="row g-4 my-4">
                    <div class="col-md-3">
                        <div class="card card-custom success p-3">
                            <h5>Tổng Khách Hàng</h5>
                            <p>56 khách hàng</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-custom info p-3">
                            <h5>Tổng Sản Phẩm</h5>
                            <p>1850 sản phẩm</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-custom warning p-3">
                            <h5>Tổng Đơn Hàng</h5>
                            <p>247 đơn hàng</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card card-custom danger p-3">
                            <h5>Sắp Hết Hàng</h5>
                            <p>34 sản phẩm</p>
                        </div>
                    </div>
                </div>

                <!-- Tình trạng đơn hàng -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5>Tình trạng đơn hàng</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>AL3947</td>
                                    <td>Phạm Thị Ngọc</td>
                                    <td>10,770,000 đ</td>
                                    <td><span class="badge bg-primary">Chờ xử lý</span></td>
                                </tr>
                                <tr>
                                    <td>ER3853</td>
                                    <td>Nguyễn Thị Mỹ Yến</td>
                                    <td>16,770,000 đ</td>
                                    <td><span class="badge bg-warning text-dark">Đang vận chuyển</span></td>
                                </tr>
                                <tr>
                                    <td>MD0837</td>
                                    <td>Trần Thanh Phú</td>
                                    <td>12,500,000 đ</td>
                                    <td><span class="badge bg-success">Hoàn thành</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Khách hàng mới -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5>Khách hàng mới</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên khách hàng</th>
                                    <th>Ngày sinh</th>
                                    <th>Điện thoại</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#183</td>
                                    <td>Hữu Võ Tuấn</td>
                                    <td>21/07/1996</td>
                                    <td>090-123-4567</td>
                                </tr>
                                <tr>
                                    <td>#184</td>
                                    <td>Nguyễn Văn Bảo</td>
                                    <td>12/04/1998</td>
                                    <td>091-234-5678</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- Placeholder for charts (Add your charts library here) -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Dữ liệu 6 tháng đầu vào</h5>
                            </div>
                            <div class="card-body">
                                <p>Biểu đồ ở đây</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Thống kê 6 tháng doanh thu</h5>
                            </div>
                            <div class="card-body">
                                <p>Biểu đồ ở đây</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</body>
</html>
