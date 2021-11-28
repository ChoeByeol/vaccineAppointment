<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaFileDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.QnaFileDao"%>
<%@page import="ncv.beans.QnaDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : 게시글 번호 --%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
%>

<%
	String memberId = (String)session.getAttribute("ses");
	String grade = (String) session.getAttribute("grade");
	
	QnaDao qnaDao = new QnaDao();
	QnaDto qnaDto = qnaDao.get(qnaNo);
	
	//본인 글인지 아닌지 판정
	boolean writer = memberId.equals(qnaDto.getQnaWriter());
	//관리자 판정
	boolean admin = grade != null && grade.equals("관리자");
%>

<%
	//현재 게시글에 대한 파일 정보를 조회
	QnaFileDao qnaFileDao = new QnaFileDao();
	//List<QnaFileDto> fileList = qnaFileDao.find(qnaNo);
	List<QnaFileDto> qnaFileList = qnaFileDao.find(qnaNo);//파일이 여러 개일 경우
	//QnaFileDto qnaFileDto = qnaFileDao.find(qnaNo);//파일이 한 개일 경우
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>    

<style>

</style>

<div class="container-800 container-center">
	<div class="row">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>제목</td>
					<td><%=qnaDto.getQnaTitle()%></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><%=qnaDto.getQnaWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=qnaDto.getQnaDate()%></td>
				</tr>
			</thead>
			<tr><td colspan="4"><hr><td></tr>
			<tbody>
			<!-- 답답해 보이지 않도록 기본높이를 부여 -->
			<!-- 
				pre 태그를 사용하여 내용을 있는 그대로 표시되도록 설정
				(주의) 태그 사이에 쓸데없는 엔터, 띄어쓰기 등이 들어가지 않도록 해야 한다.(모두 표시된다)
			 -->
				<tr height="200" valign="top">
					<td>질문</td>
					<td colspan="4"><pre><%=qnaDto.getQnaContent()%></pre></td>
				</tr>
				<%-- 첨부 파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
				<%if(!qnaFileList.isEmpty()){ %>
				<tr>
					<%for(QnaFileDto boardFileDto : qnaFileList){ %>
						<td>첨부파일</td>
						<td>
							<%=boardFileDto.getQnaFileUploadName()%> 
							(<%=boardFileDto.getQnaFileSize()%> bytes)
							<a href="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>">다운로드</a>
							<img src="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>" width="50" height="50">
						<td>
					<%} %>
				</tr>
				<%} %>	
					
				<%if(!qnaDto.getQnaAnswer().isEmpty()){ %>
				<tr height="200" valign="top" style="background-color:#EEEEEE">
					<td>답변</td>
					<td colspan="4"><pre><%=qnaDto.getQnaAnswer()%></pre></td>
				</tr>
				<%} %>
			</tbody>
			<tr><td colspan="4"><hr><td></tr>
			<tfoot>
				<tr align="right">
					<td colspan="4">
						
						<%if(writer){%>
							<a href="<%=request.getContextPath()%>/qna/mylist.jsp">목록</a>
							<%if(qnaDto.getQnaState().equals("답변대기")){ %>
							<a href="edit.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">수정</a>
							<a href="delete.txt?qnaNo=<%=qnaDto.getQnaNo()%>">삭제</a>
							<%} %>
						<%}else if(admin){%>
							<a href="<%=request.getContextPath()%>/admin/qna/list.jsp">목록</a>
							<a href="../admin/qna/answer.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">답변달기</a>
							<a href="delete.txt?qnaNo=<%=qnaDto.getQnaNo()%>">삭제</a>
						<%} %>
					</td>
			</tfoot>
		</table>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>    