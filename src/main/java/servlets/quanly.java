package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import beans.hoaDon;
import beans.shirt;
import dao.accountDao;
import dao.hoadonDao;
import dao.shirtDao;

/**
 * Servlet implementation class quanly
 */
@WebServlet(urlPatterns = "/quanly", name = "quanly")
public class quanly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quanly() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(accountDao.acc==null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if(accountDao.acc.getRole()==0) {
			List<hoaDon> list = hoadonDao.getAllListHoaDon();
			// Tính toán số lượng đơn hàng theo trạng thái
	        int completedOrders = 0;
	        int waitingOrders = 0;
	        int shippingOrders = 0;
	        int canceledOrders = 0;
	        
	        for (hoaDon hd : list) {
	            switch (hd.getTrangThai()) {
	                case "Hoàn thành":
	                    completedOrders++;
	                    break;
	                case "Đã xác nhận chờ giao hàng":
	                    waitingOrders++;
	                    break;
	                case "Chờ xác nhận":
	                    shippingOrders++;
	                    break;
	                case "Đã hủy":
	                    canceledOrders++;
	                    break;
	                default:
	                    break;
	            }
	        }
	        
	        // Truyền các giá trị vào request để sử dụng trong JSP
	        request.setAttribute("completedOrders", completedOrders);
	        request.setAttribute("waitingOrders", waitingOrders);
	        request.setAttribute("shippingOrders", shippingOrders);
	        request.setAttribute("canceledOrders", canceledOrders);
	        request.setAttribute("totalOrders", list.size()); // Tổng số đơn hàng
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/AdminQuanLyDonHang/AdminQuanLyDonHang.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(accountDao.acc==null) {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}else if(accountDao.acc.getRole()==0) {
			String trangthai = req.getParameter("trangthai");
			int id = Integer.parseInt(req.getParameter("idHoaDon"));
			boolean rs = hoadonDao.UpdateStatus(trangthai, id);
			if(rs) {
				resp.sendRedirect("/WebBanAo/quanly");
			}else {
				resp.setContentType("text/html");
				resp.getWriter().write("Thuc hien that bai!!!!");
			}
		}else {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
