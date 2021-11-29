<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Shot2Dao shotDao = new Shot2Dao();
List<Shot2Vo> list  = shotDao.list();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.float-container>.float-item-left:nth-child(1) {
	width: 25%;
	padding: 0.5rem;
}

.float-container>.float-item-left:nth-child(2) {
	width: 75%;
	padding: 0.5rem;
}

.link-btn {
	width: 100%;
}

tr {
	display: table;
	table-layout: fixed;
	width: 100%;
	border-top: 1px solid black;
}
td {	
	border-left : 1px solid black;
	border-right : 1px solid black;
	vertical-align: middle;
	word-wrap: break-word;
    word-break: keep-all;
    font-size: 11px;
}
tbody {
	border-bottom: 1px solid black;
}

.table.table-font {
	font-size: 16px;
}
</style>

<div class="container-900 container-center">

	<div class="row center">
		<h2>임시 접종 완료 내역리스트</h2>		
	</div>

	<!-- 데이터 표시 영역 -->
	<div class="row center">

		<table class="table table-border table-hover">
			<thead>
				<tr>
					<td>접종번호</td>
					<td>예약번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>주민등록번호</td>
					<td>전화번호</td>
					<td>예약병원</td>
					<td>백신명</td>
					<td>접종차수</td>			
					<td>접종일</td>
				</tr>
			</thead>
			<tbody align="center">
			
				<% for (Shot2Vo shotVo : list) { %>
				<tr>	
					<td><%=shotVo.getShotNo()%></td>	
					<td><%=shotVo.getResOkNo()%></td>
					<td><%=shotVo.getMemberId()%></td>
					<td><%=shotVo.getMemberName()%></td>
					<td><%=shotVo.getResRrn()%></td>
					<td><%=shotVo.getResPhone()%></td>
					<td><%=shotVo.getClinicName()%></td>
					<td><%=shotVo.getVaccineName()%></td>			
					<td><%=shotVo.getShotCount()%>차</td>
					<td><%=shotVo.getShotDateDay()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>