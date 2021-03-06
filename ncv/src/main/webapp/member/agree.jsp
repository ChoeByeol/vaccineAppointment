<%@page import="java.util.List"%>
<%@page import="ncv.beans.AgreeDto"%>
<%@page import="ncv.beans.AgreeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	AgreeDao agreeDao = new AgreeDao();
	AgreeDto agreeDto  = agreeDao.get();
%>    

<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
    	<style>
    	
        .notice {
            color:red;
         }
         
       *{margin: 0;padding: 0;box-sizing: border-box}
		body{background-color: #f7f7f7;}
		ul>li{list-style: none}
		a{text-decoration: none;}
		.clearfix::after{content: "";display: block;clear: both;}
		
		#joinForm{width: 460px;margin: 0 auto;}
		ul.join_box{border: 1px solid #ddd;background-color: #fff;}
		.checkBox,.checkBox>ul{position: relative;}
		.checkBox>ul>li{float: left;}
		.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
		.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
		.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
		.footBtwrap{margin-top: 15px;}
		.footBtwrap>li{float: left;width: 100%;height: 60px;}
		.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
		.fpmgBt1{background-color: #fff;color:#888}
		.fpmgBt2{background-color: lightsalmon;color: #fff}
    	</style>
	    <title>약관동의</title>
	    <script>
	    
	    	
	        function allAgree(){
	            var checkbox = document.querySelector(".check-all");
	            var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");
	            //var notice =checkbox.nextElementSibling;
	            var notice =checkbox.parentElement.parentElement.nextElementSibling.children[0].children[0];
	            console.log(notice);
	            
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
<%if(agreeDto == null){ %>
<h3>약관 내용이 존재하지 않습니다</h3>
<%} else{ %>
<form action="<%=request.getContextPath()%>/member/join.jsp?" id="joinForm">
	
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관을 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" oninput="allAgree();" class="check-all" name="AllAgree" required>
                        </li>
                    </ul>
                    <ul>
                    	<li><div class="notice"></div></li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>수집하는 개인정보</li>
                        <li class="checkBtn">
                           <input type="checkbox" oninput="check();" class="ck1" required>
                        </li>
                    </ul>
                    <textarea name="agree1" ><%=agreeDto.getAgree1()%>
       				</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 방법</li>
                        <li class="checkBtn">
                            <input type="checkbox" oninput="check();" class="ck2"required>
                        </li>
                    </ul> 
                    <textarea name="agree2" id=""><%=agreeDto.getAgree2()%>
       				</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>수집한 개인정보의 이용</li>
                        <li class="checkBtn">
                           <input type="checkbox" oninput="check();" class="ck3" required>
                        </li>
                    </ul> 
                    <textarea name="agree3" id=""><%=agreeDto.getAgree3()%>
       				</textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보의 제공 및 위탁</li>
                        <li class="checkBtn">
                           <input type="checkbox" oninput="check();" class="ck4" required>
                        </li>
                    </ul> 
                    <textarea name="agree4" id=""><%=agreeDto.getAgree4()%>
       				</textarea>
				</li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                   		<br>
                    </ul>
                        </li>
                    </ul>
                   
 
            <ul class="footBtwrap clearfix">
                <li>
                	<input type="submit" value="회원가입" class="form-btn" onclick="allAgree();">
                </li>                
            </ul>
        </form>
        <%} %> 



<jsp:include page="/template/footer.jsp"></jsp:include>