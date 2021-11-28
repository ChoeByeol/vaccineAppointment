package ncv.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.Shot2Dao;
import ncv.beans.Shot2Dto;
import ncv.beans.StockDao;


@WebServlet(urlPatterns = "/admin/shot/complete.txt")
public class AdminShotCompleteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			Shot2Dto shotDto = new Shot2Dto();
					
			shotDto.setResOkNo(Integer.parseInt(req.getParameter("resOkNo")));
			
			shotDto.setShotDate(req.getParameter("shotDate"));
			//System.out.println("이게 왜 null이 나옴? 접종일 = "+req.getParameter("shotDate"));
			
			shotDto.setShotCount(Integer.parseInt(req.getParameter("shotCount")));
			System.out.println("접종차수 파라미터값 = "+Integer.parseInt(req.getParameter("shotCount")));
			

			//예약번호에 대한 접종내역이 이미 존재하면 예약불가능
			int resOkNo = Integer.parseInt(req.getParameter("resOkNo"));
			System.out.println("접종완료할 예약번호 = " + resOkNo);
			Shot2Dao shot2Dao = new Shot2Dao();
			boolean success = shot2Dao.listByResNo(resOkNo); //true면 받아온 예약내역에대한 접종내역이 있음 false면 없음
			System.out.println(success);
			
			if(!success) {//접종내역이 없으면(false)면 성공
				int shotNo = shot2Dao.getSequence();
				shotDto.setShotNo(shotNo);
				shot2Dao.shotComplete(shotDto);
				
				//접종이 완료되면 병원의 백신 출고가 1 증가
				StockDao stockDao = new StockDao();
				int vaccineNo = Integer.parseInt(req.getParameter("vaccineNo"));
				int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));
				stockDao.stockMinus(vaccineNo, clinicNo);
				
				System.out.println("접종완료 성공");
				resp.sendRedirect("shot_list.jsp");
			}
			else {//접종내역이 있으면(true)면 실패
				//resp.sendError(500); //나중에 바꿔줘야함
				System.out.println("접종완료 불가능");
				
				resp.setContentType("text/html; charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script>alert('이미 접종완료한 예약입니다.'); history.back();</script>");
                out.flush();
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
