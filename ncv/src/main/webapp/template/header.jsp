<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="flex-container">
            <header>
                <div class="logo-wrapper">
                    <img src="<%=request.getContextPath()%>/resource/image/logo.png">
                </div>
                <div class="title-wrpper">
                    <p>코로나바이러스감염증-19|인플루엔자(INFLU)</p>
                    <p>예방접종 사전예약 시스템</p>
                </div>
            </header>
        </div>
    </main>