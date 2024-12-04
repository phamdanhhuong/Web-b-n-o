package servlets;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import beans.hoaDon;
import beans.shirt;
import dao.accountDao;
import dao.hoadonDao;
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
		List<String> mau = shirtDao.LayDSMau();
		List<String> loai = shirtDao.LayDSLoai();
		request.setAttribute("dsMau", mau);
		request.setAttribute("dsLoai", loai);
		if(accountDao.acc==null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else if(accountDao.acc.getRole()==1) {
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
				request.getRequestDispatcher("views/ShopPage/ShopPage.jsp").forward(request, response);
			}
		}else if(accountDao.acc.getRole()==0) {
			List<hoaDon> list = hoadonDao.getAllListHoaDon();
	        request.setAttribute("list", list);
	        Set<Integer> uniqueCustomers = new HashSet<>();
	        for (hoaDon hd : list) {
	            uniqueCustomers.add(hd.getUserId());
	        }
	        request.setAttribute("totalCustomers", uniqueCustomers.size());

	        // Tính tổng số sản phẩm đã bán
	        int totalProducts = 0;
	        for (hoaDon hd : list) {
	            totalProducts += hd.getListDetail().size();
	        }
	        request.setAttribute("totalProducts", totalProducts);

	        // Tính tổng số đơn hàng
	        int totalOrders = list.size();
	        request.setAttribute("totalOrders", totalOrders);

	        // Tính số sản phẩm sắp hết hàng (giả sử bạn có thông tin này trong chiTietHoaDon)
	        List<shirt> shirts = shirtDao.LayDS();

		     // Đặt ngưỡng tồn kho để xem sản phẩm nào "sắp hết hàng"
		     int threshold = 100; // Ngưỡng tồn kho dưới 10 là sắp hết hàng
	
		     // Biến để đếm số sản phẩm sắp hết hàng
		     int totalLowStockProducts = 0;
	
		     // Duyệt qua danh sách sản phẩm và đếm sản phẩm sắp hết hàng
		     for (shirt sp : shirts) {
		         if (sp.getTonKho() < threshold) {
		             totalLowStockProducts++; // Tăng số lượng sản phẩm sắp hết hàng
		         }
		     }
	
		     // Truyền giá trị này vào request để sử dụng trong JSP
		     request.setAttribute("totalLowStockProducts", totalLowStockProducts);
	        // Tính doanh thu theo tháng
	        Map<String, Integer> revenueByMonth = calculateRevenueByMonth(list);
	        
	        // Chuyển đổi Map thành JSON
	        Gson gson = new Gson();
	        String revenueByMonthJson = gson.toJson(revenueByMonth);
	        
	        // Đưa JSON vào request
	        request.setAttribute("revenueByMonthJson", revenueByMonthJson);
	        
	        request.getRequestDispatcher("views/AdminTrangChu/AdminTrangChu.jsp").forward(request, response);
		}
	}
	private Map<String, Integer> calculateRevenueByMonth(List<hoaDon> hoaDons) {
	    Map<String, Integer> revenueByMonth = new HashMap<>();
	    SimpleDateFormat monthFormat = new SimpleDateFormat("MM-yyyy");

	    // Log danh sách hóa đơn ban đầu
	    System.out.println("Bắt đầu tính toán doanh thu theo tháng. Tổng số hóa đơn: " + hoaDons.size());

	    for (hoaDon hd : hoaDons) {
	        String month = monthFormat.format(hd.getNgayThanhToan()); // Chuyển ngày sang định dạng "MM-yyyy"
	        int previousRevenue = revenueByMonth.getOrDefault(month, 0);
	        int updatedRevenue = previousRevenue + hd.getTongTien();

	        // Log thông tin từng hóa đơn
	        System.out.println("Hóa đơn ID: " + hd.getId() +
	                           ", Ngày thanh toán: " + hd.getNgayThanhToan() +
	                           ", Tổng tiền: " + hd.getTongTien() +
	                           ", Doanh thu trước: " + previousRevenue +
	                           ", Doanh thu cập nhật: " + updatedRevenue);

	        // Cập nhật doanh thu vào map
	        revenueByMonth.put(month, updatedRevenue);
	    }

	    // Log kết quả cuối cùng
	    System.out.println("Tính toán hoàn thành. Doanh thu theo tháng: " + revenueByMonth);

	    return revenueByMonth;
	}


}
