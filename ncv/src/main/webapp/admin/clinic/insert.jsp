<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 주소 검색 모듈 -->
<script src="<%=request.getContextPath()%>/resource/js/clinic_address.js"></script>
<style>
.clinic-text{
	width:100%;
	height:20rem;
}
</style>
<div class="container-1000 container-center">
<form action="<%=request.getContextPath()%>/clinic/clinicInsert.txt" method="post">
		 <div class="container-500 container-center">	 
		 	<div class="row center">
		 		<h1>병원 등록</h1>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">병원이름</label>
		 		<input type="text" name="clinicName" required class="form-input">
		 	</div>
		 	<div class="row">
		 		<label class="label-text">전화번호</label>
		 		<input type="text" name="clinicTel" required class="form-input">
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">운영시간</label>
		 		<div class="row"><textarea name="clinicTime" required class="clinic-text"></textarea></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">우편번호</label><br>
		 		<input type="text" name="clinicPostcode" required readonly class="address-input" readonly>
		 		<button type="button" class="find-address-btn form-btn form-inline">주소 찾기</button>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">주소</label>
		 		<input type="text" name="clinicAddress" required readonly class="form-input" readonly>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">상세 주소</label>
		 		<input type="text" name="clinicDetailAddress" required class="form-input">
		 	</div>
		 	<input type="hidden" name="clinicSido" required placeholder="광역시도">
			<input type="hidden" name="clinicSigungu" required placeholder="시군구">
			<input type="hidden" name="clinicBname" required placeholder="읍면동">
			<div class="row">
				<input type="submit" value="병원 등록" class="form-btn">
			</div>
		</div>
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
