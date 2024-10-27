package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import beans.cartDetail;
import dao.accountDao;
import dao.cartDao;

/**
 * Servlet implementation class cart
 */
@WebServlet(urlPatterns = "/cart", name = "cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(accountDao.acc!=null) {
			if(accountDao.acc.getRole()==1) {
				List<cartDetail> list = cartDao.DsCartDetail(accountDao.acc.getUid());
				int sl = list.size();
				request.setAttribute("list", list);
				request.setAttribute("quantity", sl);
				request.getRequestDispatcher("views/CartPage/cart.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("_method").equals("post")) {
			if(accountDao.acc!=null) {
				if(accountDao.acc.getRole()==1) {
					int idshirt = Integer.parseInt(req.getParameter("id"));
					String size = "S";
					if(req.getParameter("size-option")!=null) {
						size = req.getParameter("size-option");
					}
					int quantity = 1;
					if(req.getParameter("quantity")!=null) {
						quantity = Integer.parseInt(req.getParameter("quantity"));
					}		
					beans.cart item = new beans.cart(0, accountDao.acc.getUid(), idshirt, quantity , size);
					boolean rs = cartDao.AddToCart(item);
					resp.sendRedirect("/WebBanAo/cart");
				}else {
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				}
			}else {
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
		}else if(req.getParameter("_method").equals("delete")) {
			doDelete(req, resp);
		}else if(req.getParameter("_method").equals("put")) {
			doPut(req, resp);
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(accountDao.acc!=null) {
			if(accountDao.acc.getRole()==1) {
				int idCart = Integer.parseInt(req.getParameter("idCart"));
				boolean rs = cartDao.RemoveFromCart(idCart);
				resp.sendRedirect("/WebBanAo/cart");
			}else {
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
		}else {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(accountDao.acc!=null) {
			if(accountDao.acc.getRole()==1) {
				int idCart = Integer.parseInt(req.getParameter("idCart"));
				int quantity = Integer.parseInt(req.getParameter("quantity"));
				String size = req.getParameter("size-option");
				boolean rs = cartDao.Update(idCart, quantity, size);
				resp.sendRedirect("/WebBanAo/cart");
			}else {
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
		}else {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}

}
