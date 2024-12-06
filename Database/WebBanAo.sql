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
	loai nvarchar(255),
	thuongHieu nvarchar(255),
	xuatXu nvarchar(255),
	chatLieu nvarchar(255),
	mau nvarchar(255),
	tonKho int
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
('user1','1',1),
('user2','1',1),
('user3', 'password3', 1),
('user4', 'password4', 1),
('user5', 'password5', 1),
('user6', 'password6', 1),
('user7', 'password7', 1),
('user8', 'password8', 1),
('user9', 'password9', 1),
('user10', 'password10', 1),
('user11', 'password11', 1),
('user12', 'password12', 1),
('user13', 'password13', 1),
('user14', 'password14', 1),
('user15', 'password15', 1),
('user16', 'password16', 1),
('user17', 'password17', 1),
('user18', 'password18', 1),
('user19', 'password19', 1),
('user20', 'password20', 1),
('user21', 'password21', 1),
('user22', 'password22', 1);
GO
GO


insert into shirt(ten,linkAnh,moTa,gia,loai,thuongHieu,xuatXu,chatLieu,mau,tonKho)
values 
(N'Áo Thun Nam Họa Tiết In The Baseball Dog Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-in-the-baseball-dog-form-regular__4__115aaa76b9de455eb8ea199a5c61ba85_1024x1024.jpg',
N'Áo thun nam form regular, in họa tiết chú chó chơi bóng chày đầy năng động. Chất vải thoáng mát, phù hợp cho phong cách casual, trẻ trung.',
300000,'T-shirt',N'Adidas',N'Việt Nam',N'Cotton','#d6d2c3',20000),
(N'Áo Thun Nam Họa Tiết In Thêu Đắp Team Dog Max Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-in-theu-dap-team-dog-max-form-regular__5__8c6400765c7549218fb6536b852bc5ab_1024x1024.jpg',
N'Áo thun nam form regular, họa tiết in thêu độc đáo hình chú chó với phong cách mạnh mẽ. Sản phẩm mang lại cảm giác thoải mái và thời trang cho mọi hoạt động.',
250000,'T-shirt',N'Nikke',N'Mĩ',N'Cotton','#191f32',21000),
(N'Áo Thun Nam Họa Tiết Thêu Typo Hand-Draw Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-typo-hand-draw-form-regular__7__ffc61cf5371d4596a16aa747b13db182_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết thêu tay hình chữ nghệ thuật. Thiết kế tối giản nhưng tinh tế, tạo điểm nhấn cá tính cho người mặc.',
370000,'T-shirt',N'Gucci',N'Hàn Quốc',N'Cotton','#eeeeee',1000),
(N'Áo Thun Nam Họa Tiết Thêu Móc Xích Typo OG Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-moc-xich-typo-og-form-regular__6__9718ebc493f944a799593d743e1d6ede_1024x1024.jpg',
N'Áo thun nam form regular, thiết kế thêu chữ với chi tiết móc xích đầy phong cách. Sản phẩm thích hợp cho những ai yêu thích sự độc đáo và cá tính.',
400000,'T-shirt',N'Crocodie',N'Trung Quốc',N'Cotton','#eeeeee',9000),
(N'Áo Thun Nam Họa Tiết Pop Art Loyal Companion Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-pop-art-loyal-companion-form-regular__6__8ef72caaab3547da9a2b594cd6220889_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết Pop Art đầy màu sắc về chú chó trung thành. Thiết kế nghệ thuật, nổi bật, phù hợp với phong cách năng động, sáng tạo.',
399000,'Áo Polo',N'Luxury',N'Đức',N'Cotton','#077c57',5000),
(N'Áo Thun Nam Họa Tiết Thêu Negative Space Teddy Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-hoa-tiet-theu-negative-space-teddy-form-regular__4__cad418fcb8804206b5fa985da9712d73_1024x1024.jpg',
N'Áo thun nam form regular với họa tiết thêu hình gấu Teddy sử dụng kỹ thuật negative space độc đáo. Sản phẩm mang phong cách tối giản nhưng vẫn ấn tượng.',
599000,N'Áo nỉ',N'Gucci',N'Nhật',N'Cotton','#3f3f3f',6000),	
(N'Áo Thun Nam Trơn Strength Contour Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-tron-strength-contour-form-regular__7__8cd274b91d6b4fcd9193c92ee2ff4930_1024x1024.jpg',
N'Áo thun nam trơn form regular, thiết kế đơn giản nhưng tinh tế, nhấn mạnh đường nét mạnh mẽ của cơ thể. Phù hợp cho mọi hoạt động thường ngày.',
299000,N'Áo unisex',N'Crocodie',N'Việt Nam',N'Cotton','#877661',2000),
(N'Áo Thun Nam Phim Điện Ảnh Cám Hoạ Tiết In The Goby Form Regular',
'https://product.hstatic.net/1000360022/product/ao-thun-nam-phim-dien-anh-cam-hoa-tiet-in-the-goby-form-regular__6__0344cd260c8445d1931cc23a39729eb2_1024x1024.jpg',
N'Áo thun nam form regular in họa tiết theo phong cách phim điện ảnh, với hình ảnh chú cá Goby. Thiết kế đậm chất điện ảnh, mang đến sự trẻ trung và sáng tạo cho người mặc.',
299000,N'Áo Polo',N'Adidas',N'Việt Nam',N'Cotton','#171719',12000)
GO




