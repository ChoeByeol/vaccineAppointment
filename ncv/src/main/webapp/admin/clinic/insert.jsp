<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 주소 검색 모듈 -->
<script src="<%=request.getContextPath()%>/resource/js/clinic_address.js"></script>

<div class="container-1000 container-center">
<form action="<%=request.getContextPath()%>/clinic/clinicInsert.txt" method="post">
	<input type="text" name="clinicName" placeholder="병원 이름">
	<br>
	<input type="text" name="clinicTel" placeholder="병원 전화번호">
	<br>
	<textarea name="clinicTime" placeholder="병원 운영시간" rows="10" cols="60"></textarea>
	<br>
    <input type="text" name="clinicPostcode" placeholder="우편번호">
    <button type="button" class="find-address-btn">주소 찾기</button><br>
    <input type="text" name="clinicAddress" placeholder="주소">
    <br>
	<input type="text" name="clinicDetailAddress" placeholder="상세주소">
	<br>
	<!-- 히든으로 타입바꿔서 넣어야함 플레이스홀더도 지우고 -->
	<input type="text" name="clinicSido" placeholder="광역시도">
	<input type="text" name="clinicSigungu" placeholder="시군구">
	<input type="text" name="clinicBname" placeholder="읍면동">
	<br>
	<input type="submit" value="병원 등록">
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>