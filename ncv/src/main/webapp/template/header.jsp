<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String ses = (String) session.getAttribute("ses");
boolean login = ses != null;

String grade = (String) session.getAttribute("grade");
boolean admin = grade != null && grade.equals("관리자");
%>
<%
String root = request.getContextPath();
%>  
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코로나19 예방접종 사전예약 시스템</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/commons.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/layout.css">
    <style>
    header {
    position: relative;
    width: 100%;
    max-width: 1200px;
    height: 80px;
    margin: 0 auto;
    }
    div {
    display: inline-block;
    }
    .logo-wrapper {
    width: 120px;
    height: 40px;
    }

    .logo-wrapper>img {
        width: 100%;
        height: 100%;
    }

    .title-wrapper {
        flex-grow: 1;
        display: block;
        margin: auto;
        padding-left: 15px;
        color: #57585a;
    }
    </style>
</head>
<body>
    <main>
        
        <header>
			<div class="flex-container">
				<div class="logo-wrapper">
					<img src="<%=request.getContextPath()%>/resource/image/logo.png">
				</div>
				<div class="title-wrapper">
					<p>코로나바이러스감염증-19|인플루엔자(INFLU)</p>
					<p>예방접종 사전예약 시스템</p>
				</div>	
			</div>
		</header>   
			<!-- 메뉴 영역 -->
		<nav>
	<ul class="slide-menu">
		<li><a href="#">MAIN</a></li>
		<li><a href="#"></a></li>
		<li class="flex-right"><a href="#">회원메뉴</a>
			<ul>
				<li><a href="#">내정보보기</a></li>
				<li><a href="#">예약하기</a></li>
				<li><a href="#">예약조회</a></li>
				<li><a href="#">접종내역보기</a></li>
				<li><a href="#">로그아웃</a></li>
				<li><a href="#">회원가입</a></li>
				
			</ul></li>
			<li class="flex-right"><a href="#">관리메뉴</a></li>
		</ul>
	</nav>
</main>