
<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ReservationDao reservationDao = new ReservationDao();
List<ReservationVo> reservationList  = reservationDao.list2();
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
		<h2>임시 예약리스트</h2>		
	</div>

	<!-- 데이터 표시 영역 -->
	<div class="row center">

		<table class="table table-border table-hover">
			<thead>
				<tr>
					<td>예약번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>주민등록번호</td>
					<td>전화번호</td>
					<td>백신명</td>
					<td>접종차수</td>
					<td>예약병원</td>
					<td>예약일</td>
					<td>예약시간</td>
					<td>접종상태</td>
				</tr>
			</thead>
			<tbody align="center">
			
				<% for (ReservationVo reservationVo : reservationList) { %>
				<tr>		
					<td><a href="reservation_detail.jsp?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn"><%=reservationVo.getResNo()%></a></td>
					<td><%=reservationVo.getMemberId()%></td>
					<td><%=reservationVo.getResName()%></td>
					<td><%=reservationVo.getResRrn()%></td>
					<td><%=reservationVo.getResPhone()%></td>
					<td><%=reservationVo.getVaccineName()%></td>
					<td><%=reservationVo.getResShot()%>차</td>
					<td><%=reservationVo.getClinicName()%></td>
					<td><%=reservationVo.getResDateDay()%></td>
					<td><%=reservationVo.getResTime()%></td>
					<td><a href="../shot/shot_complete.jsp?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn">접종완료하러가기</a></td>

				</tr>
				<%} %>
			</tbody>
		</table>

	</div>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>