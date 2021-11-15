<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <jsp:include page="/template/header.jsp"></jsp:include>
 
 <form action="join.kh" method="post" enctype="multipart/form-data">
 
 <div class="container-400 container-center">
 
 	<div class="row center">
 		<h1>회원가입</h1>
 	</div>
 	<div class="row">
 		<label>아이디</label>
 		<input type="text" name="memberId" required class="form-input">
 	</div>
 	<div class="row">
 		<label>비밀번호</label>
 		<input type="password" name="memberPw" required class="form-input">
 	</div>
  	<div class="row">
 		<label>비밀번호 재확인</label>
 		<input type="password" name="memberPw2" required class="form-input">
 	</div>
 	 <div class="row">
 		<label>이름</label>
 		<input type="text" name="memberName" required class="form-input">
 	</div>
 	 <div class="row">
 		<label class="form-block">주민등록번호</label>
 		<input type="number" name="memberRrn" required class="form-input">
 	</div>
 	 <div class="row">
 		<label class="form-block">성별</label>
 		<input type="text" name="memberGender" required class="form-input">
 	</div>
	<div class="row">
 		<label>전화번호</label>
 		<input type="tel" name="memberPhone" required class="form-input">
 	</div>
 	 <div class="row">
 		<label>주소</label>
 		<input type="text" name="memberAddress" required class="form-input">
 	</div>
	<div class="row">
		<input type="submit" value="가입" class="form-btn">
	</div>
</div>
</form>
 
 <jsp:include page="/template/footer.jsp"></jsp:include>