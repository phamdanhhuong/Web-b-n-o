package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.cartDetail;
import beans.shirt;
import dao.accountDao;
import dao.cartDao;
import dao.shirtDao;

/**
 * Servlet implementation class trangchu
 */
@WebServlet(urlPatterns = "/trangchu", name = "trangchu")
public class trangchu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trangchu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<String> mau = shirtDao.LayDSMau();
		List<String> loai = shirtDao.LayDSLoai();
		request.setAttribute("dsMau", mau);
		request.setAttribute("dsLoai", loai);
		if(accountDao.acc!=null) {
			if(accountDao.acc.getRole()==1) {
				if(request.getParameter("loc-searchText")!=null) {
					String loc_text = request.getParameter("loc-searchText");
					String alp = request.getParameter("loc-alphabet");
					String pri = request.getParameter("loc-price");
					String loc_loai = request.getParameter("loc-loai");
					int range = Integer.parseInt(request.getParameter("loc-range"));
					String color = request.getParameter("loc-color");
					List<shirt> list = shirtDao.LayDSLoc(loc_text, loc_loai, range, color, alp, pri);
					request.setAttribute("list", list);
					request.setAttribute("searchText", loc_text);
					request.setAttribute("alphabet", alp);
					request.setAttribute("price", pri);
					request.setAttribute("loai", loc_loai);
					request.setAttribute("range", range);
					request.setAttribute("color", color);
					request.getRequestDispatcher("views/HomePage/HomePage.jsp").forward(request, response);
				}else{
					List<shirt> list = shirtDao.LayDS();
					request.setAttribute("list", list);
					request.getRequestDispatcher("views/HomePage/HomePage.jsp").forward(request, response);
				}
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
