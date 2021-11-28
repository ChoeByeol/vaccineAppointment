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

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .no,.sub_news .memberId,.sub_news .name,.sub_news .rrn,.sub_news .phone,.sub_news .vacineName,.sub_news .shot,.sub_news .clinicname,.sub_news .nodateday,.sub_news .time,.sub_news .detailno{padding:0;font-family:Tahoma;font-size:14px;line-height:normal}

<style>
 .button_base {
    position:absolute;
    bottom:10%;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 100px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
    color: #000000;
    background-color:#dee2e6;
 	padding:7px; 
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}
.btn:hover {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}
<<<<<<< HEAD
@-webkit-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}
@-moz-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}
.no{
	width:20px;
}
.memberId{
	width:90px;
}
.name{
	width:70px;
}
.rrn{
	width:120px;
}
.phone{
	width:90px;
}
.vaccineName{
	width:120px;
}
.shot{
	width:55px;
}
.clinicName{
	width:65px;
}
.dateDay{
	width70px;
}
.time{
	width:55px;
}
.detailNo{
	width:90px;
}

</style>


<div class="container-900 container-center">

	<div class="row center">
		<h2>임시 예약리스트</h2>		
	<hr>
	</div>

	<!-- 데이터 표시 영역 -->
	<div class="row center">
  <form action="<%=request.getContextPath()%>/admin/shot/complete.txt" method="post">
  
				<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
				<caption>나의 예약 리스트</caption>
				
				<thead>
				<tr>
					<th class="no" style="width: 60px;">예약번호</th>
					<th class="memberId" style="width: 90px;">아이디</th>
					<th scope="col" style="width: 70px;">이름</th>
					<th scope="col" style="width: 120px;">주민등록번호</th>
					<th scope="col" style="width: 90px;">전화번호</th>
					<th scope="col" style="width: 120px;">백신명</th>
					<th scope="col" style="width: 55px;">접종차수</th>
					<th scope="col" style="width: 65px;">예약병원</th>
					<th scope="col"style="width: 70px;">예약일</th>
					<th scope="col"style="width: 55px;">예약시간</th>
					<th scope="col" style="width: 90px;">접종완료하기</th>
				</tr>
			</thead>
			<tbody align="center">
			
				<% for (ReservationVo reservationVo : reservationList) { %>
				<tr>		
					<td class="no"><a href="reservation_detail.jsp?resNo=<%=reservationVo.getResNo()%>" class="a-link-btn"><%=reservationVo.getResNo()%></a></td>
					<td class="memberId"><%=reservationVo.getMemberId()%></td>
					<td class="name"><%=reservationVo.getResName()%></td>
					<td class="rrn"><%=reservationVo.getResRrn()%></td>
					<td class="phone"><%=reservationVo.getResPhone()%></td>
					<td class="vaccineName"><%=reservationVo.getVaccineName()%></td>
					<td class="shot"><%=reservationVo.getResShot()%>차</td>
					<td class="clinicName"><%=reservationVo.getClinicName()%></td>
					<td class="dateDay"><%=reservationVo.getResDateDay()%></td>
					<td class="time"><%=reservationVo.getResTime()%></td>
					<td>
					<input type="hidden" name="resOkNo" value = "<%=reservationVo.getResNo()%>">
          			<input type="hidden" name="vaccineNo" value = "<%=reservationVo.getVaccineNo()%>">
        		    <input type="hidden" name="clinicNo" value = "<%=reservationVo.getClinicNo()%>">
        		    <input type="hidden" name="shotCount" value = "<%=reservationVo.getResShot()%>">
                    <input type="submit" value="접종완료하기" id="complete-link" class="link-btn">
                    </td>
				</tr>
				<%} %>
			</tbody>
		</table>
</form>
	</div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>