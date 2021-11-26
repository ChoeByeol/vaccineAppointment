<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 입력 : 백신번호(vaccineNo) --%>
<%
int vaccineNo = Integer.parseInt(request.getParameter("vaccineNo"));
%>

<%-- 처리 --%>
<%
// String memberId = (String)session.getAttribute("ses"); 
VaccineDao vaccineDao = new VaccineDao();
VaccineDto vaccineDto = vaccineDao.get(vaccineNo);
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#confirm-link").click(function() {
			return confirm("정말 삭제하시겠습니까?");
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
	<div class="row center">
		<h2><%=vaccineDto.getVaccineName()%></h2>
	</div>
	<div class="row float-container">

		<div class="row center">
			<table class="table table-border table-hover">
				<tr>
					<th width="30%">제조사</th>
					<td><%=vaccineDto.getVaccineCompany()%></td>
				</tr>
				<tr>
					<th>백신명</th>
					<td><%=vaccineDto.getVaccineValue()%></td>
				</tr>
				<tr>
					<th>연령</th>
					<td><%=vaccineDto.getVaccineAge()%>세 이상</td>
				</tr>
				<tr>
					<th>구성</th>
					<td><%=vaccineDto.getVaccineComposition()%></td>
				</tr>
				<tr>
					<th>접종 횟수</th>
					<td><%=vaccineDto.getVaccineShot()%>회</td>
				</tr>
				<tr>
					<th>접종 간격</th>
					<td><%=vaccineDto.getVaccineInterval()%></td>
				</tr>
				<tr>
					<th>접종량 및 방법</th>
					<td><%=vaccineDto.getVaccineMethod()%></td>
				</tr>
				<tr>
					<th>보관</th>
					<td><%=vaccineDto.getVaccineKeep()%></td>
				</tr>
				<tr>
					<th>유통</th>
					<td><%=vaccineDto.getVaccineExpire()%></td>
				</tr>
				<tr>
					<th>개봉 후 유효기간</th>
					<td><%=vaccineDto.getVaccineLife()%></td>
				</tr>
			</table>
		</div>


		<div class="row right">
			<a href="vaccine.jsp" class="link-btn">목록보기</a>
			<a href="vaccine_edit.jsp?vaccineNo=<%=vaccineDto.getVaccineNo()%>" class="link-btn">수정</a> 
			<a href="vaccineDelete.txt?vaccineNo=<%=vaccineDto.getVaccineNo()%>" class="link-btn" id="confirm-link">삭제</a>
		</div>

	</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>

