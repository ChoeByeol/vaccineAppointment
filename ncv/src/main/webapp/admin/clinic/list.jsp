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
.button_base {
    font-size:17px;
    border: 0;
    position: relative;
    width: 120px;
    height: 40px;
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
.form-input{
	margin-top: 30px;
    margin-left:4%;
    margin-right:2%;
    width:20%;
    font-size:17px;
    line-height: 40px;
    height: 40px;
    padding: 0px 10px 0px 0px;
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
	    	url : "${pageContext.request.contextPath}/admin/clinic/ajax_sigungu_list.jsp",
	    	data : param,
	    	type : "get",
	    		success : function(data){
		     		$("#sigungu").html(data);
		     		$("#bname").html("<option value=\"\">읍면동</option>");
		    		},
	       		error:function(err){//통신이 실패했다.
					alert("다시 시도해 주세요.");
	        	}
	   		});
		});
  	
	  	$("#sigungu").change(function(){
	  		var param = "clinicSido="+$("#sido").val()+"&clinicSigungu=" + $(this).val();
	  		
	   	$.ajax({
	    	url : "${pageContext.request.contextPath}/admin/clinic/ajax_bname_list.jsp",
	    	data : param,
	    	type : "get",
		    	success : function(data){
		     		$("#bname").html(data);
		    	},
	       		error:function(err){//통신이 실패했다.
					alert("다시 시도해 주세요.");
	        	}
	   		})
  		});
	  	
	  	//주소를 다 선택안하면 검색이 안되게
	  	$(".find-btn").click(function(){
	  		if($("#bname").val() == ""){
	  			alert("정확한 주소를 선택해 주세요.");
	  			return false
	  		}
	  		else{
	  			return true;
	  		}
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
		<input type="submit" value="의료기관 찾기" class="btn button_base find-btn">
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