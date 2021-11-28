<%@page import="java.util.List"%>
<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--입력--%>
<% int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));%>

<%--처리--%>
<%
	ReservationDao reservationDao = new ReservationDao();
	List<ReservationDto>list = reservationDao.listbyClinic(clinicNo);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div>
	<table class="table table-stripe">
		<tbody>
		
		<%for(ReservationDto reservationDto : list){ %>
			<tr class="table-line">
				<th width="30%"><%=reservationDto.getResNo()%>번 예약 정보</th>
				<td><%=reservationDto.getResNo()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">ID : </th>
				<td><%=reservationDto.getMemberId()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">병원 ID : <%=reservationDto.getClinicNo()%></th>
				<td><%=reservationDto.getClinicNo()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">백신 ID : </th>
				<td><%=reservationDto.getVaccineNo()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">접종차수 : </th>
				<td><%=reservationDto.getResShot()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">예약일 : </th>
				<td><%=reservationDto.getResDate()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">예약시간 : </th>
				<td><%=reservationDto.getResTime()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">예약자 성명 : </th>
				<td><%=reservationDto.getResName()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">예약자 주민등록번호 : </th>
				<td><%=reservationDto.getResRrn()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">예약자 연락처 : </th>
				<td><%=reservationDto.getResPhone()%></td>
			</tr>
			<%} %>
			<tr>						
		</tbody>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>