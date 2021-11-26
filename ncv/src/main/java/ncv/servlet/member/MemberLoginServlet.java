package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;
import ncv.beans.SHA256;

@WebServlet(urlPatterns = "/member/login.txt")
public class MemberLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : member_id, member_pw
			String memberId = req.getParameter("memberId");
			String memberPw = SHA256.encrypt(req.getParameter("memberPw"));
			
			//처리
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(memberId);
			
			
			//회원이 있는데 비밀번호까지 같다면 로그인이 성공한 것으로 간주하고 싶다
			boolean isLogin = memberDto != null && memberPw.equals(memberDto.getMemberPw());
			
			//출력
			if(isLogin) {
			
				req.getSession().setAttribute("ses",memberId);
				req.getSession().setAttribute("grade", memberDto.getMemberRole());
				resp.sendRedirect(req.getContextPath()+"/index.jsp");

			}
			else {
				//login.jsp 로 이동하면서 ?error 파라미터를 붙여서 오류임을 표시
				resp.sendRedirect("login.jsp?error");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
