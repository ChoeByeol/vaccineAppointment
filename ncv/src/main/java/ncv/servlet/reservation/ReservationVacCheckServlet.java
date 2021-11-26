package ncv.servlet.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import ncv.beans.ReservationDao;
import ncv.beans.ReservationVo;


@WebServlet(urlPatterns = "/reservation/vacCheck.txt")
public class ReservationVacCheckServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");


			// 테스트 페이지 입니다 나중에 삭제 예정 
			
			
				
			// 병원 예약 건수 / 백신 수량 비교(물론 백신별임)
			int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));
			int vaccineNo = Integer.parseInt(req.getParameter("vaccineNo"));
						
			ReservationDao reservationDao = new ReservationDao();
			int result = reservationDao.resVacCheck(clinicNo, vaccineNo);
			
			List<ReservationVo> clinicVacCheck = reservationDao.clinicVacCheck(clinicNo, vaccineNo);
			System.out.println(clinicVacCheck.size());
			
			int stock = 0;
			for (ReservationVo reservationVo : clinicVacCheck) {
				stock += reservationVo.getQuantity();
			}

	  
			if(stock >= result) {
				System.out.println("예약가능");
				System.out.println("재고수량 = " + stock);
				System.out.println("예약건수 = " + result);
			}
			else {
				System.out.println("재고없음요");
			}			
			
			boolean stockCheck = stock >= result;
			
			if (stockCheck) {
				resp.sendRedirect("/reservation/reserve.txt");
				System.out.println("백신재고있음 예약가능");

			} else { 
				resp.sendRedirect("/reservation/reserve.txt");
				System.out.println("백신재고없음 예약불가능");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
