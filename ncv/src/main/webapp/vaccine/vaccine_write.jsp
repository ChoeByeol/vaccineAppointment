<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String vaccineNo = request.getParameter("vaccineNo");
%>

<%-- <jsp:include page="/template/header.jsp"></jsp:include> --%>


<form action= "vaccineWrite.txt" method="post">

<input type="hidden" name="vaccineNo" value="<%=vaccineNo%>">

<div class="container-400 container-center">
	<div class="row center">
		<h2>백신 등록</h2>	
	</div>

	<div class="row">
	<label>백신이름</label>
	<input type="text" name="vaccineName" class="form-input">
	</div>
	
	<div class="row">
	<label>백신명</label>
	<input type="text" name="vaccineValue"  class="form-input">
	</div>

	<div class="row">
	<label>플랫폼</label>
	<input type="text" name="vaccinePlatform"  class="form-input">
	</div>
	
	<div class="row">
	<label>제조사</label>
	<input type="text" name="vaccineCompany"  class="form-input">
	</div>	
	
	<div class="row">
	<label>연령</label>
	<input type="text" name="vaccineAge"  class="form-input">
	</div>
	
	<div class="row">
	<label>구성</label>
	<input type="text" name="vaccineComposition"  class="form-input">
	</div>
	
	<div class="row">
	<label>접종 횟수(간격)</label>
	<input type="text" name="vaccineInterval"  class="form-input">
	</div>
	
	<div class="row">
	<label>접종량 및 방법</label>
	<input type="text" name="vaccineMethod"  class="form-input">
	</div>

	<div class="row">
	<label>보관</label>
	<input type="text" name="vaccineKeep"  class="form-input">
	</div>
	
	<div class="row">
	<label>유통</label>
	<input type="text" name="vaccineExpire"  class="form-input">
	</div>	

	<div class="row">
	<label>개봉 후 유효기간</label>
	<input type="text" name="vaccineLife"  class="form-input">
	</div>	
		
	<div class="row right">
		<input type="submit" value="등록" class="form-btn form-inline">
		<button type="button" class="form-btn form-inline" onclick="location.href='../vaccine/vaccine.jsp';">취소</button>
	</div>
	
</div>

</form>



<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">입력하신 정보가 일치하지 않습니다</font></h4>
<%} %>

<%-- <jsp:include page="/template/footer.jsp"></jsp:include> --%>