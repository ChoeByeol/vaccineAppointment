<%@page import="ncv.beans.NoticeDto"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
%>

<%
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.get(noticeNo);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
</style>
<form action="edit.txt" method="post" enctype="multipart/form-data>">


<div class="container-800 container-center">

 <div class="row center form-title-font">공지사항 수정하기</div>

   <!-- 제목 -->
   <div class="row center form-title-font">

   </div>
     <input type="hidden" name="noticeNo" value="<%=noticeDto.getNoticeNo()%>">
   <div class="row">
      <h3>제목</h3>
      <input type="text" name="noticeTitle" required value="<%=noticeDto.getNoticeTitle()%>" class="form-input-title form-input"  >
   </div>

   <div class="row">
      <h3>내용</h3>
      <textarea name="noticeContent" required cols="80" rows="20"class="form-input-board form-input"><%=noticeDto.getNoticeContent()%></textarea>
   </div>

   <div class="row">
      <h4><label class="form-block">첨부파일</label></h4>
      <input type="file" name="attach" class="form-btn form-file-btn">
   </div>

   <div class="row right">
      <input type="submit" value="등록" class="form-btn form-inline form-notice-btn">
   </div>

</div>

</form>

<jsp:include page="/template/footer.jsp"></jsp:include>

