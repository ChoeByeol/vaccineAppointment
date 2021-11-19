<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.title{
	margin-bottom:10px;
}
</style>
<form action="<%=request.getContextPath()%>/member/find_pw.txt" method="post">
      <div class="container-400 container-center">
         <div class="title row center">
         	<h1>비밀번호 찾기</h1>
         </div>
         		<div class="row">
         			<h4>아이디</h4>
         			<input type="text" name="memberId" required class="form-input" autocomplete="off">
         		</div>
         		<div class="row">
         			<h4>회원 이름</h4>
         			<input type="text" name="memberName" required class="form-input">
         		</div>
         		<div>
         			<h4>주민등록번호</h4>
         			<input type="text" name="memberRrn" required class="form-input">
         		</div>
         		<div class="row right">
         			<input type="submit" value="찾기" class="form-btn form-incline">
         		</div>
   
   <!-- error에 대한 처리 -->
	<%if(request.getParameter("error") != null){ %>
	<div class="row center"> 
		<h4 class="error">존재하지 않는 회원입니다.</h4>
	</div>
	<%} %>
</div>
</form>

 <jsp:include page="/template/footer.jsp"></jsp:include>