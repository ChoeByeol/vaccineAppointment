package ncv.servlet.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.QnaDao;
import ncv.beans.QnaDto;


@WebServlet(urlPatterns = "/qna/edit.txt")
public class QnaEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : QnaDto(QnaNo, QnaTitle, QnaContent)
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaWriter((String)req.getSession().getAttribute("ses"));
			qnaDto.setQnaTitle(req.getParameter("qnaTitle"));
			qnaDto.setQnaContent(req.getParameter("qnaContent"));
			qnaDto.setQnaNo(Integer.parseInt(req.getParameter("qnaNo")));
			
			//처리
			QnaDao qnaDao = new QnaDao();
			boolean success = qnaDao.edit(qnaDto);
			
			//출력
			if(success) {
				resp.sendRedirect(req.getContextPath() + "/qna/detail.jsp?qnaNo=" + qnaDto.getQnaNo());
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
