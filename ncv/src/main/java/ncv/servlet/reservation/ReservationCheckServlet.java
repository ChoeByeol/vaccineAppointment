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
import ncv.beans.Shot2Dao;
import ncv.beans.Shot2Dto;
import ncv.beans.Shot3Vo;
import ncv.beans.VaccineDao;

@WebServlet(urlPatterns = "/reservation/check.txt")
public class ReservationCheckServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			req.setCharacterEncoding("UTF-8");
			String memberId = (String) req.getSession().getAttribute("ses");

			ReservationDao reservationDao = new ReservationDao();
			List<ReservationVo> myResList = reservationDao.myResList(memberId);
		
			VaccineDao vaccineDao = new VaccineDao();

			
			Shot2Dao shotDao = new Shot2Dao();
			Shot2Dto shotDto = shotDao.vaccineCheck(memberId);
			
			int shot = 0;
			int vacNo = 0;
			if (shotDto != null) {
				vacNo= shotDto.getVaccineNo();
				shot = vaccineDao.shot(vacNo);
			}
			
			boolean shotCheck = shotDao.getResNum(memberId) >= shot;
	
			List<Shot3Vo> myShotList = shotDao.myShotList(memberId);

//			System.out.println("백신번호  = " + vacNo);
//			System.out.println("접종완료차수  = " + myShotList.size() );
//			System.out.println("백신최대접종차수  = " + shot);
//			System.out.println("판단  = " + shotCheck);
	
			
			boolean check = memberId != null && myShotList.size() == 0; // 미접종
			boolean check1 = memberId != null && myShotList != null && myShotList.size() > 0;// 접종내역 판단

			boolean resCheck = myResList.size() == 0;
			
			// 출력
			if (check && resCheck && shotCheck && shot == 0) {// 미접종
				resp.sendRedirect("reservation_reserve.jsp");
//				System.out.println("미접종");

			} else if (check1 && resCheck && !shotCheck) { 
				resp.sendRedirect("reservation_reserve.jsp");
//				System.out.println("접종할수있음");

			} else if ( myShotList.size()  > 0 && shotCheck) { // 백신 접종 차수 별 비교
				resp.sendRedirect("reservation_resNo.jsp");
//				System.out.println("접종다함");	
			} else if (!resCheck){
				resp.sendRedirect("reservation_isRes.jsp"); // 예약중일때
//				System.out.println("이미예약중");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}