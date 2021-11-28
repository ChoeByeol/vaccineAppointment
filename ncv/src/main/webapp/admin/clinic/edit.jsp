<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--입력--%>
<% int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));%>

<%--처리--%>
<%
	ClinicDao clinicDao = new ClinicDao();
	ClinicDto clinicDto = clinicDao.select(clinicNo);
%>
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
<form action="edit.txt" method="post">
<input type="hidden" name="clinicNo" required value="<%=clinicDto.getClinicNo()%>">
		 <div class="container-500 container-center">	 
		 	<div class="row center">
		 		<h1>병원 정보 수정</h1>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">병원이름</label>
		 		<input type="text" name="clinicName" required value="<%=clinicDto.getClinicName()%>" class="form-input">
		 	</div>
		 	<div class="row">
		 		<label class="label-text">전화번호</label>
		 		<input type="text" name="clinicTel" required value="<%=clinicDto.getClinicTel()%>" class="form-input">
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">운영시간</label>
		 		<textarea name="clinicTime" placeholder="병원 운영시간" required class="clinic-text"><%=clinicDto.getClinicNo()%></textarea>
		 	</div>
			<div class="row">
		 		<label class="label-text">우편번호</label><br>
		 		<input type="text" name="clinicPostcode" placeholder="우편번호"  readonly class="address-input" readonly value="<%=clinicDto.getClinicPostcode()%>">
		 		<button type="button" class="find-address-btn form-btn form-inline">주소 찾기</button>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">주소</label>
		 		<input type="text" name="clinicAddress" required readonly value="<%=clinicDto.getClinicAddress()%>" class="form-input">
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">상세 주소</label>
		 		<input type="text" name="clinicDetailAddress" required value="<%=clinicDto.getClinicDetailAddress()%>" class="form-input">
		 	</div>
		<input type="hidden" name="clinicSido" required value="<%=clinicDto.getClinicSido()%>">
		<input type="hidden" name="clinicSigungu" required value="<%=clinicDto.getClinicSigungu()%>">
		<input type="hidden" name="clinicBname" required value="<%=clinicDto.getClinicBname()%>">
			<div class="row">
				<input type="submit" value="수정" class="form-btn">
			</div>
		</div>	
</form>

<%if(request.getParameter("error") != null){ %>
	<h4 class="error">정보 수정 오류!</h4>
<%} %>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>