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
		$("#complete-link").click(function() {
			return confirm("정말 접종 완료 하시겠습니까?");
		});
	});
	
	$(function() {
		$("#cancel-link").click(function() {
			return confirm("정말 예약 취소하시겠습니까?");
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
		

<div class="container-500 container-center">

				<div class="row center">
					<h1>접종 완료 하기</h1>
				</div>
				
		<div>
	<form action="<%=request.getContextPath()%>/admin/shot/complete.txt" method="post">
			<input type="hidden" name="resOkNo" value = "<%=reservationDto.getResNo()%>">
			<input type="hidden" name="vaccineNo" value = "<%=reservationDto.getVaccineNo()%>">
			<input type="hidden" name="clinicNo" value = "<%=reservationDto.getClinicNo()%>">
			<table class="table table-border table-hover">
			
				<tr>
					<th>예약번호</th>
					<td><%=reservationVo.getResNo()%></td>
				</tr>
				
				<tr>
					<th>회원아이디</th>
					<td><%=reservationVo.getMemberId()%></td>
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
					<td>
					<%=reservationVo.getResShot()%>차 
					<input type="hidden" name="shotCount" value = "<%=reservationDto.getResShot()%>">
					</td>
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
				
				<div class="row right">
					<input type="submit" value="접종완료하기" id="complete-link" class="link-btn">
					<input type="button" value="메인으로가기" onclick=" location.href = '<%=request.getContextPath()%>'" class="link-btn">
				</div>
				
</form>
</div>

			<div class="row right">
			<a href="<%=request.getContextPath()%>/reservation/reservation_list.jsp" class="link-btn">목록보기</a>
			<a href="<%=request.getContextPath()%>/reservation/cancel.txt?resNo=<%=reservationDto.getResNo()%>" class="link-btn" id="cancel-link">예약취소</a>
		</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>