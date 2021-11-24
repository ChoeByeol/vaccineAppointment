package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns="/reservation/member_check.txt")
public class ReservationAjaxCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			String resName = req.getParameter("resName");
			String resRrn = req.getParameter("resRrn");
			String resPhone = req.getParameter("resPhone");
			
			MemberDao memberDao = new MemberDao();
			int result = memberDao.checkMember(resName, resRrn, resPhone);
			System.out.println(result);
			if(result==1) {
				//일치한다.
				resp.getWriter().write("YYYYY");
			}
			else {
				//일치하지 않는다.
				resp.getWriter().write("NNNNN");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
