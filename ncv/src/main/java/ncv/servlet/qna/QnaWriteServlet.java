package ncv.servlet.qna;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ncv.beans.QnaDao;
import ncv.beans.QnaDto;
import ncv.beans.QnaFileDao; 
import ncv.beans.QnaFileDto;

@WebServlet(urlPatterns = "/qna/write.txt")
public class QnaWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//multipart/form-data를 해석하기 위한 객체 생성
			String savePath = "D:/upload/qna";
			int maxSize = 10 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(req, savePath, maxSize, encoding, policy);
			
			//입력 : qnaDto
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaTitle(mRequest.getParameter("qnaTitle"));
			qnaDto.setQnaContent(mRequest.getParameter("qnaContent"));
			
			qnaDto.setQnaWriter((String)req.getSession().getAttribute("ses"));

			//처리
			//번호를 알아내면서 등록
			QnaDao qnaDao = new QnaDao();
			int qnaNo = qnaDao.getSequence();//시퀀스 번호 생성
			qnaDto.setQnaNo(qnaNo);//게시글 데이터에 생성된 번호 추가
			
			qnaDao.write(qnaDto);//게시글 등록(새글)
			
			/**
			 * 게시글 등록을 모두 마친 뒤에 파일 정보를 데이터베이스에 저장하도록 설정
			 * 파일이 존재할 경우만 실행해야 한다.
			 */
			
			if(mRequest.getFile("attach") != null) {//파일이 attach란 이름으로 올라왔다면
				QnaFileDto qnaFileDto = new QnaFileDto();
				qnaFileDto.setQnaNo(qnaNo);//게시글 번호
				qnaFileDto.setQnaFileSaveName(mRequest.getFilesystemName("attach"));//실제제목
				qnaFileDto.setQnaFileUploadName(mRequest.getOriginalFileName("attach"));//
				qnaFileDto.setQnaFileType(mRequest.getContentType("attach"));//파일유형
				File target = mRequest.getFile("attach");
				qnaFileDto.setQnaFileSize(target.length());
				
				QnaFileDao qnaFileDao = new QnaFileDao();
				qnaFileDao.insert(qnaFileDto);
			}
			
			//출력
			//(1) list.jsp로 리다이렉트
			//resp.sendRedirect(req.getContextPath() + "/qna/list.jsp");
			
			//(2) detail.jsp로 리다이렉트
			resp.sendRedirect("detail.jsp?qnaNo=" + qnaNo);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}