<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <jsp:include page="/template/header.jsp"></jsp:include>
 <style>
 img{
 	width:10%;
 	height:10%;
 	display: block;
 	margin: 0 auto;
 }
 .title{
 	margin-top:10px;
 	margin-bottom:70px;
 }
 .button_base {
	position:absolute;
	bottom:10%;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
    color: #000000;
    background-color:#dee2e6;
    border: rgb(53, 66, 68) solid 1px;
    padding:15px;
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn:hover {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}

@-webkit-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}

@-moz-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}
div > a{
	text-decoration: none;
}
 </style>
 <img src="<%=request.getContextPath()%>/resource/image/check.png">
 
 <div class="title center">
 	<h2>비밀번호 변경 완료</h2>
 </div>
 <div class="center">
 	<a class="btn button_base" href="<%=request.getContextPath()%>/index.jsp">메인 페이지</a>
 	<a class="btn button_base" href="<%=request.getContextPath()%>/member/mypage.jsp">마이 페이지</a>
 </div>
<jsp:include page="/template/footer.jsp"></jsp:include>