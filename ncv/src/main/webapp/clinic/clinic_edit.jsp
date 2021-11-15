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

<form action="edit.txt" method="post">
	<table border = "0">
		<tr>
			<td>
				<input type="hidden" name="clinicNo" required value="<%=clinicDto.getClinicNo()%>">
			</td>
		</tr>
		<tr>
			<th>병원 이름</th>
			<td>
				<input type="text" name="clinicName" required value="<%=clinicDto.getClinicName()%>">
			</td>
		</tr>
		<tr>
			<th>병원 연락처</th>
			<td>
				<input type="text" name="clinicTel" required value="<%=clinicDto.getClinicTel()%>">
			</td>
		</tr>
		<tr>
			<th>병원 진료시간</th>
			<td>
				<input type="text" name="clinicTime" required value="<%=clinicDto.getClinicTime()%>">
			</td>
		</tr>
		<tr>
			<th>병원 우편번호</th>
			<td>
				<input type="text" name="clinicPostcode" required value="<%=clinicDto.getClinicPostcode()%>">
			</td>
		</tr>
		<tr>
			<th>병원 주소</th>
			<td>
				<input type="text" name="clinicAddress" required value="<%=clinicDto.getClinicAddress()%>">
			</td>
		</tr>
		<tr>
			<th>병원 상세주소</th>
			<td>
				<input type="text" name="clinicDetailAddress" required value="<%=clinicDto.getClinicDetailAddress()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="수정">
			</td>
		</tr>
	</table>
</form>