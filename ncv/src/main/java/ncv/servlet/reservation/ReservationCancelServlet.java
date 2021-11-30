package ncv.servlet.reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.Shot2Dao;

@WebServlet(urlPatterns = "/reservation/cancel.txt")
public class ReservationCancelServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int resNo = Integer.parseInt(req.getParameter("resNo"));
			//System.out.println("취소할 예약번호 = " + resNo);
			
			//예약번호에 대한 접종내역이 이미 존재하면 취소 불가능
			Shot2Dao shot2Dao = new Shot2Dao();
			boolean success = shot2Dao.listByResNo(resNo); //true면 받아온 예약내역에대한 접종내역이 있음 false면 없음
			if(!success) {//접종내역이 없으면(false) 삭제가능함
				ReservationDao reservationDao = new ReservationDao();
				boolean cancelSuccess = reservationDao.cancel(resNo);
				if (cancelSuccess) {
					//System.out.println("삭제 성공");
					resp.sendRedirect(req.getContextPath()+"/index.jsp");
				} else {
					//System.out.println("삭제 실패");
					resp.sendError(404);
				}
			}
			else {//접종내역이 있으면(true) 삭제 불가능
				//System.out.println("예약내역 취소 불가능");
				
				resp.setContentType("text/html; charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script>alert('이미 접종완료한 예약입니다. 취소가 불가능합니다.'); history.back();</script>");
                out.flush();	
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
