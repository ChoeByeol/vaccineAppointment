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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var answer = document.getElementById("cClinicNo").value;
			window.opener.document.getElementById("pClinicNo").value = answer;
			
			var answer2 = document.getElementById("cClinicName").value;
			window.opener.document.getElementById("pClinicName").value = answer2;

			window.close();
		});
	});
</script>
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

<a href="javascript:history.back()">목록으로</a>
<form>
	<button id="btn">선택하기</button>
	<input type="hidden" id="cClinicNo" value="<%=clinicDto.getClinicNo() %>">
	<input type="hidden" id="cClinicName" value="<%=clinicDto.getClinicName()%>">
</form>