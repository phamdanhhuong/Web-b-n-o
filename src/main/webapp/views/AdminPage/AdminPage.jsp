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
	    <a class="navbar-brand" href="home">Shop</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav ms-auto">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/WebBanAo/home">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/WebBanAo/quanly">Quản lý đơn hàng</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/WebBanAo">Logout</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container d-flex flex-wrap gap-3 p-3">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">
		  Thêm mới sản phẩm
		</button>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Mã sản phẩm</th>
		      <th scope="col">Tên sản phẩm</th>
		      <th scope="col">Ảnh</th>
		      <th scope="col">Giá</th>
		      <th scope="col">Loại</th>
		      <th scope="col">Sửa</th>
		      <th scope="col">Xóa</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="item" items="${list}"> 
		    	<tr>
			      <th scope="row">${item.id}</th>
			      <td>${item.ten}</td>
			      <td><img src="${item.link}" width="100" height="auto"></td>
			      <td>${item.gia}</td>
			      <td>${item.loai}</td>
			      <td>
	              	<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editModal" 
	              		data-id="${item.id}"
			          data-ten="${item.ten}"
			          data-link="${item.link}"
			          data-gia="${item.gia}"
			          data-loai="${item.loai}"
			          data-mota="${item.mota}">
					    Sửa
					</button>
			      </td>
			      <td>
			      	<form action="/WebBanAo/admin" method="post">
	              		<input type="hidden" name="id" value="${item.id}">
	              		<input type="hidden" name="_method" value="delete">
	              		<input type="submit" class="btn btn-danger" value="Xóa">
	              	</form>
			      </td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	
	

	<!-- Modal edit-->
	<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="editModalLabel">Chỉnh sửa sản phẩm</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="/WebBanAo/admin" method="post">
				<div class="mb-3">
				  <label for="edit-id" class="form-label">Mã sản phẩm</label>
				  <input type="text" name="id" class="form-control" id="edit-id" readonly>
				</div>
				<div class="mb-3">
				  <label for="edit-ten" class="form-label">Tên sản phẩm</label>
				  <input type="text" name="ten" class="form-control" id="edit-ten">
				</div>
				<div class="mb-3">
				  <label for="edit-link" class="form-label">Link ảnh</label>
				  <input type="text" name="link" class="form-control" id="edit-link">
				</div>
				<div class="mb-3">
				  <label for="edit-gia" class="form-label">Giá</label>
				  <input type="number" name="gia" class="form-control" id="edit-gia">
				</div>
				<div class="mb-3">
				  <label for="edit-loai" class="form-label">Loại</label>
				  <input type="text" name="loai" class="form-control" id="edit-loai">
				</div>
				<div class="mb-3">
				  <label for="edit-mota" class="form-label">Mô tả</label>
				  <textarea name="mota" class="form-control" id="edit-mota"></textarea>
				</div>
				<input type="hidden" name="_method" value="put">
				<input type="submit" class="btn btn-primary" value="Save changes">
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal add-->
	<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="addModalLabel">Thêm mới sản phẩm</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			<form action="/WebBanAo/admin" method="post">
				<div class="mb-3">
				  <label class="form-label">Tên sản phẩm</label>
				  <input type="text" name="ten" class="form-control" >
				</div>
				<div class="mb-3">
				  <label class="form-label">Link ảnh</label>
				  <input type="text" name="link" class="form-control" >
				</div>
				<div class="mb-3">
				  <label class="form-label">Giá</label>
				  <input type="number" name="gia" class="form-control" >
				</div>
				<div class="mb-3">
				  <label  class="form-label">Loại</label>
				  <input type="text" name="loai" class="form-control" >
				</div>
				<div class="mb-3">
				  <label class="form-label">Mô tả</label>
				  <textarea name="mota" class="form-control" ></textarea>
				</div>
				<input type="hidden" name="_method" value="post">
				<input type="submit" class="btn btn-primary" value="Save">
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	      </div>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	  // Lắng nghe sự kiện khi modal chỉnh sửa được hiển thị
	  $('#editModal').on('show.bs.modal', function (event) {
	    // Lấy nút mà đã kích hoạt modal
	    var button = $(event.relatedTarget);
	    
	    // Lấy các giá trị từ các thuộc tính data-* của nút
	    var id = button.data('id');
	    var ten = button.data('ten');
	    var link = button.data('link');
	    var gia = button.data('gia');
	    var loai = button.data('loai');
	    var mota = button.data('mota');
	    
	    // Lấy modal
	    var modal = $(this);
	
	    // Điền các giá trị vào các trường trong modal
	    modal.find('#edit-id').val(id);
	    modal.find('#edit-ten').val(ten);
	    modal.find('#edit-link').val(link);
	    modal.find('#edit-gia').val(gia);
	    modal.find('#edit-loai').val(loai);
	    modal.find('#edit-mota').val(mota);
	  });
	</script>
</body>
</html>