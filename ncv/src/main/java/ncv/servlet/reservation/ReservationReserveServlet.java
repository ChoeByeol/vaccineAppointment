package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;
import ncv.beans.VaccineDao;

@WebServlet(urlPatterns = "/reservation/reserve.txt")
public class ReservationReserveServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			ReservationDto reservationDto = new ReservationDto();
			
			reservationDto.setMemberId(req.getParameter("memberId"));
			reservationDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
			reservationDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
			reservationDto.setShotNo(Integer.parseInt(req.getParameter("shotNo")));
			reservationDto.setResDate(req.getParameter("resDate"));
			reservationDto.setResTime(req.getParameter("resTime"));
			reservationDto.setResName(req.getParameter("resName"));
			reservationDto.setResRrn(req.getParameter("resRrn"));
			reservationDto.setResPhone(req.getParameter("resPhone"));

			ReservationDao reservationDao = new ReservationDao();		
			int resNo = reservationDao.getSequence();
			reservationDto.setResNo(resNo);
			reservationDao.reserve(reservationDto);
			
			resp.sendRedirect("reservation_detail.jsp?resNo="+resNo);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}