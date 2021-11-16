<%@page import="ncv.beans.ClinicDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list  = clinicDao.list();
%>

<table border="1" width="700">
	<thead>
		<tr>
			<th>병원 번호</th>
			<th>병원 이름</th>
			<th>병원 전화번호</th>
			<th>병원 주소</th>
		<tr>
	</thead>
	<tbody>
		<%for(ClinicDto clinicDto : list){ %>
		<tr>
			<td><%=clinicDto.getClinicNo()%></td>
			<td><a href="clinic_select.jsp?clinicNo=<%=clinicDto.getClinicNo() %>"><%=clinicDto.getClinicName() %></a></td>
			<td><%=clinicDto.getClinicTel() %></td>
			<td><%="("+clinicDto.getClinicPostcode()+") "+clinicDto.getClinicAddress()+","+clinicDto.getClinicDetailAddress()%></td>
		<tr>
		<%} %>
	</tbody>
</table>
