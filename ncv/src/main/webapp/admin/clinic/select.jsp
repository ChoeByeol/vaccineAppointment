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
<jsp:include page="/template/header.jsp"></jsp:include>
<style>

 .link-btn{
	font-family:NotoSans;
	font-size: 20px;
}

.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;width: 200px; border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
</style>
<%--출력--%>
<table class="sub_news" border="1" width="300">
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
            <td><pre><%=clinicDto.getClinicTime()%></pre></td>
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51857ee590e6cc2b1c3f4879f1fdf7b2&libraries=services,clusterer,drawing"></script>

</head>
<body>

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
<div class="container-400 container-center">
	<div class="link-btn center">
		<a href="reservation_list.jsp?clinicNo=<%=clinicDto.getClinicNo()%>"class="link-btn">백신 예약 내역 보기</a>
	</div>
	<div class="link-btn center">
		<a href="shot_list.jsp?cliniNo=<%=clinicDto.getClinicNo()%>"class="link-btn">백신 접종 내역 보기</a>
	</div>
	<div class="link-btn center">
		<a href="edit.jsp?clinicNo=<%=clinicDto.getClinicNo()%>"class="link-btn">병원 정보 수정</a>
	</div>
	<div class="link-btn center">
		<a href="delete.txt?clinicNo=<%=clinicDto.getClinicNo()%>"class="link-btn">병원 정보 삭제</a>
	</div>
	<div class="link-btn center">
		<a href="list.jsp"class="link-btn">목록으로</a>
	</div>
</div>
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>
</html>
