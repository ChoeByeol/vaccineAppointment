<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@page import="ncv.beans.ClinicDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String memberId = (String) session.getAttribute("ses");
%>



<%
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list  = clinicDao.list();
%>	

<%
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> vaccineList = vaccineDao.list();
%>


<%
			ReservationDao reservationDao = new ReservationDao();
			List<ReservationVo> myResList = reservationDao.myResList(memberId);
			ReservationDto reservationDto = reservationDao.vaccineCheck(memberId);

			int vacNo = 0;
			if (reservationDto != null) {
				vacNo= reservationDto.getVaccineNo();
			}

			boolean check = memberId != null && myResList.size() == 0; // 미접종
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

	<form action="reserve.txt" method="post">
<input type="hidden" name="memberId" value="<%=memberId%>">
		
	<div class="container-400 container-center">
		
	<div class="row center">
		<h1>예약하기</h1>
	</div>
					
	<div class="row">
			<label>예약자 이름</label>
			<input type="text" name="resName">
	</div>
	<div class="row">
			<label>예약자 주민번호</label>
			<input type="text" name="resRrn">
	</div>
	<div class="row">
			<label>예약자 전화번호</label>
			<input type="tel" name="resPhone">
	</div>
			
	<% if (vacNo == 1) { %>				
		<div class="row">
			<label>백신</label>
			<input type="hidden" name="vaccineNo" value="1">
			<label>화이자</label>
		</div>	
	<%} else if (vacNo == 2){ %>	
		<div class="row">
			<label>백신</label>
			<input type="hidden" name="vaccineNo" value="2">
			<label>모더나</label>
		</div>					
	<%} else if (vacNo == 3){ %>
		<div class="row">
			<label>백신</label>
			<input type="hidden" name="vaccineNo" value="3">
			<label>아스트라제네카</label>
		</div>	
		<%} else{ %>		
		<div class="row">
			<label>백신</label>
			<select name="vaccineNo">
			<%for(VaccineDto vaccineDto : vaccineList){ %>
			<option value="<%=vaccineDto.getVaccineNo()%>">
			<%=vaccineDto.getVaccineName()%>
			</option>
			<%} %>
			</select>
			<% } %>	
		</div>		
			
		</div>
		<div class="container-400 container-center">	
			
	<% if (check) { %>
	<div class="row">
		<label>접종차수</label>
		<input type="hidden" name="resShot" value="1">
		<label>1차</label>
	</div>			
	<%} else{ %>			
		<div class="row">
			<label>접종차수</label>
			<input type="hidden" name="resShot" value="2">
			<label>2차</label>
		</div>				
	<% } %>

	<div class="row">
		<label>의료기관</label>
		<select name="clinicNo" >
			<option value="" selected="selected" hidden="hidden">병원선택</option>
				<%for(ClinicDto clinicDto : list){ %>
				<option value="<%=clinicDto.getClinicNo()%>">
				<%=clinicDto.getClinicName()+" / "+clinicDto.getClinicAddress()+" / "+clinicDto.getClinicDetailAddress()%>
				</option>
				<%} %>
			</select>
		</div>		
			
	<div class="row">
		<label>예약일</label>
		<input type="date" name="resDate">
	</div>
			
	<div class="row">
		<label>예약시간</label>
		<select name="resTime">
			<option>09:00</option>
			<option>10:00</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
		</select>
	</div>
			

	<div class="row right">
		<input type="submit" value="예약" class="link-btn" >
		<input type="button" value="취소" onclick=" location.href = '<%=request.getContextPath()%>'" class="link-btn">
	</div>

	</div>
	</form>
	

<jsp:include page="/template/footer.jsp"></jsp:include>