<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));
ClinicDao clinicDao = new ClinicDao();
ClinicDto clinicDto = clinicDao.select(clinicNo);
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
		<h1>백신 입고 등록</h1>
	</div>
					
	<form action="stockIn.txt" method="post">

	<div class="row">
		<label>병원명</label>
			<input type="hidden" name="clinicNo" value="<%=clinicDto.getClinicNo()%>" readonly><%=clinicDto.getClinicName()%>
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
		<input type="number" name="stockInQty" class="form-input" required min="0">
	</div>	

		
	<div class="row right">
		<input type="submit" value="입고" class="link-btn" >
		<input type="button" value="취소" onclick=" location.href = '<%=request.getContextPath()%>'" class="link-btn">
	</div>
 
</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>