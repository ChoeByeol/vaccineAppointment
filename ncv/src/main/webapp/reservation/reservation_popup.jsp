<%@page import="ncv.beans.ClinicDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ClinicDao clinicDao = new ClinicDao();
List<String> sidoList = clinicDao.sidoList();
%>

<!-- 입력 -->
<%
	String clinicSido = request.getParameter("clinicSido");
	String clinicSigungu = request.getParameter("clinicSigungu");
	String clinicBname = request.getParameter("clinicBname");
%>
<!-- 처리 -->
<%
List<ClinicDto> list = clinicDao.searchByAddress(clinicSido, clinicSigungu, clinicBname);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료기관 선택하기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/layout.css">
<style>
.form-input{
	margin-left:2%;
	margin-right:2%;
	width:20%;
	font-size:16px;
}
.form-btn{
	font-size:14px;
	margin: 10px 19px 20px;
}
</style> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	  
  	$("#sido").change(function(){
   	  		
	   	var param = "clinicSido=" + $("#sido").val();
	   
	   	$.ajax({
	    	url : "${pageContext.request.contextPath}/reservation/ajax_sigungu_list.jsp",
	    	data : param,
	    	type : "get",
	    		success : function(data){
		    		//console.log(data);
		    		console.log("성공");
		     		$("#sigungu").html(data);
		     		$("#bname").html("<option value=\"\">읍면동</option>");
		    		},
	       		error:function(err){//통신이 실패했다.
	       			console.log("성공");
					alert("다시 시도해 주세요.");
	        	}
	   		});
		});
  	
	  	$("#sigungu").change(function(){
	  		var param = "clinicSido="+$("#sido").val()+"&clinicSigungu=" + $(this).val();
	  		
	   	$.ajax({
	    	url : "${pageContext.request.contextPath}/reservation/ajax_bname_list.jsp",
	    	data : param,
	    	type : "get",
		    	success : function(data){
		    		//console.log(data);
		    		console.log("성공");
		     		$("#bname").html(data);
		    	},
	       		error:function(err){//통신이 실패했다.
	       			console.log("성공");
					alert("다시 시도해 주세요.");
	        	}
	   		})
  		});
	  	
	  	$("#close-btn").click(function(){
	  		window.close();
	  	});
	  	
	  	//주소를 다 선택안하면 검색이 안되게
	  	$(".find-btn").click(function(){
	  		if($("#bname").val() == ""){
	  			alert("똑바로 고르셈");
	  			return false
	  		}
	  		else{
	  			return true;
	  		}
	  	});
	  	
});
</script>

</head>
<body>
<form action="reservation_popup.jsp" method="get">
	<div id="test">
		<select name="clinicSido" id="sido" class="form-input">
			<option value="">광역시도</option>
			<%for(String sido : sidoList){ %>
			<option value="<%=sido %>"><%=sido %></option>
			<%} %>
		</select>
		
		<select name="clinicSigungu" id="sigungu" class="form-input">
			<option value="">시군구</option>
		</select>
		
		<select name="clinicBname" id="bname" class="form-input">
			<option value="">읍면동</option>
		</select>
		<input type="submit" value="의료기관 찾기" class="form-btn form-inline find-btn">
	</div>
</form>

<hr>

		<%for(ClinicDto clinicDto : list){ %>
			<div class="container-200 table">
				<label>병원 이름</label>
				<a href="/ncv/reservation/reservation_clinic_detail.jsp?clinicNo=<%=clinicDto.getClinicNo() %>"><%=clinicDto.getClinicName() %></a>
				<label>전화번호</label>
				<%=clinicDto.getClinicTel()%>
				<label>주소</label>
				<%="(" + clinicDto.getClinicPostcode() + ") " + clinicDto.getClinicAddress()%>
			</div>
		<%} %>
	<div class="container-100">
	<button id="close-btn" class="form-btn">닫기</button>
	</div>
</body>
</html>