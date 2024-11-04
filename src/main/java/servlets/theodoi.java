package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.hoaDon;
import dao.accountDao;
import dao.hoadonDao;

/**
 * Servlet implementation class theodoi
 */
@WebServlet(urlPatterns = "/theodoi",name = "theodoi")
public class theodoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public theodoi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(accountDao.acc==null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			List<hoaDon> list = hoadonDao.getListHoaDon(accountDao.acc.getUid());
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/TheoDoiPage/TheoDoiPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
