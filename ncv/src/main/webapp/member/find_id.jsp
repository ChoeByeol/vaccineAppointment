<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
        $(function(){
            $(".find-btn").css("text-decoration", "none")
            .css("color","black")
            .css("padding","0.75rem")
            .css("display","inline-block")
            .css("width","50%")
            .css("border", "1px solid black");

            $(".find-id-btn").css("border-bottom","none");

            $(".find-pw-btn").css("border","none").css("background-color","silver");
        });
    </script>
<jsp:include page="/template/header.jsp"></jsp:include>
    
<form action="<%=request.getContextPath()%>/member/find_id.txt" method="post">
	<div class="container-400 container-center">
		
		<div class="row center">
			<a href="find_id.jsp" class="find-btn find-id-btn">아이디 찾기</a><a href="find_pw.jsp" class="find-btn find-pw-btn">비밀번호 찾기</a>
		</div>
		 <div class="row">
			<h1>이름</h1>
			<input type="text" name="memberName" class="form-input">
		</div>
		<div class="row">
			<h1>주민번호</h1>
			<input type="text" name="memberRrn" class="form-input" placeholder="-제외" maxlength="13">
		</div>
		 <div class="row right">
			<input type="submit" value="찾기" required class="form-btn form-incline">
		</div>
		
	   <!-- error에 대한 처리 -->
		<div class="row center">
			<%if(request.getParameter("error") != null){ %>
				<h2 class="error">존재하지 않는 회원입니다.</h2>
			<%}else if(request.getParameter("memberId") != null){%>
				<h2>회원님의 아이디는 <%=request.getParameter("memberId")%>입니다.</h2>
   			<%}%>
   		</div>
	</div>
</form>
   
   
   
<jsp:include page="/template/footer.jsp"></jsp:include>
   