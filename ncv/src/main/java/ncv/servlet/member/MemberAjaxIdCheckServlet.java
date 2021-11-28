package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns = "/member/ajax_id_check.txt")
public class MemberAjaxIdCheckServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = req.getParameter("memberId");
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(memberId);
			
			if(memberDto == null) {
				//아이디가 없다 -> 사용이 가능 -> NNNNY 전송
				resp.getWriter().write("YYY");
			}
			else {
				//아이디가 있다 -> 사용이 불가능 -> NNNNN 전송 
				resp.getWriter().write("NNN");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
