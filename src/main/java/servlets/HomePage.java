package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.shirt;
import dao.accountDao;
import dao.shirtDao;

/**
 * Servlet implementation class HomePage
 */
@WebServlet(urlPatterns = "/home", name = "name")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(accountDao.acc==null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if(accountDao.acc.getRole()==1) {
			if(request.getParameter("searchText")!=null) {
				String text = request.getParameter("searchText");
				List<shirt> list = shirtDao.LayDSSearch(text);
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/HomePage/HomePage.jsp").forward(request, response);
			}else {
				List<shirt> list = shirtDao.LayDS();
				request.setAttribute("list", list);
				request.getRequestDispatcher("views/HomePage/HomePage.jsp").forward(request, response);
			}
		}else if(accountDao.acc.getRole()==0) {
			List<shirt> list = shirtDao.LayDS();
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/AdminTrangChu/AdminTrangChu.jsp").forward(request, response);
		}
	}

}
