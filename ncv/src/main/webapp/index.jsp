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
	height: 1050px;
	position: relative;
	margin: 0 auto;
}

.main-area {
    position: relative;
    background:no-repeat 50% 50%;
    background-size: cover;
    padding-top: 10px;
    padding-bottom: 50px;
    z-index: 2;
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
	width: 283px;
	height: 40px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.aBtn2 {
	width: 283px;
	height: 40px;
	background-color: #21a089;
	border: none;
	color: #fff;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
}

.aBtn3 {
	width: 283px;
	height: 40px;
	background-color: #3b92cd;
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
  	margin-bottom: 20px;
}

.item-bottom2 {
    display: inline-block;
    position: relative;
    padding: 20px;
    width: 74%;
    height: 200px;
    box-sizing: border-box;
  	border: 1px solid black;
  	margin-bottom: 20px;
}
</style>


<jsp:include page="/template/header.jsp"></jsp:include>

<div class="mainContainer">

	<div class="main-area">
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
	</div>

	<div class="title">
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
		</div>
	</div>
</div>

	<div class="mid-area">
	<div class="title">
		<div class="box-select">
			<div class="item">
				<span>예약정보</span>
			</div>
			<div class="item">
				<span>나의접종내역</span>
			</div>
			<div class="item">
				<span>1:1문의</span>
			</div>
			<div class="item">
				<span>마이페이지</span>
			</div>

		</div>

	</div>
	</div>
	

	<div class="bottom-area">
	<div class="title">
		<div class="box-select">
			<div class="item-bottom1">
				공지사항
			</div>
			<div class="item-bottom2">
				----------
			</div>
			<div class="item-bottom1">
				백신정보
			</div>
			<div class="item-bottom2">
					-----------
			</div>

		</div>

	</div>
	</div>
	
	
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>
 

