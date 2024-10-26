package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.accountDao;

/**
 * Servlet implementation class login
 */
@WebServlet(urlPatterns = "/login", name = "login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String pw = request.getParameter("password");
		boolean rs = accountDao.Login(uname, pw);
		if(rs) {
			response.sendRedirect(request.getContextPath() + "/home");
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
