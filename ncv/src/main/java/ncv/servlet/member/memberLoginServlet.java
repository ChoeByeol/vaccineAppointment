package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns = "/member/login.txt")
public class memberLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : member_id, member_pw
			String memberId = req.getParameter("memberId");
			String memberPw = req.getParameter("memberPw");
			String memberPw2 = req.getParameter("memberPw2");
			
			//처리
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.get(memberId);
			
			//회원이 있는데 비밀번호까지 같다면 로그인이 성공한 것으로 간주하고 싶다
			boolean isLogin = memberDto != null && memberPw.equals(memberDto.getMemberPw());
			
			//출력
			if(isLogin) {
				
				//세션 = 서버에서 사용자 정보를 관리하기 위한 단골수첩과 같은 저장소(Map형태)
				//세션(단골수첩)에 사용자가 로그인 했음을 key=value 형태로 저장하면 이후에 확인이 가능
				//저장형태는 String, Object
				//서블릿에서는 req.getSession() 이라는 명령으로 접근이 가능			
				//여기서는 가장 중요한 회원정보인 회원아이디를 ses라는 이름으로 저장
				req.getSession().setAttribute("ses",memberId);
//				req.getSession().setAttribute("grade", memberDto.getMemberGrade());
				
//				resp.sendRedirect("../index.jsp");//상대
				resp.sendRedirect(req.getContextPath()+"/index.jsp");	//절대
//				resp.sendRedirect("/home/index.jsp");	//절대

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
