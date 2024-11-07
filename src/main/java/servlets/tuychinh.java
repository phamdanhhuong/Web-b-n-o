package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.hoaDon;
import dao.hoadonDao;

/**
 * Servlet implementation class tuychinh
 */
@WebServlet(urlPatterns = "/tuychinh", name = "tuychinh")
public class tuychinh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tuychinh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idHoaDon"));
		hoaDon item = hoadonDao.getHoaDon(id);
		request.setAttribute("hoadon", item);
		request.getRequestDispatcher("views/AdminTuyChinhDonHang/AdminTuyChinhDonHang.jsp").forward(request, response);
	}

}
