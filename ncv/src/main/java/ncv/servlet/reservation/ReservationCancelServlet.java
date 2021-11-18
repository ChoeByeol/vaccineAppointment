package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;

@WebServlet(urlPatterns = "/reservation/cancel.txt")
public class ReservationCancelServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int resNo = Integer.parseInt(req.getParameter("resNo"));

			ReservationDao reservationDao = new ReservationDao();
			boolean success = reservationDao.cancel(resNo);

			if (success) {
				resp.sendRedirect("reservation_list.jsp");	
			} else {
				resp.sendError(404);
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
