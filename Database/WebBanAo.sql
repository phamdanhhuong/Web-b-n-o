CREATE DATABASE WebBanAo
GO

USE WebBanAo
GO


Create table account 
(
	uid int identity primary key,
	uname nvarchar(255),
	pw nvarchar(255),
	role int --0:admin, 1:user
)
GO

create table shirt
(
	id int identity primary key,
	ten nvarchar(255),
	linkAnh ntext,
	moTa ntext,
	gia int,
	loai nvarchar(255)
)
GO

CREATE TABLE Cart
(
    cartId INT IDENTITY PRIMARY KEY,   
    userId INT,                       
    shirtId INT,                       
    quantity INT,
	size nvarchar(5),
    CONSTRAINT FK_UserCart FOREIGN KEY (userId) REFERENCES account(uid),
    CONSTRAINT FK_ShirtCart FOREIGN KEY (shirtId) REFERENCES shirt(id)
);
GO

CREATE TABLE HoaDon
(
    id INT IDENTITY PRIMARY KEY,    
    userId INT,                           
    tongTien INT,                       
    ngayThanhToan DATETIME DEFAULT GETDATE(), 
    phuongThuc NVARCHAR(50),
	tenNguoiNhan NVARCHAR(255),
	sdtNguoiNhan INT,
	diaChi NVARCHAR(255),
	trangThai NVARCHAR(255),
    CONSTRAINT FK_UserInvoice FOREIGN KEY (userId) REFERENCES account(uid)
);
GO

CREATE TABLE ChiTietHoaDon
(
    id INT IDENTITY PRIMARY KEY, 
    idHoaDon INT,                            
    shirtId INT,                              
    quantity INT,                             
	size nvarchar(5),
    gia INT,   
    CONSTRAINT FK_InvoiceDetailInvoice FOREIGN KEY (idHoaDon) REFERENCES HoaDon(id),
    CONSTRAINT FK_InvoiceDetailShirt FOREIGN KEY (shirtId) REFERENCES shirt(id)
);
GO

insert into account(uname,pw, role)
values 
('admin','1',0),
('user1','1',1)
GO


insert into shirt(ten,linkAnh,moTa,gia,loai)
values 
(N'Áo Thun Nam Họa Tiết In The Baseball Dog Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-in-the-baseball-dog-form-regular__4__115aaa76b9de455eb8ea199a5c61ba85_1024x1024.jpg',
N'Áo thun nam form regular, in họa tiết chú chó chơi bóng chày đầy năng động. Chất vải thoáng mát, phù hợp cho phong cách casual, trẻ trung.',
300000,'T-shirt'),
(N'Áo Thun Nam Họa Tiết In Thêu Đắp Team Dog Max Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-in-theu-dap-team-dog-max-form-regular__5__8c6400765c7549218fb6536b852bc5ab_1024x1024.jpg',
N'Áo thun nam form regular, họa tiết in thêu độc đáo hình chú chó với phong cách mạnh mẽ. Sản phẩm mang lại cảm giác thoải mái và thời trang cho mọi hoạt động.',
250000,'T-shirt'),
(N'Áo Thun Nam Họa Tiết Thêu Typo Hand-Draw Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-typo-hand-draw-form-regular__7__ffc61cf5371d4596a16aa747b13db182_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết thêu tay hình chữ nghệ thuật. Thiết kế tối giản nhưng tinh tế, tạo điểm nhấn cá tính cho người mặc.',
370000,'T-shirt'),
(N'Áo Thun Nam Họa Tiết Thêu Móc Xích Typo OG Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-moc-xich-typo-og-form-regular__6__9718ebc493f944a799593d743e1d6ede_1024x1024.jpg',
N'Áo thun nam form regular, thiết kế thêu chữ với chi tiết móc xích đầy phong cách. Sản phẩm thích hợp cho những ai yêu thích sự độc đáo và cá tính.',
400000,'T-shirt'),
(N'Áo Thun Nam Họa Tiết Pop Art Loyal Companion Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-pop-art-loyal-companion-form-regular__6__8ef72caaab3547da9a2b594cd6220889_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết Pop Art đầy màu sắc về chú chó trung thành. Thiết kế nghệ thuật, nổi bật, phù hợp với phong cách năng động, sáng tạo.',
399000,'Áo Polo'),
(N'Áo Thun Nam Họa Tiết Thêu Negative Space Teddy Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-negative-space-teddy-form-regular__4__cad418fcb8804206b5fa985da9712d73_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết thêu hình gấu Teddy sử dụng kỹ thuật negative space độc đáo. Sản phẩm mang phong cách tối giản nhưng vẫn ấn tượng.',
599000,N'Áo nỉ'),	
(N'Áo Thun Nam Trơn Strength Contour Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-tron-strength-contour-form-regular__7__8cd274b91d6b4fcd9193c92ee2ff4930_1024x1024.jpg',
N'Áo thun nam trơn form regular, thiết kế đơn giản nhưng tinh tế, nhấn mạnh đường nét mạnh mẽ của cơ thể. Phù hợp cho mọi hoạt động thường ngày.',
299000,N'Áo unisex'),
(N'Áo Thun Nam Phim Điện Ảnh Cám Hoạ Tiết In The Goby Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-phim-dien-anh-cam-hoa-tiet-in-the-goby-form-regular__6__0344cd260c8445d1931cc23a39729eb2_1024x1024.jpg',
N'Áo thun nam form regular in họa tiết theo phong cách phim điện ảnh, với hình ảnh chú cá Goby. Thiết kế đậm chất điện ảnh, mang đến sự trẻ trung và sáng tạo cho người mặc.',
299000,N'Áo Polo')
GO




