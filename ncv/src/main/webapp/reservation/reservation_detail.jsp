<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
int resNo = Integer.parseInt(request.getParameter("resNo"));
ReservationDao reservationDao = new ReservationDao();
ReservationVo reservationVo = reservationDao.get(resNo);

ReservationDto reservationDto = reservationDao.editGet(resNo);
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#cancel-link").click(function() {
			return confirm("정말 취소하시겠습니까?");
		});
	});
	
</script>


<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.flex-container>.reply-write-wrapper {
	width: 80%;
}

.flex-container>.reply-send-wrapper {
	flex-grow: 1;
}

.flex-container>.reply-send-wrapper>.form-btn, .flex-container>.reply-send-wrapper>.form-link-btn
	{
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>



<div class="container-600 container-center">

	<div class="row float-container">

		<div class="row center">
			<table class="table table-border table-hover">
				<tr>
					<th>예약번호</th>
					<td><%=reservationVo.getResNo()%></td>
				</tr>
				<tr>
					<th width="30%">이름</th>
					<td><%=reservationVo.getResName()%></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><%=reservationVo.getResRrn()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=reservationVo.getResPhone()%></td>
				</tr>
				<tr>
					<th>백신명</th>
					<td><%=reservationVo.getVaccineName()%></td>
				</tr>
				<tr>
					<th>접종차수</th>
					<td><%=reservationVo.getResShot()%>차</td>
				</tr>
				<tr>
					<th>예약병원</th>
					<td><%=reservationVo.getClinicName()%></td>
				</tr>
				<tr>
					<th>예약일</th>
					<td><%=reservationVo.getResDateDay()%></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><%=reservationVo.getResTime()%></td>
				</tr>

			</table>
		</div>


		<div class="row right">
						<a href="reservation_list.jsp" class="link-btn">목록보기</a>
						<a href="reservation_edit.jsp?resNo=<%=reservationDto.getResNo()%>" class="link-btn">변경</a>
						<a href="cancel.txt?resNo=<%=reservationDto.getResNo()%>" class="link-btn" id="cancel-link-link">예약취소</a>
		</div>

	</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
