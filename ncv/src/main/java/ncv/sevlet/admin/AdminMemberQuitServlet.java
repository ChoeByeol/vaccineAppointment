package ncv.sevlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;

@WebServlet(urlPatterns = "/member/quit.txt")
public class AdminMemberQuitServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 회원아이디(session) + 비밀번호
			String memberId = (String)req.getSession().getAttribute("sessionKey");
			String memberPw = req.getParameter("memberPw");
			
			//처리 : 회원삭제 + 로그아웃
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.quit(memberId, memberPw);

			
			if(success) {
				req.getSession().removeAttribute("sessionKey");
				req.getSession().removeAttribute("grade");
				
				resp.sendRedirect("quit_success.jsp");
			}
			else {
				resp.sendRedirect("check.jsp?error");
			}			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}