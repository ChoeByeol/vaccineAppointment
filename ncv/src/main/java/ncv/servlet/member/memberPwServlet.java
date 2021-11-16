package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns = "/member/password.kh")
public class memberPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 객체
			String memberId = (String)req.getSession().getAttribute("ses");
			String memberPw = req.getParameter("memberPw");
			String changePw = req.getParameter("changePw");
			//처리
			
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.editPassword(memberId, memberPw, changePw);
			
			//출력
			if(success) {
				resp.sendRedirect("password_success.jsp");
			}
			else {
				resp.sendRedirect("password.jsp?error");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
