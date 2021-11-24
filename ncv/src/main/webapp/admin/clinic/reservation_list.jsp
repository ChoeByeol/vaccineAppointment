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

<%--출력--%>
<%for(ReservationDto reservationDto : list){ %>
	<%=reservationDto.getResNo()%>번 예약 정보
	<%=reservationDto.getMemberId()%>
	<%=reservationDto.getVaccineNo()%>
	<%=reservationDto.getClinicNo()%>
	<%=reservationDto.getResShot()%>
	<%=reservationDto.getResDate()%>
	<%=reservationDto.getResTime()%>
	<%=reservationDto.getResName()%>
	<%=reservationDto.getResRrn()%>
	<%=reservationDto.getResPhone()%>
<%} %>