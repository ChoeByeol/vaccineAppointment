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

@WebFilter(urlPatterns = "/admin/member/*")
public class DontTouchAdminFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		try {
			req.setCharacterEncoding("UTF-8");
			String memberId = req.getParameter("memberId");
			if(memberId != null) {
				MemberDao memberDao = new MemberDao();
				MemberDto memberDto = memberDao.get(memberId);
				
				if(memberDto != null && memberDto.getMemberRole().equals("관리자")) {
					resp.sendError(403);
				}
				else {
					chain.doFilter(request, response);
				}
			}
			else {
				chain.doFilter(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}