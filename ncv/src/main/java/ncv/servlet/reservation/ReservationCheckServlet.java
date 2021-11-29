package ncv.servlet.reservation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;
import ncv.beans.ReservationVo;
import ncv.beans.Shot2Dao;
import ncv.beans.Shot2Dto;
import ncv.beans.Shot2Vo;
import ncv.beans.Shot3Vo;
import ncv.beans.ShotDto;
import ncv.beans.VaccineDao;

@WebServlet(urlPatterns = "/reservation/check.txt")
public class ReservationCheckServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			req.setCharacterEncoding("UTF-8");
			String memberId = (String) req.getSession().getAttribute("ses");

			ReservationDao reservationDao = new ReservationDao();
			Shot2Dao shotDao = new Shot2Dao();
			int myVacNo = shotDao.myVacNo(memberId);
			List<ReservationVo> myResList = reservationDao.myResList(memberId);
			ReservationDto reservationDto = reservationDao.vaccineCheck(memberId);
			VaccineDao vaccineDao = new VaccineDao();
			
			//int shot = 0;
			//if (reservationDto != null) {
			int	shot = vaccineDao.shot(myVacNo);
			//}
			System.out.println("내가 맞은 백신 번호 " +  myVacNo);
			System.out.println("내가 맞은 백신의 접종 횟수 = " + shot);
			
			
			
			List<Shot3Vo> myShotList = shotDao.myShotList(memberId);

			//System.out.println(shot);
			System.out.println("내 접종내역 = "+myShotList.size());
			boolean shotCheck = myShotList.size() <= shot;
			System.out.println("내 접종내역이 차수보다 적거나 같은 = "+shotCheck);
			
			boolean check = memberId != null && myShotList.size() == 0; // 미접종
			boolean check1 = memberId != null && myShotList != null && myShotList.size() == 1;// 접종내역 1차 완료
			boolean check2 = memberId != null && myShotList != null && myShotList.size() == 2;
			boolean resCheck = myResList.size() == 0;
			
			// 출력
			if (check && resCheck) {// 미접종
				resp.sendRedirect("reservation_reserve.jsp");
//				System.out.println("미접종");

			} else if (check1 && resCheck ) { // 접종내역 1차 완료
				resp.sendRedirect("reservation_reserve.jsp");
//				System.out.println("접종1차완료");
			} else if (check2  && resCheck ) { // 접종내역 1차 / 2차 완료
				resp.sendRedirect("reservation_resNo.jsp");
//				System.out.println("접종1차, 2차완료");
			}else if (check2  && resCheck && shotCheck ) {// 얀센막는 테스트
			//} else if (check2  && resCheck && shotCheck ) { // 접종내역 1차 완료 / 백신 접종 차수 별
				resp.sendRedirect("reservation_resNo.jsp");
//				System.out.println("접종1차완료, 얀센");	
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