package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.account;
import beans.shirt;
import dao.accountDao;
import dao.shirtDao;

/**
 * Servlet implementation class admin
 */
@WebServlet(urlPatterns = "/admin", name = "admin")
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(accountDao.acc.getRole()==0) {
			String _method = request.getParameter("_method");
			if(_method.equals("put")) {
				doPut(request, response);
			}else if(_method.equals("delete")) {
				doDelete(request, response);
			}else {
				String ten = request.getParameter("ten");
				String link = request.getParameter("link");
				int gia = Integer.parseInt(request.getParameter("gia"));
				String loai = request.getParameter("loai");
				String mota = request.getParameter("mota");	
				shirt item = new shirt(1, ten, link, mota, gia, loai);
				boolean rs = shirtDao.AddShirt(item);
				System.out.println(rs);
				response.sendRedirect("/WebBanAo/home");
			}
		}else {
			response.sendRedirect("/WebBanAo/home");
		}
	}
	
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String ten = req.getParameter("ten");
		String link = req.getParameter("link");
		int gia = Integer.parseInt(req.getParameter("gia"));
		String loai = req.getParameter("loai");
		String mota = req.getParameter("mota");	
		shirt item = new shirt(id, ten, link, mota, gia, loai);
		boolean rs = shirtDao.UpdateShirt(item);
		System.out.println(rs);
		resp.sendRedirect("/WebBanAo/home");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		boolean rs = shirtDao.DeleteShirt(id);
		System.out.println(rs);
		resp.sendRedirect("/WebBanAo/home");
	}

}
