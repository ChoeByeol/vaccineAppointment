package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.SHA256;

@WebServlet(urlPatterns = "/member/quit.txt")
public class MemberQuitServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 회원아이디(세션) + 회원 비밀번호(파라미터)
			//=세션 : member_id
			String memberId = (String)req.getSession().getAttribute("ses");
			String memberPw = SHA256.encrypt(req.getParameter("memberPw"));
			
			//처리 : 회원삭제 + 로그아웃
			MemberDao memberDao = new MemberDao();
			boolean success =memberDao.quit(memberId, memberPw);
			
			//success에 따라 성공/ 실패로 구분하여 처리
			//=성공이라면 로그아웃 후 완료페이지로 전송
			//=실패라면 로그아웃 처리를 하지 않고 이전 페이지로 오류 파라미터와 함께 전송
			
			if(success) {		
				
				//출력 : 로그아웃 후 완료페이지로 redirect
				
				req.getSession().removeAttribute("ses");
				req.getSession().removeAttribute("grade");
				//req.getSession().invalidate();
				
				resp.sendRedirect("quit_success.jsp");
				//resp.sendRedirect(req.getContextPath()+"/member/quit_success.jsp");
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