package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.shirt;
import dao.shirtDao;

/**
 * Servlet implementation class product
 */
@WebServlet(urlPatterns = "/product", name = "product")
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		shirt item = shirtDao.LayItemTheoID(id);
		List<shirt> list = shirtDao.Lay3SPLienQuan(item);
		request.setAttribute("item", item);
		request.setAttribute("list3sp", list);
		request.getRequestDispatcher("views/ProductPage/product.jsp").forward(request, response);
	}
}
