<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%
   String boardSuperno = request.getParameter("boardSuperno");
%>
    
<%-- 처리 --%>

<%
   boolean answer = boardSuperno != null;
   String title = answer ? "답글 작성" : "1 : 1 문의";
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.
</style>
<form action="write.txt" method="post" enctype="multipart/form-data">
<%-- 답글일 경우에는 반드시 "상위글번호(boardSuperno)" 를 처리페이지로 전송해야 한다 --%>

<%if(answer){ %>
<input type="hidden" name="boardSuperno" value="<%=boardSuperno%>">
<%} %>

<div class="container-800 container-center">

   <!-- 제목 -->
   <div class="row center form-title-font">
      <%=title%>      
   </div>
   
   <div class="row">
      <h3>제목</h3>
      <input type="text" name="boardTitle" required class="form-input-title form-input" >
   </div>
   
   <div class="row">
      <h3>내용</h3>
      <textarea name="boardContent" required rows="10" class="form-input-board form-input"></textarea>
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
