<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list  = clinicDao.list();
%>	

<%
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> vaccineList = vaccineDao.list();
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.float-container>.float-item-left:nth-child(1) {
	width: 25%;
	padding: 0.5rem;
}

.float-container>.float-item-left:nth-child(2) {
	width: 75%;
	padding: 0.5rem;
}

.link-btn {
	width: 100%;
}

tr {
	display: table;
	table-layout: fixed;
	width: 100%;
	border-top: 1px solid black;
}
td {	
	border-left : 1px solid black;
	border-right : 1px solid black;
	vertical-align: middle;
	word-wrap: break-word;
    word-break: keep-all;
}
tbody {
	border-bottom: 1px solid black;
}

.table.table-font {
	font-size: 16px;
}
</style>


<div class="container-400 container-center">
		
	<div class="row center">
		<h1>백신 출고 등록</h1>
	</div>
					
	<form action="stockOut.txt" method="post">

	<div class="row">
		<label>병원선택</label>
		<select name="clinicNo" >
			<option value="" selected="selected" hidden="hidden" class="form-input">병원선택</option>
				<%for(ClinicDto clinicDto : list){ %>
				<option value="<%=clinicDto.getClinicNo()%>">
				<%=clinicDto.getClinicName()+" / "+clinicDto.getClinicAddress()+" / "+clinicDto.getClinicDetailAddress()%>
				</option>
				<%} %>
			</select> 
		</div>				
				
		<div class="row">
			<label>백신선택</label>
			<select name="vaccineNo">
			<%for(VaccineDto vaccineDto : vaccineList){ %>
			<option value="<%=vaccineDto.getVaccineNo()%>">
			<%=vaccineDto.getVaccineName()%>
			</option>
			<%} %>
			</select>
		</div>		
			
	<div class="row">
		<label>수량</label>
		<input type="number" name="StockOutQty" class="form-input">
	</div>	

		
	<div class="row right">
		<input type="submit" value="입고" class="link-btn" >
		<input type="button" value="취소" onclick=" location.href = '<%=request.getContextPath()%>'" class="link-btn">
	</div>
 
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>