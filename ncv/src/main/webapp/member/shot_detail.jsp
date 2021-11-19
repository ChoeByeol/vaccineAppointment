<%@page import="ncv.beans.ShotVo"%>
<%@page import="ncv.beans.ShotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//	String memberId = (String)session.getAttribute("ses");
	String memberId = request.getParameter("memberId");
	ShotDao shotDao = new ShotDao();
	ShotVo shotVo = shotDao.get(memberId);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h2>접종 상세 내역</h2>

<table width="1100">
	<thead>
		<tr>
			<th>1차 접종 완료 여부</th>
			<th>최종 접종 완료 여부</th>
			<th>주민등록번호</th>
			<th>접종 차수</th>
			<th>예약 일시</th>
			<th>예약 시간</th>
			<th>예약자 이름</th>
			<th>예약자 전화번호</th>
			<th>병원 이름</th>
			<th>병원 주소</th>
			<th>접종한 백신</th>
		</tr>
	</thead>
	<tbody align="center">
			<tr>			
				<td><%=shotVo.getShotOne()%></td>
				<td><%=shotVo.getShotTwo()%></td>
				<td><%=shotVo.getShotMemberRrn()%></td>
				<td><%=shotVo.getShotCount()%></td>
				<td><%=shotVo.getResDate()%></td>
				<td><%=shotVo.getResTime()%></td>
				<td><%=shotVo.getResName()%></td>
				<td><%=shotVo.getResPhone()%></td>
				<td><%=shotVo.getClinicName()%></td>
				<td><%=shotVo.getClinicAddress()%></td>
				<td><%=shotVo.getVaccineName()%></td>
			</tr>
	</tbody>
</table>

<jsp:include page="/template/footer.jsp"></jsp:include>