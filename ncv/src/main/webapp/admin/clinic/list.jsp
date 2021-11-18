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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>

 	$(function(){
  
	  	$("#sido").change(function(){
	   	  		
		   	var param = "clinicSido=" + $("#sido").val();
		   
		   	$.ajax({
		    	url : "ajax_sigungu_list.jsp",
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
		    	url : "ajax_bname_list.jsp",
		    	data : param,
		    	type : "get",
		    	success : function(data){
		     		$("#bname").html(data);
		    	}
		   	})
	  		
	  	});
	});
</script>

</head>
<body>
<form action="list.jsp" method="get">
	<div id="test">
		<select name="clinicSido" id="sido">
			<option value="">광역시도</option>
			<%for(String sido : sidoList){ %>
			<option value="<%=sido %>"><%=sido %></option>
			<%} %>
		</select>
		
		<select name="clinicSigungu" id="sigungu">
			<option value="">시군구</option>
		</select>
		
		<select name="clinicBname" id="bname">
			<option value="">읍면동</option>
		</select>
		
		<input type="submit" value="의료기관 찾기">
	</div>
</form>

<hr>

<table border="1">
	<thead>
		<tr>
			<th>병원 이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
	</thead>
	
	<tbody>
		<%for(ClinicDto clinicDto : list){ %>
		<tr>
			<td><a href="/ncv/admin/clinic/select.jsp?clinicNo=<%=clinicDto.getClinicNo() %>"><%=clinicDto.getClinicName() %></a></td>
			<td><%=clinicDto.getClinicTel() %></td>
			<td><%="(" + clinicDto.getClinicPostcode() + ") " + clinicDto.getClinicAddress() %></td>
		<tr>
		<%} %>
	</tbody>
</table>

</body>
</html>