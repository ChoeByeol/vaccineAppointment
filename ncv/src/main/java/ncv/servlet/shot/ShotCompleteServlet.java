package ncv.servlet.shot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.Shot2Dao;
import ncv.beans.Shot2Dto;


@WebServlet(urlPatterns = "/shot/complete.txt")
public class ShotCompleteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			Shot2Dto shotDto = new Shot2Dto();
					
			shotDto.setResOkNo(Integer.parseInt(req.getParameter("resOkNo")));
			shotDto.setShotDate(req.getParameter("shotDate"));
			shotDto.setShotCount(Integer.parseInt(req.getParameter("shotCount")));


			Shot2Dao shotDao = new Shot2Dao();		
			int shotNo = shotDao.getSequence();
			shotDto.setShotNo(shotNo);
			shotDao.shotComplete(shotDto);
			
			resp.sendRedirect("shot_list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
