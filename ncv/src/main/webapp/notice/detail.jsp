<%@page import="ncv.beans.NoticeFileDto"%>
<%@page import="ncv.beans.NoticeFileDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 수정 버튼을 눌렀을 때 처리되도록 구현하는 스크립트 --%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$(".view-row").find(".edit-btn").click(function(){
			$(this).parents("tr.view-row").hide();
			$(this).parents("tr.view-row").next("tr.edit-row").show();
		});
		
		$(".edit-row").find(".edit-cancel-btn").click(function(){
			$(this).parents("tr.edit-row").hide();
			$(this).parents("tr.edit-row").prev("tr.view-row").show();
		});
		
		$(".edit-row").hide();
	});
</script>    


<%-- 입력 : 게시글번호(noticeNo) --%>
<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
%>

<%
	String memberId = (String)session.getAttribute("ses"); 
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.get(noticeNo);
	

	
	
	//조회수 증가 처리
	
	noticeDao.readUp(noticeNo,memberId);
	
	%>
	
	<%
	

	
	//현재 게시글에 대한 파일정보를 조회
	NoticeFileDao noticeFileDao = new NoticeFileDao();
	List<NoticeFileDto> noticeFileList = noticeFileDao.find(noticeNo);
	%>
	
	
<%-- 출력 --%>

<jsp:include page="/template/header.jsp"></jsp:include> 

<h2><%=noticeDto.getNoticeNo()%>번 게시글</h2>

<table border="1" width="80%">
	<tbody>
		<tr>
			<td>
				<h3><%=noticeDto.getNoticeTitle()%></h3>
			</td>
		</tr>
		<tr>
			<td>
				등록일 : <%=noticeDto.getNoticeTime()%>
				|
				작성자 : <%=noticeDto.getNoticeWriter()%>
				|
				조회수 : <%=noticeDto.getNoticeHit()%>
			</td>
		</tr>
		<!-- 답답해 보이지 않도록 기본높이를 부여 -->
		<!-- 
			pre 태그를 사용하여 내용을 있는 그대로 표시되도록 설정
			(주의) 태그 사이에 쓸데없는 엔터, 띄어쓰기 등이 들어가지 않도록 해야 한다.(모두 표시된다) 
		-->
		<tr height="250" valign="top">
			<td>
				<pre><%=noticeDto.getNoticeContent()%></pre>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="write.jsp">글쓰기</a>
				<a href="list.jsp">목록보기</a>
				
				<%if(memberId==noticeDto.getNoticeWriter()){ %>
				<a href="edit.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">수정하기</a>
				<a href="delete.txt?noticeNo=<%=noticeDto.getNoticeNo()%>">삭제하기</a>
				<%} %>
			</td>
		</tr>
	</tbody>
</table>


<%-- 첨부파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
<%if(!noticeFileList.isEmpty()){ %>
	<%for(NoticeFileDto noticeFileDto : noticeFileList){ %>
		<h6>
			<%=noticeFileDto.getNoticeFileUploadname() %>
			(<%=noticeFileDto.getNoticeFileSize()%> bytes)
			<a href="file/download.kh?noticeFileNo=<%=noticeFileDto.getNoticeFileNo()%>">
				다운로드
			</a>
			
			<img src="file/download.kh?noticeFileNo=<%=noticeFileDto.getNoticeFileNo()%>" width="50" height="50">
		</h6>
	<%} %>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>