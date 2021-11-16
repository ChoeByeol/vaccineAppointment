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

<h2>접종 상세 내역</h2>

<table width="1100">
	<thead>
		<tr>
			<th>접종 번호</th>
			<th>예약 번호</th>
			<th>1차 접종 완료 여부</th>
			<th>최종 접종 완료 여부</th>
			<th>주민등록번호</th>
			<th>접종 차수</th>
			<th>예약 일시</th>
			<th>예약 시간</th>
			<th>예약자 이름</th>
			<th>예약자 전화번호</th>
		</tr>
	</thead>
	<tbody align="center">
			<tr>			
				<td><%=shotVo.getShotNo()%></td>
				<td><%=shotVo.getResNo()%></td>
				<td><%=shotVo.getShotStCom()%></td>
				<td><%=shotVo.getShotEndCom()%></td>
				<td><%=shotVo.getShotMemberNo()%></td>
				<td><%=shotVo.getResShotNo()%></td>
				<td><%=shotVo.getResDate()%></td>
				<td><%=shotVo.getResTime()%></td>
				<td><%=shotVo.getResName()%></td>
				<td><%=shotVo.getResPhone()%></td>
			</tr>
	</tbody>
</table>

<jsp:include page="/template/footer.jsp"></jsp:include>