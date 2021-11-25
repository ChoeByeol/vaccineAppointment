
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


.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .no,.sub_news .memberid,.sub_news .name,.sub_news .rrn,.sub_news .phmoe,.sub_news .vacineName,.sub_news .shot,.sub_news .clinicname,.sub_news .nodateday,.sub_news .time,.sub_news .detailno{padding:0;font-family:Tahoma;font-size:14px;line-height:normal}

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

<<<<<<< HEAD
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
=======
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
	<hr>
	</div>

	<!-- 데이터 표시 영역 -->
	<div class="row center">

				<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">			
				<caption>나의 예약 리스트</caption>
				
				<thead>
				<tr>
					<th scope="col" style="width: 60px;">예약번호</th>
					<th scope="col" style="width: 90px;">아이디</th>
					<th scope="col" style="width: 70px;">이름</th>
					<th scope="col" style="width: 120px;">주민등록번호</th>
					<th scope="col" style="width: 90px;">전화번호</th>
					<th scope="col" style="width: 120px;">백신명</th>
					<th scope="col" style="width: 55px;">접종차수</th>
					<th scope="col" style="width: 65px;">예약병원</th>
					<th scope="col"style="width: 70px;">예약일</th>
					<th scope="col"style="width: 55px;">예약시간</th>
					<th scope="col" style="width: 90px;">접종상태</th>
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