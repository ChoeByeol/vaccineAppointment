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
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
.form-input{
	margin-left:2%;
	margin-right:2%;
	width:20%;
	font-size:18px;
	padding:0.2px;
	height:30px;
}
</style>
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
<div class="container-900 container-center">
<form action="list.jsp" method="get">
	<div id="test" class="page">
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
		<input type="submit" value="의료기관 찾기" class="input-btn">
	</div>
</form>

<hr>
<%if(list!=null&&list.size()!=0){%>
<table class="table table-stripe">
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
<%} %>
	</tbody>
</table>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>