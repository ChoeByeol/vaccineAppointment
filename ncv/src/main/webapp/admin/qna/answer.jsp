<%@page import="ncv.beans.QnaFileDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.QnaFileDao"%>
<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : --%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
%>
<%-- 처리 --%>
<%
	QnaDao qnaDao = new QnaDao();
	QnaDto qnaDto = qnaDao.get(qnaNo);
%>
<%
	//현재 게시글에 대한 파일 정보를 조회
	QnaFileDao qnaFileDao = new QnaFileDao();
	//List<QnaFileDto> fileList = qnaFileDao.find(qnaNo);
	List<QnaFileDto> qnaFileList = qnaFileDao.find(qnaNo);//파일이 여러 개일 경우
	//QnaFileDto qnaFileDto = qnaFileDao.find(qnaNo);//파일이 한 개일 경우
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="answer.txt" method="post">
<input type="hidden" name="qnaNo" required width="600" value="<%=qnaDto.getQnaNo()%>">
	<div class="container-800 container-center">
		<div class="row center form-title-font">1:1 문의글 답변</div>
		<div class="row">
			<h3>문의 제목</h3>
			<input type="text" readonly required value="<%=qnaDto.getQnaTitle()%>" class="form-input-title form-input">
		</div>
		<div class="row">
			<h3>문의자</h3>
			<input type="text" readonly required value="<%=qnaDto.getQnaWriter()%>" class="form-input-title form-input">
		</div>
		<div class="row">
			<h3>문의 내용</h3>
      		<textarea readonly required class="form-input-board form-input text-area"><%=qnaDto.getQnaContent()%></textarea>
		</div>
		<%-- 첨부 파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
		<%if(!qnaFileList.isEmpty()){ %>
		<div class="row left">
			<%for(QnaFileDto boardFileDto : qnaFileList){ %>
				<h3>첨부파일<h3>
				<%=boardFileDto.getQnaFileUploadName()%> 
				(<%=boardFileDto.getQnaFileSize()%> bytes)
				<a href="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>">다운로드</a>
				<img src="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>" width="50" height="50">
			<%} %>
		</div>
		<%} %>
		<div class="row">
			<h3>답변 내용</h3>
      		<textarea name="qnaAnswer" required class="form-input-board form-input text-area"><%=qnaDto.getQnaAnswer()%></textarea>
		</div>
		<%if(qnaDto.getQnaAnswer().length()==0){%>
		<div class="row right">
			<input type="submit" value="답변하기" class="form-btn form-inline form-notice-btn">
		</div>
		<%} else { %>
		<div class="row right">
			<input type="submit" value="수정하기" class="form-btn form-inline form-notice-btn">
		</div>
		<%} %>
	</div>
</form>
	
	
	
	
<jsp:include page="/template/footer.jsp"></jsp:include>
	