CREATE PROCEDURE sp_Login
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
	Select uid,role from account where uname = @Username and pw =@Password
END;
GO

CREATE PROCEDURE sp_InsertShirt
    @ten NVARCHAR(255),
    @linkAnh NTEXT,
    @moTa NTEXT,
    @gia INT,
    @loai NVARCHAR(255)
AS
BEGIN
    INSERT INTO shirt (ten, linkAnh, moTa, gia, loai)
    VALUES (@ten, @linkAnh, @moTa, @gia, @loai);
    
    -- Thông báo thành công
    PRINT 'Dữ liệu đã được thêm thành công';
END;
GO

CREATE PROCEDURE sp_UpdateShirt
    @id INT,
    @ten NVARCHAR(255),
    @linkAnh NTEXT,
    @moTa NTEXT,
    @gia INT,
    @loai NVARCHAR(255)
AS
BEGIN
    UPDATE shirt
    SET 
        ten = @ten,
        linkAnh = @linkAnh,
        moTa = @moTa,
        gia = @gia,
        loai = @loai
    WHERE id = @id;
    
    -- Thông báo cập nhật thành công
    PRINT 'Dữ liệu đã được cập nhật thành công';
END;
GO

CREATE PROCEDURE sp_DeleteShirt
    @id INT
AS
BEGIN
    -- Xóa bản ghi có id tương ứng
    DELETE FROM shirt
    WHERE id = @id;
    
    -- Thông báo xóa thành công
    PRINT 'Bản ghi đã được xóa thành công';
END;
GO

CREATE PROCEDURE sp_AddToCart
    @userId INT,
    @shirtId INT,
    @quantity INT,
	@size nvarchar(5)
AS
BEGIN
    -- Kiểm tra xem sản phẩm đã có trong giỏ hàng của người dùng với cùng size chưa
    IF EXISTS (SELECT 1 FROM Cart WHERE userId = @userId AND shirtId = @shirtId AND size = @size)
    BEGIN
        -- Nếu sản phẩm đã tồn tại trong giỏ hàng, cập nhật số lượng (quantity)
        UPDATE Cart
        SET quantity = quantity + @quantity
        WHERE userId = @userId AND shirtId = @shirtId;
    END
    ELSE
    BEGIN
        -- Nếu sản phẩm chưa tồn tại, thêm mới vào giỏ hàng
        INSERT INTO Cart (userId, shirtId, quantity, size)
        VALUES (@userId, @shirtId, @quantity, @size);
    END
END;
GO

CREATE PROCEDURE sp_RemoveFromCart
    @cartId INT
AS
BEGIN
    DELETE FROM Cart WHERE cartId = @cartId;
END;
GO

CREATE PROCEDURE sp_Checkout
    @userId INT, @phuongThuc nvarchar(50), @diaChi nvarchar(255), @tenNguoiNhan nvarchar(255), @sdt int
AS
BEGIN
	DECLARE @totalAmount INT = 0;
	DECLARE @itemCount INT = 0;

	-- Kiểm tra số lượng sản phẩm trong giỏ hàng
    SELECT @itemCount = COUNT(*)
    FROM Cart
    WHERE userId = @userId;

    -- Nếu giỏ hàng rỗng, dừng thủ tục
    IF @itemCount = 0
    BEGIN
        PRINT 'Giỏ hàng trống. Không thể thực hiện thanh toán.';
        RETURN;
    END

    
    -- Tính tổng tiền
    SELECT @totalAmount = SUM(s.gia * c.quantity)
    FROM Cart c
    JOIN shirt s ON c.shirtId = s.id
    WHERE c.userId = @userId;

    -- Tạo hóa đơn mới
    INSERT INTO HoaDon(userId, tongTien, phuongThuc,diaChi, tenNguoiNhan, sdtNguoiNhan,trangThai)
    VALUES (@userId, @totalAmount, @phuongThuc, @diaChi, @tenNguoiNhan, @sdt,N'Chờ xác nhận');
    
    DECLARE @invoiceId INT = SCOPE_IDENTITY();  -- Lấy mã hóa đơn vừa tạo

    -- Thêm chi tiết hóa đơn
    INSERT INTO ChiTietHoaDon(idHoaDon, shirtId, quantity,size, gia)
    SELECT @invoiceId, c.shirtId, c.quantity,c.size, s.gia
    FROM Cart c
    JOIN shirt s ON c.shirtId = s.id
    WHERE c.userId = @userId;

    -- Xóa các mục trong giỏ hàng sau khi thanh toán
    DELETE FROM Cart WHERE userId = @userId;
END;
GO

CREATE PROCEDURE sp_getListDetail
    @idHoaDon INT
AS
BEGIN
	select * from ChiTietHoaDon join shirt on shirtId = shirt.id where idHoaDon = @idHoaDon
END;
GO

CREATE PROCEDURE sp_updateStatus
    @trangThai NVARCHAR(255), @idHoaDon INT
AS
BEGIN
	update HoaDon set trangThai = @trangThai where id=@idHoaDon
END;
GO


CREATE FUNCTION fn_TimKiemShirt (@SearchText NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM shirt
    WHERE ten LIKE '%' + @SearchText + '%' 
       OR loai LIKE '%' + @SearchText + '%'
);
GO





--EXEC sp_Login @Username = 'admin', @Password = '1';

--select * from Cart join shirt on shirtId = shirt.id where userId=2
--select * from shirt where id=1

--select * from HoaDon
--select * from ChiTietHoaDon join shirt on shirtId = shirt.id
--select * from ChiTietHoaDon join shirt on shirtId = shirt.id where idHoaDon = 3
--update HoaDon set trangThai = N'Đang chuẩn bị hàng' where id=1

