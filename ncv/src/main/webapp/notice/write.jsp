<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@page import="ncv.servlet.notice.NoticeWriteServlet"%>

 

<html>

 

<jsp:include page="/template/header.jsp"></jsp:include>

<style>

</style>

<script>
 

</script>

 

<body>

<form action="write.txt" method="post" enctype="multipart/form-data">

  

<div class="container-800 container-center">

 

 <div class="row center form-title-font">공지사항 </div>

 

   <!-- 제목 -->

   <div class="row center form-title-font">

 

   </div>

 

   <div class="row">

      <h3>제목</h3>

      <input type="text" name="noticeTitle" required class="form-input-title form-input" >

   </div>

 

   <div class="row">

      <h3>내용</h3>

      <textarea name="noticeContent" required rows="10" class="form-input-board form-input"></textarea>

   </div>

 

   <div class="row">

      <h4><label class="form-block">첨부파일</label></h4>

      <input type="file" name="attach" class="form-btn form-file-btn">

   </div>

 

   <div class="row right">

   <label>

   <input type="checkbox" name="noticefix" value=1>

   <span>중요 게시글로 설정</span></label>

	<a href="list.jsp" class="form-link-btn">목록</a> 

    <input type="submit" value="등록" class="form-btn form-inline form-notice-btn">

   </div>
   
  
 

</div>

 

</form>

 

</body>

 

<jsp:include page="/template/footer.jsp"></jsp:include>

 

</html>