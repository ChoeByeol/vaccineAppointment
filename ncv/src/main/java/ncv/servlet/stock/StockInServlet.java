package ncv.servlet.stock;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.StockDao;
import ncv.beans.StockDto;

@WebServlet(urlPatterns = "/admin/stock/stockIn.txt")
public class StockInServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			StockDto stockDto = new StockDto();
			
			stockDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
			stockDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
			stockDto.setStockInQty(Integer.parseInt(req.getParameter("stockInQty")));
			
			//처리
			StockDao stockDao = new StockDao();
			int stockNo = stockDao.getSequence();
			stockDto.setStockNo(stockNo);
			stockDao.stockIn(stockDto);			
			
			//출력
			resp.sendRedirect(req.getContextPath() + "/admin/stock/stock_list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}