CREATE PROCEDURE sp_Login
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
AS
BEGIN
	Select uid,role from account where uname = @Username and pw =@Password
END;
GO

CREATE PROCEDURE sp_CreateAccount
    @uname NVARCHAR(255),
    @pw NVARCHAR(255)
AS
BEGIN
    BEGIN TRY
        -- Kiểm tra xem tên người dùng đã tồn tại hay chưa
        IF EXISTS (
            SELECT 1
            FROM account
            WHERE uname = @uname
        )
        BEGIN
            RAISERROR ('Tên người dùng đã tồn tại.', 16, 1);
            RETURN;
        END

        -- Thêm tài khoản mới
        INSERT INTO account (uname, pw, role)
        VALUES (@uname, @pw, 1);

        PRINT 'Tài khoản đã được tạo thành công.';
    END TRY
    BEGIN CATCH
        -- Bắt lỗi nếu có vấn đề xảy ra
        PRINT 'Lỗi xảy ra trong quá trình tạo tài khoản.';
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_InsertShirt
    @ten NVARCHAR(255),
    @linkAnh NTEXT,
    @moTa NTEXT,
    @gia INT,
    @loai NVARCHAR(255),
	@thuongHieu nvarchar(255),
	@xuatXu nvarchar(255),
	@chatLieu nvarchar(255),
	@mau nvarchar(255),
	@tonKho int
AS
BEGIN
    INSERT INTO shirt (ten, linkAnh, moTa, gia, loai, thuongHieu, xuatXu, chatLieu, mau, tonKho)
    VALUES (@ten, @linkAnh, @moTa, @gia, @loai, @thuongHieu, @xuatXu, @chatLieu, @mau, @tonKho);
    
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
    @loai NVARCHAR(255),
	@thuongHieu nvarchar(255),
	@xuatXu nvarchar(255),
	@chatLieu nvarchar(255),
	@mau nvarchar(255),
	@tonKho int
AS
BEGIN
    UPDATE shirt
    SET 
        ten = @ten,
        linkAnh = @linkAnh,
        moTa = @moTa,
        gia = @gia,
        loai = @loai,
		thuongHieu = @thuongHieu, 
		xuatXu = @xuatXu, 
		chatLieu = @chatLieu, 
		mau = @mau, 
		tonKho = @tonKho
    WHERE id = @id;
    
    -- Thông báo cập nhật thành công
    PRINT 'Dữ liệu đã được cập nhật thành công';
END;
GO

CREATE PROCEDURE sp_DeleteShirt
    @id INT
