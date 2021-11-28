package ncv.servlet.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.NoticeDao;
import ncv.beans.NoticeDto;

@WebServlet(urlPatterns = "/notice/edit.txt")
public class NoticeEditServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setNoticeWriter((String)req.getSession().getAttribute("ses"));
			noticeDto.setNoticeNo(Integer.parseInt(req.getParameter("noticeNo")));
			noticeDto.setNoticeTitle(req.getParameter("noticeTitle"));
			noticeDto.setNoticeContent(req.getParameter("noticeContent"));
			
			//처리
			NoticeDao noticeDao = new NoticeDao();
			boolean success = noticeDao.edit(noticeDto);
			
			//출력 
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/notice/detail.jsp?noticeNo="+noticeDto.getNoticeNo());
			}
			else {
				resp.sendError(404);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
