package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.account;
import beans.hoaDon;
import beans.shirt;
import dao.accountDao;
import dao.hoadonDao;
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
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	if(accountDao.acc!=null) {
    		if(accountDao.acc.getRole()==0) {
    			List<shirt> list = shirtDao.LayDS();
    			req.setAttribute("list", list);
    			req.getRequestDispatcher("views/AdminPage/AdminPage.jsp").forward(req, resp);
    		}
    	}
    }
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
				String thuongHieu = request.getParameter("thuongHieu");	
				String xuatXu = request.getParameter("xuatXu");	
				String chatLieu = request.getParameter("chatLieu");	
				String mau = request.getParameter("mau");	
				int tonKho = Integer.parseInt(request.getParameter("tonKho"));
				shirt item = new shirt(1, ten, link, mota, gia, loai,thuongHieu,xuatXu,chatLieu,mau,tonKho);
				boolean rs = shirtDao.AddShirt(item);
				response.sendRedirect("/WebBanAo/admin");
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
		String thuongHieu = req.getParameter("thuongHieu");	
		String xuatXu = req.getParameter("xuatXu");	
		String chatLieu = req.getParameter("chatLieu");	
		String mau = req.getParameter("mau");	
		int tonKho = Integer.parseInt(req.getParameter("tonKho"));
		shirt item = new shirt(id, ten, link, mota, gia, loai,thuongHieu,xuatXu,chatLieu,mau,tonKho);
		boolean rs = shirtDao.UpdateShirt(item);
		System.out.println(rs);
		resp.sendRedirect("/WebBanAo/admin");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		boolean rs = shirtDao.DeleteShirt(id);
		System.out.println(rs);
		resp.sendRedirect("/WebBanAo/admin");
	}

}
