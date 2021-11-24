package ncv.servlet.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.NoticeDao;

@WebServlet(urlPatterns = "/notice/delete.txt")
public class NoticeDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
			
			//처리
			NoticeDao noticeDao = new NoticeDao();
			boolean success = noticeDao.delete(noticeNo);
			
			//출력
			if(success) {
				resp.sendRedirect("list.jsp");
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