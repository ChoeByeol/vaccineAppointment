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
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/layout.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/test.css"> --%>
<style>
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
	<!-- 홈페이지 전체 폭을 설정하는 테두리 영역 -->
	<main>

		<!-- 헤더 영역 -->
		<header>
			<div class="flex-container">
				<div class="logo-wrapper">
					<img src="<%=request.getContextPath()%>/resource/image/질병관리청.png">
				</div>
				<div class="title-wrapper">
					<h4>예방접종 사전예약 시스템</h4>
				</div>	
			</div>
		</header>
		
			<!-- 메뉴 영역 -->
				<nav>
			<ul class="slide-menu">
				<%
 				if (login) {
				%>
				<li><a href="<%=request.getContextPath()%>/index.jsp">홈으로</a></li>
				<li><a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">공지사항</a></li>
				<li class="flex-right"><a href="#">회원메뉴</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/member/mypage.jsp">내정보보기</a></li>
						<li><a href="<%=request.getContextPath()%>/reservation/reservation.jsp">예약하기</a></li>
						<li><a href="#">예약조회</a></li>
						<li><a href="#">접종내역보기</a></li>
						<li><a href="<%=request.getContextPath()%>/member/logout.txt">로그아웃</a></li>
					</ul></li>
				<%
 				} else {
 				%>
				<li><a href="<%=request.getContextPath()%>/index.jsp">홈으로</a></li>
				<li><a href="<%=request.getContextPath()%>/vaccine/vaccine.jsp">공지사항</a></li>
				<li><a href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a></li>
				<%
				}
				%>

				<%
				if (admin) {
				%>
				<li class="flex-right"><a href="<%=request.getContextPath()%>/admin/home.jsp">관리메뉴</a></li>
				<%
				}
				%>
			</ul>
		</nav>

		<section>