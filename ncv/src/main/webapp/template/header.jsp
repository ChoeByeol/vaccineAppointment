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
                <a href="<%=request.getContextPath()%>/index.jsp">
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
        <li><a href="<%=request.getContextPath()%>/notice/list.jsp">공지사항</a></li>
        <%if(admin){ %>
        <li><a href="#">회원관리</a>
        <ul>
        	<li><a href="<%=request.getContextPath()%>/admin/member/list.jsp">회원목록</a></li>
        	<li><a href="<%=request.getContextPath()%>/admin/member/agree_edit.jsp">약관수정</a></li>
        </ul></li>
        <li><a href="#">병원관리</a>
        <ul>
        	<li><a href="<%=request.getContextPath()%>/admin/clinic/list.jsp">병원목록</a></li>
        	<li><a href="<%=request.getContextPath()%>/admin/clinic/insert.jsp">병원등록</a></li>
        </ul></li>
        <li><a href="#">백신관리</a>
        <ul>
          	<li><a href="<%=request.getContextPath()%>/admin/stock/stock_list.jsp">백신재고목록</a></li>
           	<li><a href="<%=request.getContextPath()%>/admin/vaccine/vaccine.jsp">백신목록</a></li>
        </ul></li>
        <li><a href="#">예약관리</a>
        <ul>
          	<li><a href="<%=request.getContextPath()%>/admin/reservation/reservation_list.jsp">예약목록</a></li>
        </ul></li>
        <li><a href="<%=request.getContextPath()%>/admin/qna/list.jsp">1:1문의관리</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/shot/shot_list.jsp">접종자목록</a></li>
        <li class="flex-right"><a href="<%=request.getContextPath()%>/member/logout.txt">로그아웃</a></li>
         <%}else{%>
         <li><a href="<%=request.getContextPath()%>/reservation/check.txt">예약하기</a></li>
         <li><a href="<%=request.getContextPath()%>/qna/mylist.jsp">1:1문의</a></li>
        <li class="flex-right">
            <li><a href="#" >회원메뉴</a>
            <ul>
                <li><a href="<%=request.getContextPath()%>/member/mypage.jsp">마이페이지</a></li>
                <li><a href="<%=request.getContextPath()%>/reservation/reservation_myRes.jsp">나의예약조회</a></li>
                <li><a href="<%=request.getContextPath()%>/member/shot_myShot.jsp">접종내역조회</a></li>
                <li class="flex-right"><a href="<%=request.getContextPath()%>/member/logout.txt">로그아웃</a></li>
            </ul></li>
                <%} %>
        <%}else{%>
            <li><a href="<%=request.getContextPath()%>/index.jsp">홈으로</a></li>
            <li><a href="<%=request.getContextPath()%>/notice/list.jsp">공지사항</a></li>
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