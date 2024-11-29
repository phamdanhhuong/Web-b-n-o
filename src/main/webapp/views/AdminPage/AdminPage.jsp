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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <link href="./views/AdminPage/adminPage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
      <div class="col-md-2">
        <div class="sidebar">
          <div class="profile">
              <i class="fas fa-store"></i> 
              <p>Danh Hưởng</p>
              <small>Chào mừng bạn trở lại</small>
          </div>
          <div class="menu">
             <a href="/WebBanAo/home" class="menu-item">Bảng điều khiển</a>
             <a href="/WebBanAo/admin" class="menu-item">Quản lý sản phẩm</a>
             <a href="/WebBanAo/quanly" class="menu-item">Quản lý đơn hàng</a>
             <a href="/WebBanAo" class="menu-item">Logout</a>
          </div>
        </div>
      </div>
      <div class="col-md-9 p-3 ms-5">
			<!-- Button trigger modal -->
			<div class="thongke-container d-flex flex-wrap mb-3">
				<button type="button" class="btn btn-edit w-100 mb-2" data-bs-toggle="modal" data-bs-target="#addModal">
				  Thêm mới sản phẩm
				</button>
			</div>
			<div class="thongke-container d-flex flex-wrap p-3"  style="max-height: 85vh; overflow-y: auto; width: 100%">
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
			              	<button type="button" class="btn btn-edit w-100 mb-2" data-bs-toggle="modal" data-bs-target="#editModal" 
			              		data-id="${item.id}"
					          data-ten="${item.ten}"
					          data-link="${item.link}"
					          data-gia="${item.gia}"
					          data-loai="${item.loai}"
					          data-mota="${item.mota}"
					          data-thuonghieu="${item.thuongHieu}"
					          data-xuatxu="${item.xuatXu}"
					          data-chatlieu="${item.chatLieu}"
					          data-mau="${item.mau}"
					          data-tonkho="${item.tonKho}">
							    Sửa
							</button>
					      </td>
					      <td>
					      	<form action="/WebBanAo/admin" method="post" onsubmit="return confirmDelete()">
			              		<input type="hidden" name="id" value="${item.id}">
			              		<input type="hidden" name="_method" value="delete">
			              		<input type="submit" class="btn btn-delete w-100 mb-2" value="Xóa">
			              	</form>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				</div>
		</div>
		
		
	
		<!-- Modal edit-->
		<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <form action="/WebBanAo/admin" method="post">
		        <div class="modal-header">
		          <h1 class="modal-title fs-5" id="editModalLabel">Chỉnh sửa sản phẩm</h1>
		          <div class="text-end d-flex gap-3 mt-4">
		            <input type="hidden" name="_method" value="put">
		            <button type="submit" class="btn btn-edit w-100 mb-2">Lưu</button>
		            <button type="button" class="btn btn-delete w-100 mb-2" data-bs-dismiss="modal">Đóng</button>
		          </div>
		        </div>
		        <div class="modal-body">
		          <div class="container">
		            <div class="row">
		              <!-- Left Column -->
		              <div class="col-8 bg-light p-2 me-5 donhang-container">
		                <h4>Thông tin sản phẩm</h4>
		                <div>
		                  <label class="form-label">Mã sản phẩm</label>
		                  <input type="text" name="id" class="form-control" placeholder="Mã sản phẩm" readonly id="edit-id">
		                </div>
		                <div>
		                  <label class="form-label">Tên sản phẩm</label>
		                  <input type="text" name="ten" class="form-control" placeholder="Nhập tên sản phẩm" id="edit-ten">
		                </div>
		                <div>
		                  <label class="form-label">Mô tả</label>
		                  <textarea name="mota" class="form-control" rows="3" placeholder="Nhập mô tả sản phẩm" id="edit-mota"></textarea>
		                </div>
		              </div>
		              <!-- Right Column -->
		              <div class="col-3 bg-light p-2 donhang-container">
		                <div>
		                  <img src="" id="edit-image-preview" class="img-thumbnail mr-3" style="width: 170px; height: auto;">
		                  <label class="form-label">Link ảnh</label>
		                  <input type="text" name="link" class="form-control" placeholder="Nhập link ảnh sản phẩm" id="edit-link">
		                </div>
		              </div>
		            </div>
		            <!-- Additional Information -->
		            <div class="row mt-4 bg-light donhang-container">
		              <h4>Thông tin bổ sung</h4>
		              <div class="row">
		                <div class="col-md-6">
		                  <label class="form-label">Loại</label>
		                  <input type="text" name="loai" class="form-control" placeholder="Nhập loại sản phẩm" id="edit-loai">
		                </div>
		                <div class="col-md-6">
		                  <label class="form-label">Thương hiệu</label>
		                  <input type="text" name="thuongHieu" class="form-control" placeholder="Nhập thương hiệu" id="edit-thuongHieu">
		                </div>
		              </div>
		              <div class="row mt-3">
		                <div class="col-md-6">
		                  <label class="form-label">Xuất xứ</label>
		                  <input type="text" name="xuatXu" class="form-control" placeholder="Nhập xuất xứ" id="edit-xuatXu">
		                </div>
		                <div class="col-md-6">
		                  <label class="form-label">Chất liệu</label>
		                  <input type="text" name="chatLieu" class="form-control" placeholder="Nhập chất liệu" id="edit-chatLieu">
		                </div>
		              </div>
		              <div class="row mt-3">
		                <div class="col-md-6">
		                  <label class="form-label">Màu (mã HEX)</label>
		                  <input type="text" name="mau" class="form-control" placeholder="Nhập màu sản phẩm (HEX)" id="edit-mau">
		                </div>
		              </div>
		              <div class="row mt-3">
		                <div class="col-md-6">
		                  <label class="form-label">Giá</label>
		                  <input type="number" name="gia" class="form-control" placeholder="Nhập giá sản phẩm" id="edit-gia">
		                </div>
		                <div class="col-md-6">
		                  <label class="form-label">Tồn kho</label>
		                  <input type="number" name="tonKho" class="form-control" placeholder="Nhập số lượng tồn kho" id="edit-tonKho">
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>

		
		<!-- Modal add-->	
		<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true"">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
	        <form action="/WebBanAo/admin" method="post">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="addModalLabel">Thêm mới sản phẩm</h1>
		          <div class="text-end d-flex gap-3 mt-4">
		            <input type="hidden" name="_method" value="post">
		            <button type="submit" class="btn btn-edit w-100 mb-2">Lưu</button>
		            <button type="button" class="btn btn-delete w-100 mb-2" data-bs-dismiss="modal">Đóng</button>
		          </div>
		      </div>
		      <div class="modal-body">
		        <div class="container">
		        	<div class="row">			        
			        	<div class="col-8 bg-light p-2 me-5 donhang-container">,
		          			<!-- General Information -->
				            <h4>Thông tin sản phẩm</h4>
				            <div>
				                <label class="form-label">Tên sản phẩm</label>
				                <input type="text" name="ten" class="form-control" placeholder="Nhập tên sản phẩm">
				            </div>
				            <div>
				                <label class="form-label">Mô tả</label>
				                <textarea name="mota" class="form-control" rows="3" placeholder="Nhập mô tả sản phẩm"></textarea>
			              	</div>
			        	</div>
				        <div class="col-3 bg-light p-2 donhang-container">
				            <div>
			                    <img src=""  class="img-thumbnail mr-3" style="width: 170px; height: auto;">
				                <label class="form-label">Link ảnh</label>
				                <input type="text" name="link" class="form-control" placeholder="Nhập link ảnh sản phẩm">
		                    </div>
				        </div>	
		          </div>		
		          <!-- Additional Information -->
		          <div class="row mt-4 bg-light donhang-container">
		            <h4>Thông tin bổ sung</h4>
		            <div class="row">
		              <div class="col-md-6">
		                <label class="form-label">Loại</label>
		                <input type="text" name="loai" class="form-control" placeholder="Nhập loại sản phẩm">
		              </div>
		              <div class="col-md-6">
		                <label class="form-label">Thương hiệu</label>
		                <input type="text" name="thuongHieu" class="form-control" placeholder="Nhập thương hiệu">
		              </div>
		            </div>
		            <div class="row mt-3">
		              <div class="col-md-6">
		                <label class="form-label">Xuất sứ</label>
		                <input type="text" name="xuatXu" class="form-control" placeholder="Nhập xuất sứ">
		              </div>
		              <div class="col-md-6">
		                <label class="form-label">Chất liệu</label>
		                <input type="text" name="chatLieu" class="form-control" placeholder="Nhập chất liệu">
		              </div>
		            </div>
		            <div class="row mt-3">
		              <div class="col-md-6">
		                <label class="form-label">Màu (mã HEX)</label>
		                <input type="text" name="mau" class="form-control" placeholder="Nhập màu sản phẩm (HEX)">
		              </div>
		              <div class="col-md-6">
		              
		              </div>
		            </div>
		            <div class="row mt-3">
		              <div class="col-md-6">
			                <label class="form-label">Giá</label>
			                <input type="number" name="gia" class="form-control" placeholder="Nhập giá sản phẩm">
		              </div>
		              <div class="col-md-6">
		                <label class="form-label">Tồn kho</label>
		                <input type="number" name="tonKho" class="form-control" placeholder="Nhập số lượng tồn kho">
		              </div>
		            </div>
	            </div>
	          </div>
		      </div>
	        </form>
		    </div>
		  
		  </div>
		</div>

				
		
		
	</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
	    var thuongHieu = button.data('thuonghieu');
	    var xuatXu = button.data('xuatxu');
	    var chatLieu = button.data('chatlieu');
	    var mau = button.data('mau');
	    var tonKho = button.data('tonkho');
	    // Lấy modal
	    var modal = $(this);
	
	    // Điền các giá trị vào các trường trong modal
	    modal.find('#edit-id').val(id);
	    modal.find('#edit-ten').val(ten);
	    modal.find('#edit-link').val(link);
	    modal.find('#edit-gia').val(gia);
	    modal.find('#edit-loai').val(loai);
	    modal.find('#edit-mota').val(mota);
	    modal.find('#edit-thuongHieu').val(thuongHieu);
	    modal.find('#edit-xuatXu').val(xuatXu);
	    modal.find('#edit-chatLieu').val(chatLieu);
	    modal.find('#edit-mau').val(mau);
	    modal.find('#edit-tonKho').val(tonKho);
	    modal.find('#edit-image-preview').val(link);
	  });
	  
	  function confirmDelete(){
		  return confirm('Bạn có chắc muốn xóa sản phẩm này?')
	  };
	  document.getElementById('editModal').addEventListener('show.bs.modal', function (event) {
		  const button = event.relatedTarget; // Nút kích hoạt modal
		  const id = button.getAttribute('data-id');
		  const ten = button.getAttribute('data-ten');
		  const link = button.getAttribute('data-link');

		  // Gán dữ liệu vào modal
		  document.getElementById('edit-ten').value = ten;
		  document.getElementById('edit-link').value = link;
		  document.getElementById('edit-image-preview').src = link;
		});

	</script>
</body>
</html>