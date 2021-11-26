<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//백신 정보 이력을 조회
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> vaccineList = vaccineDao.list();
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
}
tbody {
	border-bottom: 1px solid black;
}

.table.table-font {
	font-size: 16px;
}
</style>


<!-- 이 페이지를 2단으로 구현 -->
<div class="container-900 container-center">
	<div class="row center">
		<h3>[ 백신 종류별 특성 ]</h3>
	</div>
	<div class="row float-container">

		<div class="row center">

			<table class="table table-border table-font">

				<thead>

					<tr>
						<td style="background-color:#EEEEEE;">백신명</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td style="background-color:#EEEEEE;"><a href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=<%=vaccineDto.getVaccineNo()%>"><%=vaccineDto.getVaccineName()%></a></td>
						<%
						}
						%>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>플랫폼</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccinePlatform()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>제조사</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineCompany()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>백신명</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineValue()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>연령</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineAge()%>세 이상</td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>구성</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineComposition()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>접종 횟수</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineShot()%>회</td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>접종 간격</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineInterval()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>접종량 및 방법</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineMethod()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>보관</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineKeep()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>유통</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineExpire()%></td>
						<%
						}
						%>
					</tr>
					<tr>
						<td>개봉 후 유효기간</td>
						<%
						for (VaccineDto vaccineDto : vaccineList) {
						%>
						<td><%=vaccineDto.getVaccineLife()%></td>
						<%
						}
						%>
					</tr>
				</tbody>

			</table>

		</div>
		<div class="row right">
			<a href="vaccine_write.jsp" class="link-btn">등록</a>
		</div>

	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
