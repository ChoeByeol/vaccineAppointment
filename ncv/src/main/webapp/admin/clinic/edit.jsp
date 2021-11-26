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
<div class="container-1000 container-center">
<form action="edit.txt" method="post">
		<input type="hidden" name="clinicNo" required value="<%=clinicDto.getClinicNo()%>">
		병원 이름 : <input type="text" name="clinicName" required value="<%=clinicDto.getClinicName()%>">
		<br><br>
		병원 연락처 : <input type="text" name="clinicTel" required value="<%=clinicDto.getClinicTel()%>">
		<br><br>
		진료시간 : <input type="text" name="clinicTime" required value="<%=clinicDto.getClinicTime()%>">
		<br><br>
		우편번호 : <input type="text" name="clinicPostcode" required value="<%=clinicDto.getClinicPostcode()%>">
		<button type="button" class="find-address-btn">주소 검색</button>
		<br><br>
		병원 주소 : <input type="text" name="clinicAddress" required value="<%=clinicDto.getClinicAddress()%>">
		<br><br>
		상세주소 : <input type="text" name="clinicDetailAddress" required value="<%=clinicDto.getClinicDetailAddress()%>">
		<br><br>
		<input type="submit" value="수정">
		<!-- 아래 히든으로 바꿔줘야함  -->
		<input type="text" name="clinicSido" required value="<%=clinicDto.getClinicSido()%>">
		<input type="text" name="clinicSigungu" required value="<%=clinicDto.getClinicSigungu()%>">
		<input type="text" name="clinicBname" required value="<%=clinicDto.getClinicBname()%>">		
</form>

<%if(request.getParameter("error") != null){ %>
	<h4 class="error">정보 수정 오류!</h4>
<%} %>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>