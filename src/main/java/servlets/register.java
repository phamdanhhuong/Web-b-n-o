package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.accountDao;

/**
 * Servlet implementation class register
 */
@WebServlet(urlPatterns = "/register", name = "register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/RegisterPage/RegisterPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		boolean rs = accountDao.Register(uname, pass);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		if(rs==true) {
			response.setStatus(HttpServletResponse.SC_OK); 
			response.getWriter().write("{\"message\": \"" + "Đăng ký thành công"+ "\"}");
		}else {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("{\"error\": \"" + "Đăng ký không thành công! (tài khoản đã tồn tại)"+ "\"}");
		}
	}

}
