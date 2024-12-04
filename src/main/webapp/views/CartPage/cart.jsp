<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">    
    <link href="views/HomePage/HomePage.css" type="text/css" rel="stylesheet">
    <title>Insert title here</title>
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
/* Style cho tiêu đề */
h2 {
    color: #4CAF50; /* Màu xanh lá cho tiêu đề */
    font-family: 'Arial', sans-serif;
    font-size: 24px;
}

/* Style cho nội dung thông báo */
p {
    font-size: 18px;
    color: #555;
}

</style>
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

	                <li class="nav-item">
	                    <a class="nav-link active" aria-current="page" href="home">
	                        <i class="fas fa-home"></i> Home
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/WebBanAo/theodoi">
	                        <i class="fas fa-box"></i> Theo dõi đơn hàng
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

	<div id="toast_"></div>
    <div class="d-flex flex-wrap gap-3 p-3 mt-5 row justify-content-center">
	    <div class="d-flex justify-content-around mb-5">
	        <div style="width: 50%; height: 79vh;  border-radius: 15px; background-color: #fff; padding: 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);" class="col-6">
			    <div class="d-flex justify-content-between align-items-end border-bottom pb-3 mb-4">
			        <span class="fs-4 fw-bold">Giỏ hàng:</span>
			        <span class="fs-5">Số sản phẩm: ${quantity}</span>
			    </div>
				<c:if test="${empty list}">
				    <div class="alert alert-info text-center p-4 rounded shadow" style="font-family: 'Avenir', sans-serif;">
				        <!-- Shopping Cart Icon -->
				        <i class="bi bi-cart-x text-warning fs-1"></i>
				        
				        <!-- Title with emoji and icon -->
				        <p class="fw-bold fs-4 mt-3 text-primary">Không có đơn hàng nào trong giỏ hàng! <span class="text-danger">🛒</span></p>
				        
				        <!-- Descriptive text with a shopping bag icon -->
				        <p class="text-muted">
				            Giỏ hàng của bạn đang trống. <span class="text-success">Hãy thêm các sản phẩm yêu thích vào giỏ hàng để tiếp tục mua sắm.</span>
				            <i class="bi bi-bag-check-fill text-info"></i>
				        </p>
				
				
				        <!-- Optional button with an arrow icon -->
				        <a href="home" class="btn btn-primary mt-3" style="font-family: 'Avenir', sans-serif;">
				            Tiếp tục mua sắm <i class="bi bi-arrow-right-circle"></i>
				        </a>
				    </div>
				</c:if>

				<div class="p-3" style="height: 65vh; overflow-y: auto;">
				    <c:forEach var="item" items="${list}">
					    <div class="cart-item d-flex flex-column flex-lg-row align-items-center mt-4 p-4 border rounded shadow-sm bg-white">
						    <!-- Hình ảnh sản phẩm -->
						    <img src="${item.shirt.link}" alt="${item.shirt.ten}" 
						         class="img-fluid rounded" style="width: 120px; height: auto; object-fit: cover;">
						
						    <!-- Thông tin sản phẩm -->
						    <div class="ms-lg-4 mt-3 mt-lg-0 flex-grow-1">
						        <!-- Tên sản phẩm -->
						        <h5 class="fw-bold text-dark mb-1">${item.shirt.ten}</h5>
						        
						        <!-- Giá sản phẩm -->
						        <p class="text-success fw-bold fs-5 mb-1">Giá: ${item.shirt.gia} VNĐ</p>
						
						        <!-- Loại và thương hiệu -->
						        <div class="d-flex flex-column flex-md-row mb-1">
						            <p class="fw-bold text-secondary me-md-4 mb-2 mb-md-0">
						                <i class="fas fa-tags text-primary"></i> Loại: 
						                <span class="text-dark">${item.shirt.loai}</span>
						            </p>
						            <p class="fw-bold text-secondary">
						                <i class="fas fa-industry text-primary"></i> Thương hiệu: 
						                <span class="text-dark">${item.shirt.thuongHieu}</span>
						            </p>
						        </div>
						
						        <!-- Form cập nhật sản phẩm -->
						        <form action="/WebBanAo/cart" method="post" class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
						            <!-- Dropdown chọn size -->
						            <div class="me-md-4 mb-3 mb-md-0 mt-0">
						                <label for="combo-box${item.cart.id}" class="form-label fw-bold text-secondary">Chọn size:</label>
						                <select class="form-select form-select-sm" id="combo-box${item.cart.id}" name="size-option" style="width: 120px; height:51px">
						                    <option value="S" ${item.cart.size == 'S' ? 'selected' : ''}>S</option>
						                    <option value="M" ${item.cart.size == 'M' ? 'selected' : ''}>M</option>
						                    <option value="L" ${item.cart.size == 'L' ? 'selected' : ''}>L</option>
						                    <option value="XL" ${item.cart.size == 'XL' ? 'selected' : ''}>XL</option>
						                </select>
						            </div>
						
						            <!-- Điều chỉnh số lượng -->
						            <div class="me-md-4">
						                <label for="quantity${item.cart.id}" class="form-label fw-bold text-secondary">Số lượng:</label>
						                <div class="quantity-control d-flex align-items-center border rounded-pill" style="width: 150px;">
						                    <button type="button" onclick="decrease(${item.cart.id})" class="btn btn-outline-secondary rounded-pill px-3">-</button>
						                    <input type="text" id="quantity${item.cart.id}" name="quantity" value="${item.cart.quantity}" 
						                           class="form-control text-center border-0" readonly>
						                    <button type="button" onclick="increase(${item.cart.id})" class="btn btn-outline-secondary rounded-pill px-3">+</button>
						                </div>
						            </div>
						
						            <!-- Nút cập nhật (biểu tượng) -->
						            <div class="mt-4">
						                <input type="hidden" name="_method" value="put">
						                <input type="hidden" name="idCart" value="${item.cart.id}">
						                <button type="submit" class="btn btn-primary fw-bold mt-3 mt-md-0">
						                    <i class="fas fa-save"></i>
						                </button>
						            </div>
						        </form>
						    </div>
						
						    <!-- Nút xóa (biểu tượng) -->
						    <form class="delete-form ms-lg-3 mt-3 mt-lg-0" action="/WebBanAo/cart" method="post">
						        <input type="hidden" name="_method" value="delete">
						        <input type="hidden" name="idCart" value="${item.cart.id}">
						        <button type="submit" class="btn btn-danger fw-bold">
						            <i class="fas fa-trash-alt"></i>
						        </button>
						    </form>
						</div>
					</c:forEach>
				</div>
			</div>


	        <div style="width: 35%;  height: 79vh;  border-radius: 15px; padding: 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);" class="col-4">
			    <form action="/WebBanAo/hoadon" method="post" id="formThanhToan" onsubmit="return validateForm()">
			        <div class="card p-4 border" style="padding: 20px; border-radius: 15px; background-color: #ffffff;">
			            <!-- Tiêu đề -->
			            <h5 class="fw-bold text-primary mb-4">Thông tin đơn hàng</h5>
			            
			            <!-- Tạm tính, Giảm giá, Tổng cộng -->
			            <div class="mb-4">
			                <p class="d-flex justify-content-between mb-2">
			                    <span class="text-secondary">Tạm tính:</span>
			                    <span class="fw-bold">${tamtinh}₫</span>
			                </p>
			                <p class="d-flex justify-content-between mb-2">
			                    <span class="text-secondary">Giảm giá:</span>
			                    <span class="fw-bold text-danger">0₫</span>
			                </p>
			                <p class="d-flex justify-content-between mb-0 total-text" style="font-size: 1.25rem;">
			                    <span class="text-dark">Tổng cộng:</span>
			                    <span class="fw-bold text-success">${tamtinh}₫</span>
			                </p>
			            </div>
			
			            <div class="row mb-3">
			                <div class="col">
			                    <select class="form-select form-select-sm" name="thanhpho" id="thanhpho" aria-label="Chọn tỉnh/thành phố" onchange="updateDistricts()">
			                        <option selected>Chọn tỉnh/thành phố</option>
			                        <option value="Hà Nội">Hà Nội</option>
			                        <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
			                        <!-- Thêm các tỉnh/thành phố khác -->
			                    </select>
			                </div>
			                <div class="col">
			                    <select class="form-select form-select-sm" name="quan" id="quan" aria-label="Chọn Quận/huyện">
			                        <option selected>Chọn Quận/huyện</option>
			                    </select>
			                </div>
			            </div>
			            <div class="mb-4">
			                <input type="text" class="form-control form-control-sm mb-4" id="diachicuthe" name="diachicuthe" placeholder="Địa chỉ cụ thể">
			            </div>
			
			            <!-- Tên và số điện thoại -->
			            <h6 class="fw-bold text-primary mb-3">Thông tin người nhận</h6>
			            <input type="text" class="form-control form-control-sm mb-3" id="tenNguoiNhan" name="tenNguoiNhan" placeholder="Tên người nhận">
						<input type="text" class="form-control form-control-sm mb-4" id="sdt" name="sdt" placeholder="Số điện thoại người nhận">
			
			            <!-- Phương thức thanh toán -->
			            <h6 class="fw-bold text-primary mb-3">Phương thức thanh toán</h6>
			            <select class="form-select form-select-sm mb-4" name="phuongthuc">
			                <option selected value="Tiền mặt">Tiền mặt</option>
			                <option value="Thẻ tín dụng">Thẻ tín dụng</option>
			            </select>
			
			            <!-- Nút thanh toán -->
			            <button type="submit" class="btn btn-primary w-100 fw-bold py-2 mb-3" style="font-size: 1rem; border-radius: 30px;">THANH TOÁN NGAY</button>
			            <a href="home" class="text-decoration-none text-secondary d-block text-center">
			                ⟵ Tiếp tục mua hàng
			            </a>
			        </div>
			    </form>
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
	    function validateForm() {
	        var tenNguoiNhan = document.getElementById("tenNguoiNhan").value;
	        var sdt = document.getElementById("sdt").value;
	        var diachicuthe = document.getElementById("diachicuthe").value;
	        var thanhpho = document.getElementById("thanhpho").value;
	        var quan = document.getElementById("quan").value;
	        
	        // Kiểm tra xem các trường có đủ thông tin không
	        if (!tenNguoiNhan || !sdt || !diachicuthe || thanhpho === "Chọn tỉnh/thành phố" || quan === "Chọn Quận/huyện") {
	            alert("Vui lòng điền đầy đủ thông tin!");
	            return false; // Dừng form submit
	        } else {
	            // Hiển thị modal thông báo thành công
	            showSuccessToast("Thanh toán đơn hàng thành công, Hãy đợi 3s để hoàn tất thanh toán!");
	            
	            // Dừng 3 giây trước khi submit form
	            setTimeout(function() {
	                // Tiến hành submit form sau 3 giây
	                document.getElementById("formThanhToan").submit(); 
	            }, 3000); // 3000 milliseconds = 3 seconds
	            
	            return false; // Ngừng submit form ngay lập tức để chờ 3 giây
	        }
	    }


        function decrease(id) {
            var quantityInput = document.getElementById('quantity'+id);
            var currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        }

        function increase(id) {
            var quantityInput = document.getElementById('quantity'+id);
            var currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        }
        
        
        function updateDistricts() {
            // Lấy phần tử select của thành phố và quận/huyện
            const citySelect = document.getElementById("thanhpho");
            const districtSelect = document.getElementById("quan");
            
            // Xóa các tùy chọn quận/huyện hiện có
            districtSelect.innerHTML = '<option selected>Chọn Quận/huyện</option>';

            // Lấy giá trị của tỉnh/thành phố được chọn
            const city = citySelect.value;

            // Tạo các danh sách quận/huyện theo từng thành phố
            const districtsByCity = {
           		"Hà Nội": [
           	        { value: "Quận Ba Đình", text: "Quận Ba Đình" },
           	        { value: "Quận Hoàn Kiếm", text: "Quận Hoàn Kiếm" },
           	        { value: "Quận Tây Hồ", text: "Quận Tây Hồ" },
           	        { value: "Quận Long Biên", text: "Quận Long Biên" },
           	        { value: "Quận Cầu Giấy", text: "Quận Cầu Giấy" },
           	        { value: "Quận Đống Đa", text: "Quận Đống Đa" },
           	        { value: "Quận Hai Bà Trưng", text: "Quận Hai Bà Trưng" },
           	        { value: "Quận Hoàng Mai", text: "Quận Hoàng Mai" },
           	        { value: "Quận Thanh Xuân", text: "Quận Thanh Xuân" },
           	        { value: "Huyện Sóc Sơn", text: "Huyện Sóc Sơn" },
           	        { value: "Huyện Đông Anh", text: "Huyện Đông Anh" },
           	        { value: "Huyện Gia Lâm", text: "Huyện Gia Lâm" },
           	        { value: "Quận Nam Từ Liêm", text: "Quận Nam Từ Liêm" },
           	        { value: "Quận Bắc Từ Liêm", text: "Quận Bắc Từ Liêm" },
           	        { value: "Huyện Mê Linh", text: "Huyện Mê Linh" },
           	        { value: "Quận Hà Đông", text: "Quận Hà Đông" },
           	        { value: "Thị xã Sơn Tây", text: "Thị xã Sơn Tây" },
           	        { value: "Huyện Ba Vì", text: "Huyện Ba Vì" },
           	        { value: "Huyện Phúc Thọ", text: "Huyện Phúc Thọ" },
           	        { value: "Huyện Đan Phượng", text: "Huyện Đan Phượng" },
           	        { value: "Huyện Hoài Đức", text: "Huyện Hoài Đức" },
           	        { value: "Huyện Quốc Oai", text: "Huyện Quốc Oai" },
           	        { value: "Huyện Thạch Thất", text: "Huyện Thạch Thất" },
           	        { value: "Huyện Chương Mỹ", text: "Huyện Chương Mỹ" },
           	        { value: "Huyện Thanh Oai", text: "Huyện Thanh Oai" },
           	        { value: "Huyện Thường Tín", text: "Huyện Thường Tín" },
           	        { value: "Huyện Phú Xuyên", text: "Huyện Phú Xuyên" },
           	        { value: "Huyện Ứng Hòa", text: "Huyện Ứng Hòa" },
           	        { value: "Huyện Mỹ Đức", text: "Huyện Mỹ Đức" }
           	      ],
           	      "TP. Hồ Chí Minh": [
           	        { value: "Quận 1", text: "Quận 1" },
           	        { value: "Quận 2", text: "Quận 2" },
           	        { value: "Quận 3", text: "Quận 3" },
           	        { value: "Quận 4", text: "Quận 4" },
           	        { value: "Quận 5", text: "Quận 5" },
           	        { value: "Quận 6", text: "Quận 6" },
           	        { value: "Quận 7", text: "Quận 7" },
           	        { value: "Quận 8", text: "Quận 8" },
           	        { value: "Quận 9", text: "Quận 9" },
           	        { value: "Quận 10", text: "Quận 10" },
           	        { value: "Quận 11", text: "Quận 11" },
           	        { value: "Quận 12", text: "Quận 12" },
           	        { value: "Quận Bình Thạnh", text: "Quận Bình Thạnh" },
           	        { value: "Quận Tân Bình", text: "Quận Tân Bình" },
           	        { value: "Quận Tân Phú", text: "Quận Tân Phú" },
           	        { value: "Quận Phú Nhuận", text: "Quận Phú Nhuận" },
           	        { value: "Quận Gò Vấp", text: "Quận Gò Vấp" },
           	        { value: "Thành phố Thủ Đức", text: "Thành phố Thủ Đức" },
           	        { value: "Quận Bình Tân", text: "Quận Bình Tân" },
           	        { value: "Huyện Hóc Môn", text: "Huyện Hóc Môn" },
           	        { value: "Huyện Củ Chi", text: "Huyện Củ Chi" },
           	        { value: "Huyện Nhà Bè", text: "Huyện Nhà Bè" },
           	        { value: "Huyện Bình Chánh", text: "Huyện Bình Chánh" },
           	        { value: "Huyện Cần Giờ", text: "Huyện Cần Giờ" }
		      ]
		    };

            // Lấy danh sách quận/huyện tương ứng với thành phố đã chọn
            const districts = districtsByCity[city] || [];

            // Thêm các tùy chọn quận/huyện vào select của quận/huyện
            districts.forEach(district => {
              const option = document.createElement("option");
              option.value = district.value;
              option.text = district.text;
              districtSelect.appendChild(option);
            });
          }
    </script>
</body>

</html>