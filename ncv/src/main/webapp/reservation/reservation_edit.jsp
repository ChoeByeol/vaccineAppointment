<%@page import="ncv.beans.ClinicDao"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 입력 : 예약번호(resNo) --%>
<%
	int resNo = Integer.parseInt(request.getParameter("resNo"));
%>

<%
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list = clinicDao.list();
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
<input type="hidden" name="shotNo" value="<%=reservationDto.getResShot()%>">

<div class="container-400 container-center">
	<div class="row center">
		<h2>예약 변경</h2>	
	</div>


	
	<div class="row">
			<label>예약 병원 변경</label>
			<select name="clinicNo">
				<%for(ClinicDto clinicDto : list){ %>
				<option value="<%=clinicDto.getClinicNo()%>">
				<%=clinicDto.getClinicName()+" / "+clinicDto.getClinicAddress()+" / "+clinicDto.getClinicDetailAddress()%>
				</option>
					<%} %>
			</select>
	</div>		
	
	<div class="row">
				<label>예약일 변경</label>
				<input type="date" name="resDate">
			</div>
			
	<div class="row">
				<label>예약 시간 변경</label>
				<select name="resTime">
					<option>09:00</option>
					<option>10:00</option>
					<option>11:00</option>
					<option>12:00</option>
					<option>13:00</option>
					<option>14:00</option>
					<option>15:00</option>
					<option>16:00</option>
					<option>17:00</option>
					<option>18:00</option>
				</select>
			</div>
	</div>
	
		<div class="row right">
		<input type="submit" value="변경" class="form-btn form-inline">
		<button type="button" class="form-btn form-inline" onclick="location.href='../reservation/reservation_detail.jsp?resNo=<%=reservationDto.getResNo()%>';">취소</button>
	</div>
	


</form>



<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>
