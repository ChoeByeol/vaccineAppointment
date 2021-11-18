package ncv.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.QnaDao;
import ncv.beans.QnaDto;

@WebServlet(urlPatterns = "/admin/qna/answer.txt")
public class AdminQnaAnswerServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : QnaDto(QnaNo, QnaTitle, QnaContent)
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaAnswer(req.getParameter("qnaAnswer"));
			qnaDto.setQnaState(req.getParameter("qnaState"));
			qnaDto.setQnaNo(Integer.parseInt(req.getParameter("qnaNo")));
			
			//처리
			QnaDao qnaDao = new QnaDao();
			boolean success = qnaDao.answer(qnaDto);
			
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
