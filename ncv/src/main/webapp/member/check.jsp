<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.flex-container > .form-input {
		width:75%;
	}
	.flex-container > .form-btn {
		width:25%;
		height:50px;
		margin-top:10px;
		margin-bottom:20px;
		margin-left: 2px;
	}
</style>

 <form action="quit.txt" method="post">

<div class="container-400 container-center">
	<div class="row center">
		<h2>비밀번호 확인</h2>
	</div>
	<div class="row flex-container">
		<input type="password" name="memberPw" required class="form-input">
		<input type="submit" value="회원탈퇴" class="form-btn form-inline find-address-btn">
	</div>
	
	<%if(request.getParameter("error") != null){ %>
	<div class="row center">
		<h4 class="error">입력 정보가 일치하지 않습니다</h4>
	</div>
	<%} %>

</div>

</form>

  <jsp:include page="/template/footer.jsp"></jsp:include>
