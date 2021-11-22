<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-400 container-center">
	<div class="row center">
		<h2>관리자 메인 페이지</h2>	
	</div>
	<hr>
	<div class="row center">
		<a href="./member/list.jsp" class="link-btn-block">회원 관리</a>
	</div>
	<div class="row center">
		<a href="./member/shot.jsp" class="link-btn-block">회원 접종 내역 관리</a>
	</div>
	<div class="row center">
		<a href="./clinic/list.jsp" class="link-btn-block">병원 관리</a>
	</div>
	<div class="row center">
		<a href="#" class="link-btn-block">백신 관리</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>