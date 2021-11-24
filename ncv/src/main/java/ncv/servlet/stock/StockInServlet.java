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




@WebServlet(urlPatterns = "/stock/stockIn.txt")
public class StockInServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			StockDto stockDto = new StockDto();
			
			stockDto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			stockDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
			stockDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
			stockDto.setStockDate(req.getParameter("stockDate"));
			stockDto.setStockType(req.getParameter("stockType"));

			StockDao stockDao = new StockDao();
			int stockNo = stockDao.getSequence();
			stockDto.setStockNo(stockNo);
			stockDao.stockIn(stockDto);			

			resp.sendRedirect("http://localhost:8080/ncv/admin/stock/stock_in.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}