<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 입력 : 백신번호(vaccineNo) --%>
<%
	int vaccineNo = Integer.parseInt(request.getParameter("vaccineNo"));
%>


<%
VaccineDao vaccineDao = new VaccineDao();
VaccineDto vaccineDto = vaccineDao.get(vaccineNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<form action="vaccineEdit.txt" method="post">
<input type="hidden" name="vaccineNo" value="<%=vaccineDto.getVaccineNo()%>">

<div class="container-400 container-center">
	<div class="row center">
		<h2>백신 정보 변경</h2>	
	</div>

	<div class="row">
	<label>백신이름</label>
	<input type="text" name="vaccineName" value="<%=vaccineDto.getVaccineName()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>백신명</label>
	<input type="text" name="vaccineValue" value="<%=vaccineDto.getVaccineValue()%>" class="form-input">
	</div>

	<div class="row">
	<label>플랫폼</label>
	<input type="text" name="vaccinePlatform" value="<%=vaccineDto.getVaccinePlatform()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>제조사</label>
	<input type="text" name="vaccineCompany" value="<%=vaccineDto.getVaccineCompany()%>" class="form-input">
	</div>	
	
	<div class="row">
	<label>연령</label>
	<input type="text" name="vaccineAge" value="<%=vaccineDto.getVaccineAge()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>구성</label>
	<input type="text" name="vaccineComposition" value="<%=vaccineDto.getVaccineComposition()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>접종 횟수</label>
	<input type="text" name="vaccineShot" value="<%=vaccineDto.getVaccineShot()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>접종 간격</label>
	<input type="text" name="vaccineInterval" value="<%=vaccineDto.getVaccineInterval()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>접종량 및 방법</label>
	<input type="text" name="vaccineMethod" value="<%=vaccineDto.getVaccineMethod()%>" class="form-input">
	</div>

	<div class="row">
	<label>보관</label>
	<input type="text" name="vaccineKeep" value="<%=vaccineDto.getVaccineKeep()%>" class="form-input">
	</div>
	
	<div class="row">
	<label>유통</label>
	<input type="text" name="vaccineExpire" value="<%=vaccineDto.getVaccineExpire()%>" class="form-input">
	</div>	

	<div class="row">
	<label>개봉 후 유효기간</label>
	<input type="text" name="vaccineLife" value="<%=vaccineDto.getVaccineLife()%>" class="form-input">
	</div>	
		
	<div class="row right">
		<input type="submit" value="변경" class="form-btn form-inline">
		<button type="button" class="form-btn form-inline" onclick="location.href='../vaccine/vaccine_detail.jsp?vaccineNo=<%=vaccineDto.getVaccineNo()%>';">취소</button>
	</div>
	
</div>

</form>



<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>
