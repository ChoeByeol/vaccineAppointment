package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;


@WebServlet(urlPatterns = "/reservation/check.txt")
public class ReservationCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = (String)req.getSession().getAttribute("ses");
	
			ReservationDao reservationDao = new ReservationDao();
			ReservationDto reservationDto = reservationDao.vaccineCheck(memberId);
			
			boolean check = reservationDto != null && memberId.equals(reservationDto.getMemberId());

			//출력
			if(check) {
				resp.sendRedirect("reservation_isRes.jsp");
			}
			else {
				resp.sendRedirect("reservation_reserve.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
