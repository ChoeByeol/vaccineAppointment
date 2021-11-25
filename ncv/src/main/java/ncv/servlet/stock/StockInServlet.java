package ncv.servlet.stock;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.StockInDao;
import ncv.beans.StockInDto;

@WebServlet(urlPatterns = "/stock/stockIn.txt")
public class StockInServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			StockInDto stockDto = new StockInDto();
			
			stockDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
			stockDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
			stockDto.setStockInQty(Integer.parseInt(req.getParameter("stockInQty")));
			
			//처리
			StockInDao stockInDao = new StockInDao();
			int stockInNo = stockInDao.getSequence();
			stockDto.setStockInNo(stockInNo);
			stockInDao.stockIn(stockDto);			
			
			//출력
			resp.sendRedirect(req.getContextPath() + "/ncv/admin/stock/stock_list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}