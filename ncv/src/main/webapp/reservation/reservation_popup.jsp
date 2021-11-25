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
	width:25%;
}
</style> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
 	$(function(){
  
	  	$("#sido").change(function(){
	   	  		
		   	var param = "clinicSido=" + $("#sido").val();
		   
		   	$.ajax({
		    	url : "http://localhost:8080/ncv/admin/clinic/ajax_sigungu_list.jsp",
		    	data : param,
		    	type : "get",
		    	success : function(data){
		     		$("#sigungu").html(data);
		    	}
		   	});
		   	
		});
	  	
 	  	$("#sigungu").change(function(){
  	  		var param = "clinicSido="+$("#sido").val()+"&clinicSigungu=" + $(this).val();
 	  		
		   	$.ajax({
		    	url : "http://localhost:8080/ncv/admin/clinic/ajax_bname_list.jsp",
		    	data : param,
		    	type : "get",
		    	success : function(data){
		     		$("#bname").html(data);
		    	}
		   	})
	  		
	  	});
 	  	
 	  	$("#close-btn").click(function(){
 	  		window.close();
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
		
		<select name="clinicBname" id="bname" class="form-input" required>
			<option value="">읍면동</option>
		</select>
		
		<input type="submit" value="의료기관 찾기" class="input-btn">
	</div>
</form>

<hr>

		<%for(ClinicDto clinicDto : list){ %>
			<div>
				<label>병원 이름</label>
				<a href="/ncv/reservation/reservation_clinic_detail.jsp?clinicNo=<%=clinicDto.getClinicNo() %>"><%=clinicDto.getClinicName() %></a>
			</div>
			<div>
				<label>전화번호</label>
				<%=clinicDto.getClinicTel()%>
			</div>
			<div>
				<label>주소</label>
				<%="(" + clinicDto.getClinicPostcode() + ") " + clinicDto.getClinicAddress()%>
			</div>
		<%} %>
	<button id="close-btn">닫기</button>
</body>
</html>