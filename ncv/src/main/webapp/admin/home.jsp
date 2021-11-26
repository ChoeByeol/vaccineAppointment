<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
 .link-btn{
	font-family:NotoSans;
	font-size: 20px;
}
</style>
<div class="container-400 container-center">
	<div class="flex-item center">
		<h2>관리자 메인 페이지</h2>	
	</div>
	<hr>
	<div class="link-btn center">
		<a href="./member/list.jsp" class="link-btn">회원 관리</a>
	</div>
	<div class="link-btn center">
		<a href="./member/shot.jsp" class="link-btn">회원 접종 내역 관리</a>
	</div>
	<div class="link-btn center">
		<a href="./clinic/list.jsp" class="link-btn">병원 관리</a>
	</div>
	<div class="link-btn center">
		<a href="./vaccine/vaccine.jsp" class="link-btn">백신 관리</a>
	</div>
	<div class="link-btn center">
		<a href="./qna/list.jsp" class="link-btn">1대1문의 관리</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>