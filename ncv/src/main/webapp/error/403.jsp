<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <style>
	 .warning{
	 	width:80%;
	 	height:400;
	 }
	  
     .button_base {
    position:absolute;
    bottom:10%;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 100px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
    text-decoration-line : none
}
.btn {
    color: #000000;
    background-color:#dee2e6;
 	padding:7px; 
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
</style> 

    <jsp:include page="/template/header.jsp"></jsp:include>
            <div class="container-1000 container-center">
                <div class="row">
                    <img src="<%=request.getContextPath()%>/resource/image/adminWarning.png" class="warning">
                </div>
               	<div class="row center"> 
               		<a href="#"class="btn button_base">1:1게시판</a>
               		<a href="<%=request.getContextPath()%>/member/login.jsp"class="btn button_base">로그인</a>
               		<a href="<%=request.getContextPath()%>/index.jsp"class="btn button_base">홈으로</a>
 				</div>
                </div>
            </div> 
        
            
    <jsp:include page="/template/footer.jsp"></jsp:include></html>