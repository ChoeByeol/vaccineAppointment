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

import ncv.beans.NoticeDao2;
import ncv.beans.NoticeDto;

//게시판 수정, 삭제 기능에 대한 본인확인 필터
@WebFilter(urlPatterns = {
		"/notice/edit.jsp", "/notice/edit.jsp",
		"/notice/delete.jsp"
})
public class NoticeFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		

		try {
			req.setCharacterEncoding("UTF-8");
			int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
			
			NoticeDao2 noticeDao = new NoticeDao2();
			NoticeDto noticeDto = noticeDao.get(noticeNo);
			
			String memberId = (String)req.getSession().getAttribute("ses");
			
			if(noticeDto == null) {//대상 게시글이 없으면(잘못된 번호)
				resp.sendError(404);//404 not found
			}
			else if(memberId == null) {//비회원이면
				resp.sendError(401);//401 unauthorized
			}
			else if(noticeDto.getNoticeWriter().equals(memberId)) {//아이디 일치(본인)
				chain.doFilter(request, response);//통과
			}
			else {
				resp.sendError(403);//403 forbidden
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}