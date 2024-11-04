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

    <div class="d-flex flex-wrap gap-3 p-3 mt-5 row justify-content-center">
	    <div class="d-flex justify-content-around">
	        <div style="width: 50%; min-height: 1000px;" class="col-6">
			    <div class="d-flex justify-content-between align-items-end border-bottom pb-3 mb-4">
			        <span class="fs-4 fw-bold">Giỏ hàng:</span>
			        <span class="fs-5">Số sản phẩm: ${quantity}</span>
			    </div>
			
			    <c:forEach var="item" items="${list}">
			        <div class="cart-item d-flex mt-4 p-3 border rounded shadow-sm">
			            <img src="${item.shirt.link}" class="img-fluid" style="width: auto; height: 200px;">
			            <div class="ms-3 flex-grow-1">
			                <p class="fw-medium fs-5">${item.shirt.ten}</p>                   
			                <form action="/WebBanAo/cart" method="post">
			                    <div class="d-flex flex-column">
			                        <select class="form-select mb-3" id="combo-box" name="size-option" style="width: 150px;">
			                            <option value="S" ${item.cart.size == 'S' ? 'selected' : ''}>S</option>
			                            <option value="M" ${item.cart.size == 'M' ? 'selected' : ''}>M</option>
			                            <option value="L" ${item.cart.size == 'L' ? 'selected' : ''}>L</option>
			                            <option value="XL" ${item.cart.size == 'XL' ? 'selected' : ''}>XL</option>
			                        </select>
			                        
			                        <label for="quantity${item.cart.id}" class="mt-3 fw-bold">Số lượng:</label>
			                        <div class="quantity-selector d-flex align-items-center border rounded-pill mt-1 mb-3" style="width: 150px;">
			                            <button type="button" onclick="decrease(${item.cart.id})"
			                                    class="btn btn-light border-0 rounded-start-pill">-</button>
			                            <input type="text" id="quantity${item.cart.id}" name="quantity" value="${item.cart.quantity}"
			                                   class="form-control text-center border-0" readonly>
			                            <button type="button" onclick="increase(${item.cart.id})"
			                                    class="btn btn-light border-0 rounded-end-pill">+</button>
			                        </div>
			                        
			                        <input type="hidden" name="_method" value="put">
			                        <input type="hidden" name="idCart" value="${item.cart.id}">
			                        <input type="submit" class="btn btn-primary mt-2 save-btn" value="Save">
			                    </div>
			                </form>
			            </div>
			
			            <form class="delete-form" action="/WebBanAo/cart" method="post">
			                <input type="hidden" name="_method" value="delete">
			                <input type="hidden" name="idCart" value="${item.cart.id}">
			                <input type="submit" class="btn btn-warning text-white fw-bold delete-btn" value="Xóa">
			            </form>
			        </div>
			    </c:forEach>
			</div>


	        <div style="width: 35%; min-height: 1000px;" class="my-4 col-4">
	        	<form action="/WebBanAo/hoadon" method="post">
	                <div class="card p-4">
		                  <h5>Thông tin đơn hàng</h5>
		                  <div class="mb-3">
		                    <p>Tạm tính: <span class="float-end">${tamtinh}₫</span></p>
		                    <p>Giảm giá: <span class="float-end">0₫</span></p>
		                    <p class="total-text">Tổng cộng: <span class="float-end">${tamtinh}₫</span></p>
		                  </div>
		            
		                  <h6>🚚 Ước tính thời gian giao hàng</h6>
		                  <div class="row mb-3">
		                    <div class="col">
		                      <select class="form-select" name="thanhpho" id="thanhpho" aria-label="Chọn tỉnh/thành phố" onchange="updateDistricts()">
		                        <option selected>Chọn tỉnh/thành phố</option>
		                        <option value="Hà Nội">Hà Nội</option>
		                        <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
		                        <!-- Thêm các tỉnh/thành phố khác -->
		                      </select>
		                    </div>
		                    <div class="col">
		                      <select class="form-select" name="quan" id="quan" aria-label="Chọn Quận/huyện">
		                        <option selected>Chọn Quận/huyện</option>
		                      </select>
		                    </div>
		                  </div>
		                  <div class="row mb-3">
		                  	<div class="col">
		                      <input type="text" class="form-control" placeholder="Địa chỉ cụ thể" name="diachicuthe">
		                    </div>	            	  	
		            	  </div>
		                  <h6>Phương thức thanh toán</h6>
		            	  <div class="row mb-3">
		            	  	<div class="col">
		                      <select class="form-select" name="phuongthuc">
		                        <option selected value="Tiền mặt">Tiền mặt</option>
		                        <option value="Thẻ tín dụng">Thẻ tín dụng</option>		                      
		                      </select>
		                    </div>
		            	  </div>
		                  <a href="#" class="text-primary">Mã Giảm Giá</a>
		            
		                  <h6 class="mt-3">Ghi chú đơn hàng</h6>
		                  <textarea class="form-control mb-3" placeholder="Ghi chú"></textarea>
		                  <input type="text" class="form-control mb-3" placeholder="Nhập mã khuyến mãi (nếu có)">
		            
		                  <input type="submit" class="btn btn-primary w-100 mb-2" value="THANH TOÁN NGAY">
		                  <a href="#" class="text-decoration-none text-secondary d-block text-center">⟵ Tiếp tục mua hàng</a>
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
    <script>
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