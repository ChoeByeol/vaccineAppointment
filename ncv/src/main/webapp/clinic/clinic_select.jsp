<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--입력--%>
<% int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));%>

<%--처리--%>
<%
    ClinicDao clinicDao = new ClinicDao();
    ClinicDto clinicDto = clinicDao.select(clinicNo); //상세조회
%>

<%--출력--%>
<table border="1" width="300">
    <tbody>
        <tr>
            <th>병원 이름</th>
            <td><%=clinicDto.getClinicName()%></td>
        </tr>
        <tr>
            <th>병원 연락처</th>
            <td><%=clinicDto.getClinicTel()%></td>
        </tr>
        <tr>
            <th>병원 진료시간</th>
            <td><%=clinicDto.getClinicTime()%></td>
        </tr>
        <tr>
            <th>병원 우편번호</th>
            <td><%=clinicDto.getClinicPostcode()%></td>
        </tr>
        <tr>
            <th>병원 주소</th>
            <td><%=clinicDto.getClinicAddress()%></td>
        </tr>
        <tr>
            <th>병원 상세주소</th>
            <td><%=clinicDto.getClinicDetailAddress()%></td>
        </tr>
    </tbody>

<%--출력--%>
<table border="1" width="300">
	<tbody>
		<tr>
			<th>병원 이름</th>
			<td><%=clinicDto.getClinicName()%></td>
		</tr>
		<tr>
			<th>병원 연락처</th>
			<td><%=clinicDto.getClinicTel()%></td>
		</tr>
		<tr>
			<th>병원 진료시간</th>
			<td><%=clinicDto.getClinicTime()%></td>
		</tr>
		<tr>
			<th>병원 우편번호</th>
			<td><%=clinicDto.getClinicPostcode()%></td>
		</tr>
		<tr>
			<th>병원 주소</th>
			<td><%=clinicDto.getClinicAddress()%></td>
		</tr>
		<tr>
			<th>병원 상세주소</th>
			<td><%=clinicDto.getClinicDetailAddress()%></td>
		</tr>
	</tbody>
</table>

<a href="edit.jsp?clinicNo=<%=clinicDto.getClinicNo()%>">병원 정보 수정</a>
<a href="delete.txt?clinicNo=<%=clinicDto.getClinicNo()%>">병원 정보 삭제</a>