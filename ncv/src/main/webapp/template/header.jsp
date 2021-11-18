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

    .logo-wrapper>img {
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
					<img src="<%=request.getContextPath()%>/resource/image/logo.png">
				</div>
				<div class="title-wrapper">
					<p>코로나바이러스감염증-19 | 인플루엔자(INFLU)</p>
					<p>예방접종 사전예약 시스템</p>
				</div>	
			</div>
		</header>
