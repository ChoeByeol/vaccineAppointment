package ncv.servlet.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;
import ncv.beans.ReservationVo;

@WebServlet(urlPatterns = "/reservation/reserve.txt")
public class ReservationReserveServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			ReservationDto reservationDto = new ReservationDto();
			
			reservationDto.setMemberId((String)req.getSession().getAttribute("ses"));
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

			
			// 병원 예약 건수 / 백신 수량 비교(물론 백신별임)
			int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));
			int vaccineNo = Integer.parseInt(req.getParameter("vaccineNo"));
						
			int result = reservationDao.resVacCheck(clinicNo, vaccineNo);
			
			List<ReservationVo> clinicVacCheck = reservationDao.clinicVacCheck(clinicNo, vaccineNo);
			
			int stock = 0;
			for (ReservationVo reservationVo : clinicVacCheck) {
				stock += reservationVo.getQuantity();
			}

			
			boolean stockCheck = stock > result;
			
			if (stockCheck) {
				
				reservationDao.reserve(reservationDto);
				
				resp.sendRedirect("reservation_detail.jsp?resNo="+resNo);		

				System.out.println("재고수량 = " + stock);
				System.out.println("예약건수 = " + result);

			} else { 
			
				resp.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = resp.getWriter();
				 
				out.println("<script>alert('백신재고없음 예약불가능'); history.back();</script>" );

				out.flush();
				
				System.out.println("재고수량 = " + stock);
				System.out.println("예약건수 = " + result);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		} 
	}
	
}
