package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;


@WebServlet(urlPatterns = "/reservation/edit.txt")
public class ReservationEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			req.setCharacterEncoding("UTF-8");
			ReservationDto reservationDto = new ReservationDto();
			reservationDto.setResNo(Integer.parseInt(req.getParameter("resNo")));
			reservationDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
			reservationDto.setResDate(req.getParameter("resDate"));
			reservationDto.setResTime(req.getParameter("resTime"));

			//처리
			ReservationDao reservationDao = new ReservationDao();
			boolean success = reservationDao.edit(reservationDto);

			//출력
			if(success) {
				resp.sendRedirect("reservation_detail.jsp?resNo="+reservationDto.getResNo());
			}
			else {
				resp.sendRedirect("reservation_edit.jsp?error");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
