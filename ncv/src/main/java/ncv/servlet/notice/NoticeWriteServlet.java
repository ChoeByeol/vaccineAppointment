package ncv.servlet.notice;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ncv.beans.NoticeDao;
import ncv.beans.NoticeDto;
import ncv.beans.NoticeFileDao;
import ncv.beans.NoticeFileDto;

/**
 *	파일 업로드를 적용한 서블릿
 * = 사용자의 요청 방식이 multipart/form-data 방식으로 변경되었다.
 * = request를 기존의 형태로 수신할 수 없으며, MultipartRequest(cos.jar)를 이용하여 수신하도록 수정
 * = 저장위치는 D:/upload
 * = 용량제한은 10MB
 * = 인코딩은 UTF-8
 * = 기본 파일 이름 재정의 객체를 적용
 * = req.getParameter()는 mRequest.getParameter()로 바꿔서 사용
 * = 파일 관련된 명령만 따로 존재
 * 		= 파일업로드명 : mRequest.getOriginalFileName()
 * 		= 저장된 파일명 : mRequest.getFileSystemName();
 * 		= 파일 유형 : mRequest.getContentType()
 * 		= 파일 반환 : mRequest.getFile()
 */
@WebServlet(urlPatterns = "/notice/write.txt")
public class NoticeWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//multipart/form-data를 해석하기 위한 객체 생성
			String savePath = "D:/upload/notice";
			int maxSize = 10 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = 
						new MultipartRequest(req, savePath, maxSize, encoding, policy);
			
			//입력 
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setNoticeTitle(mRequest.getParameter("noticeTitle"));
			noticeDto.setNoticeContent(mRequest.getParameter("noticeContent"));
			
			//아이디는 세션에서 수집하여 추가
			noticeDto.setNoticeWriter((String)req.getSession().getAttribute("ses"));
			
			
			//처리
			//(2) 번호를 알아내면서 등록
			NoticeDao noticeDao = new NoticeDao();
			int noticeNo = noticeDao.getSequence();//시퀀스 번호 생성
			noticeDto.setNoticeNo(noticeNo);//게시글 데이터에 생성된 번호 추가
			
			noticeDao.write(noticeDto);//게시글 등록(새글)
			
			/**
			 * 게시글 등록을 모두 마친 뒤에 파일 정보를 데이터베이스에 저장하도록 설정
			 * 파일이 존재할 경우만 실행해야 한다.
			 */
			if(mRequest.getFile("attach") != null) {//파일이 attach란 이름으로 올라왔다면
				NoticeFileDto noticeFileDto = new NoticeFileDto();
				noticeFileDto.setNoticeNo(noticeNo);//게시글 번호
				noticeFileDto.setNoticeFileSavename(mRequest.getFilesystemName("attach"));//실제저장된이름
				noticeFileDto.setNoticeFileUploadname(mRequest.getOriginalFileName("attach"));//사용자가올린이름
				noticeFileDto.setNoticeFileType(mRequest.getContentType("attach"));//파일 유형
				File target = mRequest.getFile("attach");
				noticeFileDto.setNoticeFileSize(target.length());
				
				NoticeFileDao noticeFileDao = new NoticeFileDao();
				noticeFileDao.insert(noticeFileDto);
			}
			
			//출력
			//(1) list.jsp로 리다이렉트
			//resp.sendRedirect("list.jsp");
			
			//(2) detail.jsp로 리다이렉트
			resp.sendRedirect("detail.jsp?noticeNo="+noticeNo);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}