<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
    	<style>
        .notice {
            color:red;
        }
    	</style>
	    <title>약관동의</title>
	    <script>
	    
		    function doDisplay(){
		    	var con = document.getElementById("cate1");
		    	
		    	if(con.style.display=='none'){
		    		con.style.display = 'block';
		    	}else{
		    		con.style.display = 'none';
		    	}
	        }
		    
		    function doDisplay2(){
		    	var con = document.getElementById("cate2");
		    	
		    	if(con.style.display=='none'){
		    		con.style.display = 'block';
		    	}else{
		    		con.style.display = 'none';
		    	}
		    }
		    
		    function doDisplay3(){
		    	var con = document.getElementById("cate3");
		    	
		    	if(con.style.display=='none'){
		    		con.style.display = 'block';
		    	}else{
		    		con.style.display = 'none';
		    	}
		    }
		    
		    function doDisplay4(){
		    	var con = document.getElementById("cate4");
		    	
		    	if(con.style.display=='none'){
		    		con.style.display = 'block';
		    	}else{
		    		con.style.display = 'none';
		    	}
		    }
		    
	        function allAgree(){
	            var checkbox = document.querySelector(".check-all");
	            var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
	            var notice = checkbox.nextElementSibling;
	            
	            if(checkbox.checked == true){
	                for(var i=0; i < checkboxList.length; i++){
	                    checkboxList[i].checked = true;
	                }
	                notice.textContent = "";
	                return true;
	            }
	            else{
	                for(var i=0; i < checkboxList.length; i++){
	                    checkboxList[i].checked = false;
	                }
	                notice.textContent = "미동의시 회원가입이 불가합니다";
	                return false;
	            }
	        }
	        function check(){
	            var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
	            var checkboxList2 = document.querySelectorAll("input[type=checkbox]:not(.check-all):checked");
	            
	            var checkbox = document.querySelector(".check-all");
	            checkbox.checked = (checkboxList.length == checkboxList2.length);
	        }
		    
	        function formCheck(){
	        	return doDisplay() && doDisplay2() && doDisplay3() && doDisplay4() && allAgree();
	        }
	    
		</script>
	</head>
	
	<body>
	
		 <form action="<%=request.getContextPath()%>/member/join.jsp" name="form" method="post" onsubmit="return formCheck();">
			<div class="container-400 container-center">	
			
				<div class="row float-container">
					<a href="javascript:doDisplay();"> ▶회원정보 수집 항목</a><br/><br/>
					<div id="cate1" style="display:none">
					<textarea name="textarea" cols="69" rows="5" readonly>회원정보 수집 항목 어쩌구</textarea>	
					<br>
					</div>
					<input type="checkbox" oninput="check();" class="ck1" required>
					위의 가입 약관에 동의합니다
				</div>
				
				<div class="row">
					<a href="javascript:doDisplay2();"> ▶개인정보 수집 목적</a><br/><br/>
					<div id="cate2" style="display:none">
					<textarea name="textarea" cols="69" rows="5" readonly>개인정보 수집 목적 어쩌구</textarea>	
					<br>
					</div>
					<input type="checkbox" oninput="check();" class="ck2"required>
					위의 가입 약관에 동의합니다
				</div>
				
				<div class="row">
					<a href="javascript:doDisplay3();"> ▶개인정보 보유 및 이용 기간</a><br/><br/>
					<div id="cate3" style="display:none">
					<textarea name="textarea" cols="69" rows="5" readonly>개인정보 보유 및 이용 기간 어쩌구</textarea>	
					<br>
					</div>
					<input type="checkbox" oninput="check();" class="ck3"required>
					위의 가입 약관에 동의합니다  
				</div>
				
				<div class="row">
					<a href="javascript:doDisplay4();"> ▶개인정보 제3자 제공동의</a><br/><br/>
					<div id="cate4" style="display:none">
						<textarea name="textarea" cols="69" rows="5" readonly>개인정보 제3자 제공동의 어쩌구</textarea>	
						<br>
					</div>  
						<input type="checkbox" oninput="check();" class="ck4"required>
						위의 가입 약관에 동의합니다  
				</div>
				
				<input type="checkbox" oninput="allAgree();" class="check-all" required>
					위의 가입 약관에  전체동의합니다
				<div class="notice"></div>
 
				
				<div class="row">
				<input type="submit" value="약관 동의">							
				</div>
				
			</div>		
		</form>  		
	</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>
