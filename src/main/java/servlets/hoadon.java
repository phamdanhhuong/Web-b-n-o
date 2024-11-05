package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.accountDao;
import dao.hoadonDao;

/**
 * Servlet implementation class hoadon
 */
@WebServlet(urlPatterns = "/hoadon",name = "hoadon")
public class hoadon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hoadon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		if(accountDao.acc==null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			String thanhpho = request.getParameter("thanhpho");
			String quan = request.getParameter("quan");
			String diachicuthe = request.getParameter("diachicuthe");
			String phuongthuc = request.getParameter("phuongthuc");
			String tenNguoiNhan = request.getParameter("tenNguoiNhan");
			int sdt = Integer.parseInt(request.getParameter("sdt"));
			
			String diachi = thanhpho +", "+quan+", "+diachicuthe;
			hoadonDao.CheckOut(accountDao.acc.getUid(), phuongthuc, diachi,tenNguoiNhan,sdt);
			response.sendRedirect("/WebBanAo/cart");
		}
	}

}
