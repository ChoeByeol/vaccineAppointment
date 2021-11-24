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
	});
</script>
<%--출력--%>
<table border="1" width="300">
    <tbody>
        <tr>
            <th>병원 이름</th>
            <td><%=clinicDto.getClinicName()%></td>
        </tr>
        <tr>
            <th>병원 연락처</th>
            <td><%=clinicDto.getClinicTel()%></td>
        </tr>
        <tr>
            <th>병원 진료시간</th>
            <td><%=clinicDto.getClinicTime()%></td>
        </tr>
        <tr>
            <th>병원 우편번호</th>
            <td><%=clinicDto.getClinicPostcode()%></td>
        </tr>
        <tr>
            <th>병원 주소</th>
            <td><%=clinicDto.getClinicAddress()%></td>
        </tr>
        <tr>
            <th>병원 상세주소</th>
            <td><%=clinicDto.getClinicDetailAddress()%></td>
        </tr>
    </tbody>
</table>
<div id="map" style="width:100%;height:350px;"></div>

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

<a href="javascript:history.back()">목록으로</a>
<form>
	<button id="btn">선택하기</button>
	<input type="hidden" id="cClinicNo" value="<%=clinicDto.getClinicNo() %>">
	<input type="hidden" id="cClinicName" value="<%=clinicDto.getClinicName()%>">
</form>