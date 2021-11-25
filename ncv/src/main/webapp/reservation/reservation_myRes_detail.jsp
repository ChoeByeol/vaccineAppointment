<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memberId = (String) session.getAttribute("ses");
%>

<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%
ReservationDao reservationDao = new ReservationDao();
List<ReservationVo> myResList  = reservationDao.myResList(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<style>
	.link-btn {
		width:100%;
	}
	.flex-item{
		width:450px;
	}
	.quit-btn{
		border:none;
		padding:0.5rem;
		text-decoration:none;
		color:gray;
		font-family:NotoSans;
		font-size:12px;
	}
	.quit-btn:hover{
		color:red;
	}
	.table-title{
		font-family:Apple;
		font-size:20px;
		margin-bottom:10px;
		color:rgb(26, 44, 48);
	}
	.page-title{
		color:rgb(26, 44, 48);
	}
</style>

<div class="container-900 container-center">
	
	<div class="row">
		<div class="page-title">
		<h2 class="page-title">예약 상세 정보 조회</h2>
		</div>
		<br><br>
			<div class="row">
				<div class="table-title">
					<a class="table-title">예약정보</a>
				</div>
				<table class="table table-stripe">
					<tbody>
					
					<% for (ReservationVo reservationVo : myResList) { %>
						<tr class="table-line">
							<th width="30%"><%=reservationVo.getResShot()%>차 예약번호</th>
							<td><%=reservationVo.getResNo()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=reservationVo.getResShot()%>차 의료기관</th>
							<td><%=reservationVo.getClinicName()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=reservationVo.getResShot()%>차 예약일시</th>
							<td><%=reservationVo.getResDateDay()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=reservationVo.getResShot()%>차 예약시간</th>
							<td><%=reservationVo.getResTime()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=reservationVo.getResShot()%>차 예약백신</th>
							<td><%=reservationVo.getVaccineName()%></td>
						</tr>
						<%} %>
						<tr>						
					</tbody>
				</table>
			</div>
		</div>
		<a class="link-btn" href="<%=request.getContextPath()%>/ncv/index.jsp">메인페이지로</a>
		<a class="link-btn" href="<%=request.getContextPath()%>/reservation/reservation_myRes.jsp">이전페이지</a>
	</div>

 <jsp:include page="/template/footer.jsp"></jsp:include>