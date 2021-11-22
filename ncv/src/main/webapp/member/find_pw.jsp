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
            $(".find-id-btn").css("border","none").css("background-color","#EEEEEE");
            $(".find-pw-btn").css("border-bottom","none");
            
            $("label").css("font-size","1.5rem");
            $(".msg").css("font-size","1.5rem");
            $(".notice").css("color","red");
            
			$("#id").blur(function(){
				idCheck();
			});
			function idCheck(){
				var input = $("#id").val();
				var notice = $("#id").next();
				if( input.length > 0){
					notice.text("");
					return true;
				}
				else{
					notice.text("아이디를 입력해 주세요.");
					return false;
				}
			}
            
			$("#name").blur(function(){
				nameCheck();
				console.log(nameCheck());
			});
			function nameCheck(){
				var input = $("#name").val();
				var notice = $("#name").next();
				if( input.length > 0){
					notice.text("");
					return true;
				}
				else{
					notice.text("이름을 입력해 주세요.");
					return false;
				}
			}
			
			$("#rrn").on("input",function(){
				rrnCheck();
			});
			function rrnCheck(){
				var input = $("#rrn").val();
				var notice = $("#rrn").next();
				if( input.length > 0){
					notice.text("");
					return true;
				}
				else{
					notice.text("주민번호를 입력해 주세요.");
					return false;
				}
			} 
			
			$("form").submit(function(){
				return idCheck() && nameCheck() && rrnCheck();
			})
        });
    </script>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="<%=request.getContextPath()%>/member/find_pw.txt" method="post">
 	<div class="container-400 container-center">
 	
		<div class="row center">
			<a href="find_id.jsp" class="find-btn find-id-btn">아이디 찾기</a><a href="find_pw.jsp" class="find-btn find-pw-btn">비밀번호 찾기</a>
		</div>
		 <div class="row">
		 	<label for="id">아이디</label>
			<input type="text" name="memberId" class="form-input" id="id">
			<div class="notice"></div>
		</div>
		 <div class="row">
			<label for="name">이름</label>
			<input type="text" name="memberName" class="form-input" id="name">
			<div class="notice"></div>
		</div>
		<div class="row">
			<label for="rrn">주민번호</label>
			<input type="text" name="memberRrn" class="form-input" id="rrn" placeholder="-제외" maxlength="13">
			<div class="notice"></div>
		</div>
		 <div class="row right">
			<input type="submit" value="임시비밀번호 발급" required class="form-btn">
		</div>
	</div>
</form>
		
	<div class="container-900 container-center">
		<%if(request.getParameter("error") != null){ %>
		<div class="row center msg error">
			존재하지 않는 회원입니다.
		</div>
		<%}else if(request.getParameter("tmpPw") != null){%>
		<div class="row center msg">
			회원님의 임시비밀번호는 <strong><%=request.getParameter("tmpPw")%></strong>입니다. 비밀번호를 변경해주세요.
   		</div>
   		<div class="row center msg"><a href="login.jsp">로그인하러 가기</a></div>
   		<%}%>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>  