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
    boolean member= memberId!=null&&memberId!="";	
    
    
    
    
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.get(noticeNo);%>
	

	
	<%//권한 판정
	
	//NullPointerException 오류에 대한 처리
	
	boolean owner=memberId!=null&&memberId!=""&&memberId.equals(noticeDto.getNoticeWriter());

	%>


<%
	//조회수 증가 처리
	
	if(member){
	noticeDao.readUp(noticeNo,memberId);
	}
	%>
	
	<%
	

	
	//현재 게시글에 대한 파일정보를 조회
	NoticeFileDao noticeFileDao = new NoticeFileDao();
	List<NoticeFileDto> noticeFileList = noticeFileDao.find(noticeNo);
	%>
	
	
<jsp:include page="/template/header.jsp"></jsp:include> 

<div class="container-800 container-center" style="border:2px solid rgb(148, 161, 172); width : 100%; padding:20px; ">

	<div class="row" style="font-size:25px; font-weight: bold;">
		<%=noticeDto.getNoticeTitle()%>
		</div>
	<div class="row right" style="font-size: 13px;">
		No.<%=noticeDto.getNoticeNo()%>
		|
		등록일 : <%=noticeDto.getNoticeTime()%>
		|
		작성자 : <%=noticeDto.getNoticeWriter()%>
		|
		조회수 : <%=noticeDto.getNoticeHit()%>
	</div>
	
	<hr>
	<div class="row" style="min-height:250px; font-size: 15px;">
		<pre><%=noticeDto.getNoticeContent()%></pre>
	</div>
	<hr>
	<div class="row right">

		<a href="list.jsp" class="link-btn">목록보기</a>
		
		
		
		<%-- 글쓴이 권한일때만 보이는것--%>
		
		
		<%if(member&&owner){%>

		<a href="edit.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>" class="link-btn">수정하기</a>
		<a href="delete.txt?noticeNo=<%=noticeDto.getNoticeNo()%>" class="link-btn">삭제하기</a>
		<a href="write.jsp" class="link-btn">글쓰기</a>
		<%} %>

		

	</div>
	</div>
		


<%-- 첨부파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
<%if(!noticeFileList.isEmpty()){ %>
	<%for(NoticeFileDto noticeFileDto : noticeFileList){ %>
		<h6>
			<%=noticeFileDto.getNoticeFileUploadname() %>
			(<%=noticeFileDto.getNoticeFileSize()%> bytes)
			<a href="file/download.txt?noticeFileNo=<%=noticeFileDto.getNoticeFileNo()%>">
				다운로드
			</a>
			
			<img src="file/download.txt?noticeFileNo=<%=noticeFileDto.getNoticeFileNo()%>" width="50" height="50">
		</h6>
	<%} %>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>
