package ncv.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;


//공지사항 글쓰기 기능에 대한 관리자 확인 필터
@WebFilter(urlPatterns = {
		"/notice/write.jsp", "/notice/write.txt",

})
public class NoticeWriteFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		
		try {
			//목표 : 주어진 위치에서 파라미터로 전달되는 memberId가 관리자라면 차단
			req.setCharacterEncoding("UTF-8");
			String memberId = (String)req.getSession().getAttribute("ses");
			if(memberId != null) {//회원 아이디 파라미터가 존재한다면
				//데이터베이스에서 해당 memberId의 회원 정보를 조회
				MemberDao memberDao = new MemberDao();
				MemberDto memberDto = memberDao.get(memberId);
				
				if(memberDto != null && memberDto.getMemberRole().equals("관리자")) {//해당 회원이 관리자라면
					//통과
					chain.doFilter(request, response);
				}
				else {
					//차단
					resp.sendError(403);
				}
			}
			else {
				//차단
				resp.sendError(403);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
	