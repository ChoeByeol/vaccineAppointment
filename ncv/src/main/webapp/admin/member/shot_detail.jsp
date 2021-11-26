<%@page import="ncv.beans.ShotVo"%>
<%@page import="ncv.beans.ShotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberId = request.getParameter("memberId");
	ShotDao shotDao = new ShotDao();	
	ShotVo shotVo = shotDao.get(memberId);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
	<div class="row center">
		<h2>접종 상세 내역</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>1차 접종 완료 여부</th>
					<td><%=shotVo.getShotOne()%></td>
				</tr>
				<tr>
					<th>최종 접종 완료 여부</th>
					<td><%=shotVo.getShotTwo()%></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><%=shotVo.getShotMemberRrn()%></td>
				</tr>
				<tr>
					<th>접종 차수</th>
					<td><%=shotVo.getShotCount()%></td>
				</tr>
				<tr>
					<th>예약 일시</th>
					<td><%=shotVo.getResDate()%></td>
				</tr>
				<tr>
					<th>예약 시간</th>
					<td><%=shotVo.getResTime()%></td>
				</tr>
				<tr>
					<th>예약자 이름</th>
					<td><%=shotVo.getResName()%></td>
				</tr>
				<tr>
					<th>예약자 전화번호</th>
					<td><%=shotVo.getResPhone()%></td>
				</tr>
				<tr>
					<th>병원 이름</th>
					<td><%=shotVo.getClinicName()%></td>
				</tr>
				<tr>
					<th>병원 주소</th>
					<td><%=shotVo.getClinicAddress()%></td>
				</tr>
				<tr>
					<th>접종한 백신</th>
					<td><%=shotVo.getVaccineName()%></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>