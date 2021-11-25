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
	
	//권한 판정
	
	boolean writer = memberId.equals(noticeDto.getNoticeWriter());
	
	/**
		조회수 중복 방지에 대한 시나리오
		1. 본인 글에 대한 조회 수 증가를 방지한다.
		2. 한 번 읽은 글에 대한 추가 조회 수 증가를 방지한다.
			= 세션에 사용자가 읽은 글 번호를 추가하여 관리하도록 구현
		3. IP를 이용한 조회 수 증가를 방지한다.
			= 접속자 IP 확인 명령을 통한 IP 비교
			= 사용자에게 반드시 이용 고지를 해야함(IP는 개인정보)
			= 전체 사용자에게 영항을 줄 수 있는 저장소가 필요
	*/
	
	//1.boardViewedNo 라는 이름의 저장소를 세션에서 꺼내어 본다.
	Set<Integer> noticeViewedNo = (Set<Integer>)session.getAttribute("noticeViewedNo");
	
	//2. boardViewedNo 가 null 이면 "처음 글을 읽는 상태"임을 말하므로 저장소를 신규로 생성
	if(noticeViewedNo == null){
		noticeViewedNo = new HashSet<>();
	
	}
	
	//3. 현재 글 번호를 저장소에 추가해본다
	//3-1. 추가가 된다면 이 글은 처음 읽는 글
	//3-2. 추가가 안된다면 이 글은 두 번 이상 읽은 글
	if(noticeViewedNo.add(noticeNo)){//처음 읽은 글인 경우
	noticeDao.readUp(noticeNo, memberId);
	}
	
	else{
	
	}
	
	//저장소 갱신

	
	session.setAttribute("noticeViewedNo", noticeViewedNo);
	

	%>
	
	<%
	
	//현재 게시글에 대한 파일정보를 조회
	NoticeFileDao noticeFileDao = new NoticeFileDao();
	List<NoticeFileDto> noticeFileList = noticeFileDao.find(noticeNo);
	%>
	
	
<%-- 출력 --%>

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
		<a href="write.jsp" class="link-btn">글쓰기</a>
		<a href="list.jsp" class="link-btn">목록보기</a>
		
		<%if(writer){ %>
		<a href="edit.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>" class="link-btn">수정하기</a>
		<a href="delete.txt?noticeNo=<%=noticeDto.getNoticeNo()%>" class="link-btn">삭제하기</a>
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