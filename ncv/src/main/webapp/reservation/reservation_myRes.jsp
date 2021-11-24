<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memberId = (String) session.getAttribute("ses");
%>

<%
ReservationDao reservationDao = new ReservationDao();
List<ReservationVo> myResList  = reservationDao.myResList(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>


.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .no,.sub_news .memberid,.sub_news .name,.sub_news .rrn,.sub_news .phmoe,.sub_news .vacineName,.sub_news .shot,.sub_news .clinicname,.sub_news .nodateday,.sub_news .time{padding:0;font-family:Tahoma;font-size:14px;line-height:normal}

</style>

<div class="container-900 container-center">

	<div class="row center">
		<h2>나의 예약리스트</h2>		
	</div>

	<!-- 데이터 표시 영역 -->
	<div class="row center">

		<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
		<caption>나의 예약 리스트</caption>

			<thead>
				<tr>
				<th scope="col" style="width: 70px;">예약번호</th>
				<th scope="col">아이디</th>
				<th scope="col" style="width: 70px;">이름</th>
				<th scope="col">주민등록번호</th>
				<th scope="col">전화번호</th>
				<th scope="col">백신명</th>
				<th scope="col" style="width: 55px;">접종차수</th>
				<th scope="col">예약병원</th>
				<th scope="col"style="width: 70px;">예약일</th>
				<th scope="col"style="width: 70px;">예약시간</th>
				</tr>
			</thead>
			<tbody>
			
				<% for (ReservationVo reservationVo : myResList) { %>
				<tr>		
					<td class="no"><%=reservationVo.getResNo()%></td>
					<td class="memberid"><%=reservationVo.getMemberId()%></td>
					<td class="name"><%=reservationVo.getResName()%></td>
					<td class="rrn"><%=reservationVo.getResRrn()%></td>
					<td class="phone"><%=reservationVo.getResPhone()%></td>
					<td class="vaccineName"><%=reservationVo.getVaccineName()%></td>
					<td class="shot"><%=reservationVo.getResShot()%>차</td>
					<td class="clinicname"><%=reservationVo.getClinicName()%></td>
					<td class="dateday"><%=reservationVo.getResDateDay()%></td>
					<td class="time"><%=reservationVo.getResTime()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>

	</div>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>