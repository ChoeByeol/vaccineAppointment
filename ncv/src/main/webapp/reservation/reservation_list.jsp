
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
<script>
	$(function() {
		$("#confirm-link").click(function() {
			return confirm("정말 취소하시겠습니까?");
		});
	});
</script>

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
					<th>예약번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>주민등록번호</th>
					<th>전화번호</th>
					<th>백신명</th>
					<th>접종차수</th>
					<th>예약병원</th>
					<th>예약일</th>
					<th>예약시간</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(ReservationVo reservationVo : reservationList){ %>
				<tr>
					<td><%=reservationVo.getResNo()%></td>
					<td><%=reservationVo.getMemberId()%></td>
					<td><%=reservationVo.getResName()%></td>
					<td><%=reservationVo.getResRrn()%></td>
					<td><%=reservationVo.getResPhone()%></td>
					<td><%=reservationVo.getVaccineName()%></td>
					<td><%=reservationVo.getShotNo()%>차</td>
					<td><%=reservationVo.getClinicName()%></td>
					<td><%=reservationVo.getResDateDay()%></td>
					<td><%=reservationVo.getResTime()%></td>
					<td>
						<a href="reservation_detail.jsp?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn">상세</a>
						<a href="reservation_edit.jsp?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn">변경</a>
						<a href="cancel.txt?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn" id="confirm-link">예약취소</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>