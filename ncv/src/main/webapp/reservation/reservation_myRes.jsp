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
		<%if(myResList.size() > 0) {%>
		<h2 class="page-title">예약 결과가 조회되었습니다!</h2>
		<%} else {%>
		<h2 class="page-title">예약 내역이 존재하지 않습니다.</h2>
		<%} %>
		</div>
		<br><br>
			<!-- 1단 : 예약자 정보 -->
			<div class="row">
				<div>
					<a class="table-title">예약자정보</a>
				</div>
				<table class="table table-stripe">
					<tbody>
						<tr class="table-line">
							<th width="30%">아이디</th>
							<td><%=memberDto.getMemberId()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">이름</th>
							<td><%=memberDto.getMemberName()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">주민등록번호</th>
 							<td><%=memberDto.getMemberRrn()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">핸드폰번호</th>
							<td><%=memberDto.getMemberPhone()%></td>
						</tr>					
					</tbody>
				</table>
			</div>
			<br><br><br>
<%if(myResList.size() > 0) {%>
		<!-- 2단 -->
			<!-- 예약 정보 -->
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
						<%} %>
						<tr>						
					</tbody>
				</table>
			</div>
		</div>
		<a class="link-btn" href="<%=request.getContextPath()%>/reservation/reservation_myRes_detail.jsp">예약정보 상세조회</a>
	</div>
<%} else {%>
	<a class="link-btn" href="<%=request.getContextPath()%>/reservation/check.txt">예약하러 가기</a>
<%} %>
 <jsp:include page="/template/footer.jsp"></jsp:include>