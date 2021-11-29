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
	width: 850px;
	height: 550px;
	position: relative;
	margin: 0 auto;
}

.main-area {
	position: relative;
	background: no-repeat 50% 50%;
	background-size: cover;
	padding-top: 10px;
	padding-bottom: 50px;
}

.mid-area {
	position: relative;
	background: no-repeat 50% 50%;
	background-size: cover;
	padding-bottom: 10px;
}

.bottom-area {
	position: relative;
	background: no-repeat 50% 50%;
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

.box-select {
	display: block;
	position: relative;
	margin: 0 -10px;
}

.item {
	display: inline-block;
	position: relative;
	padding: 10px;
	width: 207px;
	height: 250px;
	box-sizing: border-box;
	border: 1px solid black;
}

.item-bottom1 {
	display: inline-block;
	position: relative;
	padding: 20px;
	width: 23%;
	height: 200px;
	box-sizing: border-box;
	border: 1px solid black;
}

.item-bottom2 {
	display: inline-block;
	position: relative;
	padding: 20px;
	width: 74%;
	height: 200px;
	box-sizing: border-box;
	border: 1px solid black;
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
	float: right;
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
	font-size: 15px;
	font-weight: bold
}

.border-spacing {
	border-spacing: 0px;
}

.bottom-area > .title > .box-select > .item-bottom2 > span {
font-size : 15px;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

li {
    text-align: -webkit-match-parent;
}


a#img-rev {
	display:inline-block;
	width: 207px;
	height: 250px;
  background:url('/ncv/resource/image/img-rev-before.png') no-repeat;
}

a#img-rev:hover{
  background:url('/ncv/resource/image/img-rev-after.png') no-repeat;
}


a#img-revCheck {
	display:inline-block;
	width: 207px;
	height: 250px;
  background:url('/ncv/resource/image/img-revCheck-before.png') no-repeat;
}

a#img-revCheck:hover{
  background:url('/ncv/resource/image/img-revCheck-after.png') no-repeat;
}


a#img-shotCheck {
	display:inline-block;
	width: 207px;
	height: 250px;
  background:url('/ncv/resource/image/img-shotCheck-before.png') no-repeat;
}

a#img-shotCheck:hover{
  background:url('/ncv/resource/image/img-shotCheck-after.png') no-repeat;
}


a#img-qna {
	display:inline-block;
	width: 207px;
	height: 250px;
  background:url('/ncv/resource/image/img-qna-before.png') no-repeat;
}

a#img-qna:hover{
  background:url('/ncv/resource/image/img-qna-after.png') no-repeat;
}


 a:link {
 text-decoration: none;
 }
 a:visited {
 text-decoration: none;
 }
 a:hover {
 text-decoration:  none;
 }



출처: https://it77.tistory.com/126 [시원한물냉의 사람사는 이야기]

</style>




<jsp:include page="/template/header.jsp"></jsp:include>


<div class="mainContainer">

	<div class="main-area">
		<div class="mainSlide">
			<!-- 		<a href="#"> -->
			<img class="slideImg"
				src="<%=request.getContextPath()%>/resource/image/kid.png">
			<!-- 		</a> -->
			<!-- 		<a href="#"> -->
			<img class="slideImg"
				src="<%=request.getContextPath()%>/resource/image/boostershot.png">
			<!-- 		</a> -->
			<!-- 		<a href="#"> -->
			<img class="slideImg"
				src="<%=request.getContextPath()%>/resource/image/백신.png">
			<!-- 		</a> -->
			<!-- 		<a href="#"> -->
			<img class="slideImg"
				src="<%=request.getContextPath()%>/resource/image/대상별부스터.png">
			<!-- 		</a> -->
		</div>


		<div class="title">
			<div class="slide">
				<a
					href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=1"
					class="aBtn1"> <span class="aSpan">화이자</span>
				</a> <a
					href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=2"
					class="aBtn2"> <span class="aSpan">모더나</span>
				</a> <a
					href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=3"
					class="aBtn3"> <span class="aSpan">아스트라제네카</span>
				</a> <a
					href="<%=request.getContextPath()%>/vaccine/vaccine_detail.jsp?vaccineNo=4"
					class="aBtn4"> <span class="aSpan">얀센</span>
				</a>

			</div>
		</div>
	</div>


	<div class="mid-area">
		<div class="title">
			<div class="box-select">

				<a href="<%=request.getContextPath()%>/reservation/check.txt">
				<img src="/ncv/resource/image/img-rev-before.png" onmouseover="this.src='/ncv/resource/image/img-rev-after.png';" 
				onmouseout="this.src='/ncv/resource/image/img-rev-before.png';" alt="">
				</a>

				<a href="<%=request.getContextPath()%>/reservation/reservation_myRes.jsp">
				<img src="/ncv/resource/image/img-revCheck-before.png" onmouseover="this.src='/ncv/resource/image/img-revCheck-after.png';" 
				onmouseout="this.src='/ncv/resource/image/img-revCheck-before.png';" alt="">
				</a>

				<a href="<%=request.getContextPath()%>/shot/shot_myShot.jsp">
				<img src="/ncv/resource/image/img-shotCheck-before.png" onmouseover="this.src='/ncv/resource/image/img-shotCheck-after.png';" 
				onmouseout="this.src='/ncv/resource/image/img-shotCheck-before.png';" alt="">
				</a>
				
				<a href="<%=request.getContextPath()%>/qna/list.jsp">
				<img src="/ncv/resource/image/img-qna-before.png" onmouseover="this.src='/ncv/resource/image/img-qna-after.png';" 
				onmouseout="this.src='/ncv/resource/image/img-qna-before.png';" alt="">
				</a>

			</div>

		</div>


	</div>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>