<%@page import="ncv.beans.NoticePagination"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
NoticePagination pagination = new NoticePagination(request);
pagination.calculate();
%>


<script>
	var index = 0; //이미지에 접근하는 인덱스
	window.onload = function() {
		slideShow();
	}
	function slideShow() {
		var i;
		var x = document.getElementsByClassName("slideImg"); //slide1에 대한 dom 참조
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none"; //처음에 전부 display를 none으로 한다.
		}
		index++;
		if (index > x.length) {
			index = 1; //인덱스가 초과되면 1로 변경
		}
		x[index - 1].style.display = "block"; //해당 인덱스는 block으로
		setTimeout(slideShow, 4000); //함수를 4초마다 호출
	}
</script>

<style>
.mainContainer {
	width: 100%;
	height: 400px;
	position: relative;
	margin: 0 auto;
}
.main-area {
    position: relative;
    background:no-repeat 50% 50%;
    background-size: cover;
    padding-top: 10px;

}
    
.mid-area {
    position: relative;
    background:no-repeat 50% 50%;
    background-size: cover;
    padding-bottom: 10px;
}   
.bottom-area {
    position: relative;
    background:no-repeat 50% 50%;
    background-size: cover;
} 
    
.mainSlide {
	max-height: 250px;
	width: 100%;
	text-align: center;
}
.slide {
	display: table;
	position: absolute;
	width: 100%;
	font-size: 0;
}
.slideImg {
	width: 100%;
	height: 250px;
}
.title {
    padding-bottom: 30px;
    text-align: center;
    font-size: 30px;
    color: #727272;
    font-weight: 600;
    line-height: 1.4em;
}

.aBtn1 {
	width: 25%;
	height: 40px;
	background-color: #2C7EA8;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
.aBtn2 {
	width: 25%;
	height: 40px;
	background-color: #1D5C94;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
.aBtn3 {
	width: 25%;
	height: 40px;
	background-color: #113D80;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
.aBtn4 {
	width: 25%;
	height: 40px;
	background-color: #08226C;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}
 
 .aSpan { 
	width: 25%; 
	font-size: 15px; 
	height: 40px; 
 	vertical-align: middle; 
 	text-align: center; 
 } 
.fix-layout {
    position: relative;
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 15px;
    box-sizing: border-box;
}
/* 공지사항 */
.sub_news, .sub_news th, .sub_news td {
	border: 0
}

.sub_news a {
	color: #383838;
	text-decoration: none
}

.sub_news {
	width: 40%;
	float:right;
	border-bottom: 1px solid #999;
	color: #666;
	font-size: 14px;
	table-layout: fixed
}

.sub_news caption {
	display: none
}

.sub_news th {
	padding: 5px 0 6px;
	border-bottom: solid 1px #b2b2b2;
	background-color: #BBDEFB;
	color: #333;
	font-size: 28px;
	font-weight: bold;
	vertical-align: top;
	cursor: pointer;
}

.sub_news td {
	padding: 8px 0 9px;
	border-bottom: solid 1px #d2d2d2;
	text-align: center;
	line-height: 18px;
}

.sub_news .title {
	text-align: center;
	padding-left: 15px;
	font-size: 13px;
}

.sub_news .title .pic, .sub_news .title .new {
	margin: 0 0 2px;
	vertical-align: middle
}

.sub_news .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold
}

.border-spacing{
border-spacing:0px;
}

</style>


<jsp:include page="/template/header.jsp"></jsp:include>

<div class="mainContainer">

	<div class="main-area">
	<div class="mainSlide">
<!-- 		<a href="#"> -->
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/0002.jpg">
<!-- 		</a> -->
<!-- 		<a href="#"> -->
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/IU02.png">
<!-- 		</a> -->
<!-- 		<a href="#"> -->
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/6.jpg">
<!-- 		</a> -->
<!-- 		<a href="#"> -->
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/iui.jpg">
<!-- 		</a> -->
	</div>
</div>


	<div class="title">
		<div class="slide">
		<div class="flex_container"></div>		
			<a href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=1" class="aBtn1">
			<span class="aSpan">화이자</span>
			</a>
			<a href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=2"  class="aBtn2">
			<span class="aSpan">모더나</span>
			</a>
			<a href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=3"  class="aBtn3">
			<span class="aSpan">아스트라제네카</span>
			</a>
			<a href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=4"  class="aBtn4">
			<span class="aSpan">얀센</span>
			</a>
			
		</div>
	</div>	
</div>
<style>

</style>

<div class="right">
	<table class="sub_news border-spacing" border="1"  summary="게시판의 글제목 리스트">		
		
		<thead>
			<tr>
				<th><a href="<%=request.getContextPath()%>/notice/list.jsp">공지사항</a></th>
			</tr>
		</thead>
		<tbody align="center">

			<%
			for (NoticeDto noticeDto : pagination.getList()) {
			%>
			<tr>
				<td class="title">
				<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>"> <%=noticeDto.getNoticeTitle()%></a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<br>
</div>