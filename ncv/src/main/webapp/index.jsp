<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
	height: 800px;
	position: relative;
	margin: 0 auto;
}

.mainSlide {
	max-height: 438px;
	width: 100%;
	text-align: center;
}

.slide {;
	display: table;
	position: absolute;
	width: 100%;
	font-size: 0;
}

.slideImg {
	width: 100%;
	height: 300px;
}

.aBtn1 {
	width: 25%;
	height: 40px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.aBtn2 {
	width: 25%;
	height: 40px;
	background-color: #21a089;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.aBtn3 {
	width: 25%;
	height: 40px;
	background-color: #3b92cd;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.aBtn4 {
	width: 25%;
	height: 40px;
	background-color: #765dc2;
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
	display: table-cell;
	text-align: center;
}
</style>


<jsp:include page="/template/header.jsp"></jsp:include>

<div class="mainContainer">


	<div class="mainSlide">
		<a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/co.jpg">
		</a>
		<a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/co1.jpg">
		</a>
		<a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/co2.jpg">
		</a>
		<a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">
		<img class="slideImg" src="<%=request.getContextPath()%>/resource/image/co3.jpg">
		</a>
	</div>

	<div class="slide">
		<a href="#" class="aBtn1">
		<span class="aSpan">코로나바이러스감염증-19</span>
		</a>
		<a href="#" class="aBtn2">
		<span class="aSpan">코로나19 예방접종</span>
		</a>
		<a href="#" class="aBtn3">
		<span class="aSpan">코로나19 예방접종사전예약</span>
		</a>
		<a href="#" class="aBtn4">
		<span class="aSpan">항생제내성인식주간</span>
		</a>
	</div>

</div>



<jsp:include page="/template/footer.jsp"></jsp:include>


