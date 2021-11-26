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

<h2>문의글 답변</h2>

<form action="answer.txt" method="post">
<input type="hidden" name="qnaNo" required width="600" value="<%=qnaDto.getQnaNo()%>">
	<table>
		<tbody align="left">
			<tr>
				<th>제목 : </th>
				<td><%=qnaDto.getQnaTitle()%></td>
			</tr>
			<tr height="200" valign="top">
				<th>내용 : </th>
				<td><pre><%=qnaDto.getQnaContent()%></pre></td>
			</tr>
							<%-- 첨부 파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
				<%if(!qnaFileList.isEmpty()){ %>
				<tr>
					<%for(QnaFileDto boardFileDto : qnaFileList){ %>
						<th>첨부파일 : </th>
						<td>
							<%=boardFileDto.getQnaFileUploadName()%> 
							(<%=boardFileDto.getQnaFileSize()%> bytes)
							<a href="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>">다운로드</a>
							<img src="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>" width="50" height="50">
						<td>
					<%} %>
				</tr>
				<%} %>
			<tr>
				<th>답변 : </th>
				<td><textarea name="qnaAnswer" rows="10" cols="100" required ><%=qnaDto.getQnaAnswer()%></textarea></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="답변하기">
				</td>
			</tr>
		</tfoot>
	</table>
</form>