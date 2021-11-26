<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--입력--%>
<% int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));%>

<%--처리--%>
<%
    ClinicDao clinicDao = new ClinicDao();
    ClinicDto clinicDto = clinicDao.select(clinicNo); //상세조회
%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/commons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/layout.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51857ee590e6cc2b1c3f4879f1fdf7b2&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var answer = document.getElementById("cClinicNo").value;
			window.opener.document.getElementById("pClinicNo").value = answer;
			
			var answer2 = document.getElementById("cClinicName").value;
			window.opener.document.getElementById("pClinicName").value = answer2;

			window.close();
		});
		$(".list-btn").click(function(){
			window.history.back();
		});
	});
</script>
<style>
.container-700{
	margin-top:3%;
	padding-left:10px;
	padding-right:10px;
}
.title-table{
	vertical-align : middle;
}
.table{
	font-family:NotoSansL;
	margin-bottom:8%;
}
.semi-title{
	font-family:Apple;
	font-size:24px;
}
#map{
	margin-top:2%;
	border-radius: 2px
}
.link-btn{
	margin-bottom:2%;
}
</style>
<%--출력--%>
	<div class="container-700 center">
		<label class="semi-title">의료기관 위치</label>
		<div id="map" style="width:100%;height:350px;"></div>
	<table class="table table-stripe">
		<tbody>
			<tr class="table-line">
				<th width="30%">의료기관 이름</th>
				<td><%=clinicDto.getClinicName()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">연락처</th>
 				<td><%=clinicDto.getClinicTel()%></td>
			</tr>
			<tr class="table-line">
				<th class="title-table" width="30%">진료시간</th>
				<td><pre><%=clinicDto.getClinicTime()%></pre></td>
			</tr>		
			<tr class="table-line">
				<th width="30%">주소</th>
				<td><%=clinicDto.getClinicAddress()%></td>
			</tr>
			<tr class="table-line">
				<th width="30%">상세주소</th>
				<td><%=clinicDto.getClinicDetailAddress()%></td>
			</tr>			
		</tbody>
	</table>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch("<%=clinicDto.getClinicAddress()%>", function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=clinicDto.getClinicName()%></div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	<button class="link-btn list-btn">목록으로</button>
	<button class="link-btn" id="btn">선택하기</button>
<form>
	<input type="hidden" id="cClinicNo" value="<%=clinicDto.getClinicNo() %>">
	<input type="hidden" id="cClinicName" value="<%=clinicDto.getClinicName()%>">
</form>
</div>