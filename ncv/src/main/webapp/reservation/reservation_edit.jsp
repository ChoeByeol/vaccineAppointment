<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 입력 : 예약번호(resNo) --%>
<%
	int resNo = Integer.parseInt(request.getParameter("resNo"));
%>


<%
ReservationDao reservationDao = new ReservationDao();
ReservationDto reservationDto = reservationDao.editGet(resNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<form action="edit.txt" method="post">
<input type="hidden" name="resNo" value="<%=reservationDto.getResNo()%>">
<input type="hidden" name="memberId" value="<%=reservationDto.getMemberId()%>">
<input type="hidden" name="resName" value="<%=reservationDto.getResName()%>">
<input type="hidden" name="resRrn" value="<%=reservationDto.getResRrn()%>">
<input type="hidden" name="resPhone" value="<%=reservationDto.getResPhone()%>">
<input type="hidden" name="vaccineNo" value="<%=reservationDto.getVaccineNo()%>">
<input type="hidden" name="shotNo" value="<%=reservationDto.getShotNo()%>">

<div class="container-400 container-center">
	<div class="row center">
		<h2>예약 변경</h2>	
	</div>

	<div class="row">
	<label>예약병원변경</label>
	<input type="text" name="clinicNo" value="<%=reservationDto.getClinicNo()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>예약일정변경</label>
	<input type="text" name="resDate" value="<%=reservationDto.getResDateDay()%>" class="form-input">
	</div>

	<div class="row">
	<label>예약시간변경</label>
	<input type="text" name="resTime" value="<%=reservationDto.getResTime()%>" class="form-input">
	</div>
	
		<div class="row right">
		<input type="submit" value="변경" class="form-btn form-inline">
		<button type="button" class="form-btn form-inline" onclick="location.href='../reservation/reservation_detail.jsp?resNo=<%=reservationDto.getResNo()%>';">취소</button>
	</div>
	
</div>

</form>



<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>
