package ncv.servlet.stock;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.StockDao;

@WebServlet(urlPatterns = "/admin/stock/cancel.txt")
public class StockCancelServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int stockNo = Integer.parseInt(req.getParameter("stockNo"));

            StockDao stockDao = new StockDao();
            boolean success = stockDao.cancel(stockNo);

            if(success) {
                resp.sendRedirect("stock_list.jsp");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            resp.sendError(500);
        }
    }
}