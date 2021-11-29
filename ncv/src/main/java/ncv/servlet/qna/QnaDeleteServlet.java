package ncv.servlet.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.QnaDao;

@WebServlet(urlPatterns = "/qna/delete.txt")
public class QnaDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : QnaNo
			int qnaNo = Integer.parseInt(req.getParameter("qnaNo"));
			
			//처리
			QnaDao qnaDao = new QnaDao();
			boolean success = qnaDao.delete(qnaNo);
			
			//출력
			if(success) {
				resp.sendRedirect("mylist.jsp");
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
