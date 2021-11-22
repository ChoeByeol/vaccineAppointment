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

    .logo-wrapper {
    width: 120px;
    height: 40px;
    margin:0px 5px 0px 0px;
    }

    .logo-wrapper>a>img {
        width: 100%;
        height: 100%;
    }
    
    .title-wrapper {
	flex-grow: 1;
	display: block;
	margin: auto;
	padding-left: 15px;
	}
	
    .title-wrapper > p{
    	color: rgb(80,80,80);
    	font-family:'Apple';
    }
    
    .nuri-wrapper{
    	width:120px;
    	height:43px;
    }
    
    .nuri-wrapper>img{
    	width:100%;
    	height:100%;
    }
    
    .footer-title{
    	flex-grow: 1;
        display: block;
        padding-left: 15px;
        color: #57585a;
    }

    .footer-logo-wrapper{
    	width:160px;
    	height:48px;
    }
    
    .footer-logo-wrapper>img{
    	width:100%;
    	height:100%;
    }
    </style>
</head>
<body>
    <main>
        <header>
			<div class="flex-container">
				<div class="logo-wrapper">
				<a href="http://localhost:8080/ncv/index.jsp">
					<img src="<%=request.getContextPath()%>/resource/image/logo.png">
				</a>
				</div>
				<div class="title-wrapper">
					<p>코로나바이러스감염증-19</p>
					<p>예방접종 사전예약 시스템</p>
				</div>	
			</div>
		</header>
			<!-- 메뉴 영역 -->
			
  <nav>
    <ul class="slide-menu">
    	<%if(login){ %>
    	<li><a href="<%=request.getContextPath()%>/index.jsp">MAIN</a></li>
        <li><a href="#">공지사항</a></li>
        <li><a href="<%=request.getContextPath()%>/reservation/reservation_list.jsp">임시접종완료</a></li>
    	<%if(admin){ %>
        <%} else { %>
        <li><a href="<%=request.getContextPath()%>/reservation/check.txt">예약하기</a></li>
        <%} %>        
        <li class="flex-right">
        	<a href="#" >회원메뉴</a>
            <ul>
            	<%if(admin){ %>
            	<li><a href="<%=request.getContextPath()%>/admin/home.jsp">관리메뉴</a></li>
            	<%} else { %>
                <li><a href="<%=request.getContextPath()%>/member/mypage.jsp">내정보보기</a></li>
                <li><a href="<%=request.getContextPath()%>/reservation/reservation_myRes.jsp">나의예약조회</a></li>
                <li><a href="<%=request.getContextPath()%>/shot/shot_myShot.jsp">접종내역조회</a></li>
                <%} %>
                <li><a href="<%=request.getContextPath()%>/member/logout.txt">로그아웃</a></li>
  			</ul>
		</li>
		<%}else{%>
			<li><a href="<%=request.getContextPath()%>/index.jsp">홈으로</a></li>
			<li><a href="#">공지사항</a></li>
			<li class="flex-right">
				<a href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
				<ul>
					<li><a href="<%=request.getContextPath()%>/member/agree.jsp">회원가입</a></li>
				</ul>
			</li>
			<%} %>
		</ul>
   </nav>
<section>
		
		   