AS
BEGIN
    BEGIN TRANSACTION; -- Bắt đầu giao dịch để đảm bảo tính toàn vẹn dữ liệu

    BEGIN TRY
        -- Xóa dữ liệu liên quan trong bảng Cart
        DELETE FROM Cart
        WHERE shirtId = @id;

        -- Xóa dữ liệu liên quan trong bảng ChiTietHoaDon
        DELETE FROM ChiTietHoaDon
        WHERE shirtId = @id;

		-- Cập nhật tổng tiền trong hóa đơn
        UPDATE HoaDon
        SET tongTien = (
            SELECT COALESCE(SUM(quantity * gia), 0)
            FROM ChiTietHoaDon
            WHERE ChiTietHoaDon.idHoaDon = HoaDon.id)
		WHERE HoaDon.id IN (
			SELECT DISTINCT idHoaDon
            FROM ChiTietHoaDon)

		-- Xóa hóa đơn không còn chi tiết
        DELETE FROM HoaDon
        WHERE id NOT IN (
            SELECT DISTINCT idHoaDon
            FROM ChiTietHoaDon
        );

        -- Xóa bản ghi trong bảng shirt
        DELETE FROM shirt
        WHERE id = @id;

        -- Commit giao dịch
        COMMIT TRANSACTION;

        -- Thông báo xóa thành công
        PRINT 'Bản ghi đã được xóa thành công';
    END TRY
    BEGIN CATCH
        -- Rollback giao dịch nếu có lỗi
        ROLLBACK TRANSACTION;

        -- Trả về thông báo lỗi
        PRINT 'Lỗi xảy ra khi xóa bản ghi';
        THROW;
    END CATCH
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

CREATE FUNCTION fn_Loc (@SearchText NVARCHAR(100), @Loai NVARCHAR(100), @Gia int, @Mau NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM shirt
    WHERE ten LIKE '%' + @SearchText + '%' 
		AND gia < @Gia 
		AND (@Mau = '' OR mau = @Mau)
		AND (@Loai = '' OR loai = @Loai) 
);
GO

CREATE FUNCTION fn_SPLienQuan (@Loai NVARCHAR(100), @ThuongHieu NVARCHAR(100), @idShirt INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 3 *
    FROM shirt
    WHERE (loai = @Loai OR thuongHieu = @ThuongHieu) AND id <> @idShirt
);
GO

--select * from fn_Loc('','',500000,'#eeeeee') order by gia desc, ten desc
--SELECT *
--    FROM shirt
--    WHERE ten LIKE '%' + 'dog' + '%' 
--       OR loai LIKE '%' + 'dog' + '%' order by ten desc



--EXEC sp_Login @Username = 'admin', @Password = '1';

--select * from Cart join shirt on shirtId = shirt.id where userId=2
--select * from shirt where id=1
--select mau from shirt group by mau 
--select * from HoaDon
--select * from ChiTietHoaDon join shirt on shirtId = shirt.id
--select * from ChiTietHoaDon join shirt on shirtId = shirt.id where idHoaDon = 3
--update HoaDon set trangThai = N'Đang chuẩn bị hàng' where id=1
-- Thêm 20 người dùng mới
-- Thêm 20 người dùng mới

DECLARE @i INT = 1;
DECLARE @userId INT;
DECLARE @tongTien INT;
DECLARE @ngayThanhToan DATETIME;
DECLARE @phuongThuc NVARCHAR(50);
DECLARE @tenNguoiNhan NVARCHAR(255);
DECLARE @sdtNguoiNhan INT;
DECLARE @diaChi NVARCHAR(255);
DECLARE @trangThai NVARCHAR(255);
DECLARE @idHoaDon INT;
DECLARE @shirtId INT;
DECLARE @quantity INT;
DECLARE @gia INT;
DECLARE @size NVARCHAR(5);

-- Danh sách họ và tên phổ biến
DECLARE @ho NVARCHAR(50), @tenDem NVARCHAR(50), @ten NVARCHAR(50);

