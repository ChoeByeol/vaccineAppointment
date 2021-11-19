<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:include page="/template/header.jsp"></jsp:include>
 <style>
 .link-btn{
 	font-family:NotoSans;
 }
 </style>
 
 <form action="<%=request.getContextPath()%>/member/login.txt" method="post">
  
 <div class="container-400 container-center">
 	<div class="row center">
 		<h1>회원 로그인</h1>
 	</div>
 	 <div class="row">
 		<h1>아이디</h1>
 		<input type="text" name="memberId" required class="form-input" autocomplete="off">
 	</div>
 	<div class="row">
 		<h1>비밀번호</h1>
 		<input type="password" name="memberPw" required class="form-input">
 	</div>
  	<div class="row right">
 		<input type="submit" value="로그인" required class="form-btn form-incline">
 	</div>
 	<div class="row center">
 		<a href="<%=request.getContextPath()%>/member/find_id.jsp" class="link-btn">아이디 찾기</a>|<a href="<%=request.getContextPath()%>/member/find_pw.jsp" class="link-btn">비밀번호 찾기</a>|<a href="<%=request.getContextPath()%>/member/join.jsp"class="link-btn">회원가입</a>
 	</div>
  
	<%if(request.getParameter("error") != null){ %>
	<div class="row center"> 
		<h4 class="error">로그인 정보가 일치하지 않습니다.</h4>
	</div>
	<%} %>
</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>
