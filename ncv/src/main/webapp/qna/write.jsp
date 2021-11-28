<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>    

<form action="write.txt" method="post" enctype="multipart/form-data">

<div class="container-800 container-center">
 <div class="row center form-title-font">1:1 문의</div>
   <!-- 제목 -->
   <div class="row center form-title-font">
   </div>
   <div class="row">
      <h3>제목</h3>
      <input type="text" name="qnaTitle" required class="form-input-title form-input" >
   </div>
   <div class="row">
      <h3>내용</h3>
      <textarea name="qnaContent" required rows="10" class="form-input-board form-input"></textarea>
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