WHILE @i <= 50
BEGIN
    -- Chọn ngẫu nhiên userId từ bảng account (giả định có userId từ 1 đến 20)
    SET @userId = FLOOR(RAND() * 23) + 1;

    -- Chọn ngẫu nhiên ngày thanh toán từ tháng 1 đến tháng 11 năm 2024
    SET @ngayThanhToan = DATEADD(DAY, FLOOR(RAND() * 330), '2024-01-01');

    -- Chọn phương thức thanh toán
    SET @phuongThuc = CASE FLOOR(RAND() * 2)
        WHEN 0 THEN N'Tiền mặt'
        ELSE N'Thẻ tín dụng'
    END;

    -- Tạo họ, tên đệm, và tên ngẫu nhiên
    SET @ho = CASE FLOOR(RAND() * 5)
        WHEN 0 THEN N'Nguyễn'
        WHEN 1 THEN N'Trần'
        WHEN 2 THEN N'Lê'
        WHEN 3 THEN N'Phạm'
        ELSE N'Huỳnh'
    END;

    SET @tenDem = CASE FLOOR(RAND() * 5)
        WHEN 0 THEN N'Văn'
        WHEN 1 THEN N'Thị'
        WHEN 2 THEN N'Hữu'
        WHEN 3 THEN N'Hoàng'
        ELSE N'Minh'
    END;

    SET @ten = CASE FLOOR(RAND() * 5)
        WHEN 0 THEN N'Anh'
        WHEN 1 THEN N'Tuấn'
        WHEN 2 THEN N'Hoa'
        WHEN 3 THEN N'Long'
        ELSE N'Lan'
    END;

    SET @tenNguoiNhan = @ho + N' ' + @tenDem + N' ' + @ten;

    -- Tạo thông tin người nhận khác
    SET @sdtNguoiNhan = 1000000000 + FLOOR(RAND() * 899999999); -- Số điện thoại 10 chữ số
    SET @diaChi = N'Địa chỉ ' + CAST(@i AS NVARCHAR);
    SET @trangThai = CASE FLOOR(RAND() * 3)
        WHEN 0 THEN N'Đã xác nhận chờ giao hàng'
        WHEN 1 THEN N'Chờ xác nhận'
        ELSE N'Đã hủy'
    END;

    -- Thêm hóa đơn vào bảng HoaDon
    INSERT INTO HoaDon (userId, tongTien, ngayThanhToan, phuongThuc, tenNguoiNhan, sdtNguoiNhan, diaChi, trangThai)
    VALUES (@userId, 0, @ngayThanhToan, @phuongThuc, @tenNguoiNhan, @sdtNguoiNhan, @diaChi, @trangThai);

    -- Lấy id hóa đơn vừa thêm
    SET @idHoaDon = SCOPE_IDENTITY();

    -- Tạo từ 1 đến 3 sản phẩm cho mỗi hóa đơn
    DECLARE @j INT = 1;
    WHILE @j <= FLOOR(RAND() * 3) + 1
    BEGIN
        -- Chọn sản phẩm ngẫu nhiên từ bảng shirt (giả định id từ 1 đến 8)
        SET @shirtId = FLOOR(RAND() * 8) + 1;

        -- Số lượng sản phẩm ngẫu nhiên (1-5)
        SET @quantity = FLOOR(RAND() * 5) + 1;

        -- Chọn kích cỡ ngẫu nhiên
        SET @size = CASE FLOOR(RAND() * 4)
            WHEN 0 THEN N'S'
            WHEN 1 THEN N'M'
            WHEN 2 THEN N'L'
            ELSE N'XL'
        END;

        -- Lấy giá sản phẩm từ bảng shirt
        SELECT TOP 1 @gia = gia FROM shirt WHERE id = @shirtId;

        -- Thêm chi tiết hóa đơn vào bảng ChiTietHoaDon
        INSERT INTO ChiTietHoaDon (idHoaDon, shirtId, quantity, size, gia)
        VALUES (@idHoaDon, @shirtId, @quantity, @size, @gia);

        -- Cập nhật tổng tiền của hóa đơn
        UPDATE HoaDon
        SET tongTien = tongTien + (@gia * @quantity)
        WHERE id = @idHoaDon;

        SET @j = @j + 1;
    END;

    SET @i = @i + 1;
END;
