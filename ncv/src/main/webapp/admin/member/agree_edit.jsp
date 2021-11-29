<%@page import="ncv.beans.AgreeDto"%>
<%@page import="ncv.beans.AgreeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/template/header.jsp"></jsp:include>

<%
	AgreeDao agreeDao = new AgreeDao();
	AgreeDto agreeDto = agreeDao.get();
%>
<style>
.text-input{
 	width: 96%;
    height: 90px;
    margin: 5px;
}

.label-text{
    width: 85%;
    padding: 15px;
    font-weight: 600;
    color: #888;
}

</style>
</head>
<body>

	<form action="<%=request.getContextPath()%>/admin/member/agreeEdit.txt" method="post" name="form">
		<div class="container-400 container-center">
		<div class="row">
		<label class="label-text">약관1</label>
	    <textarea name="agree1" class="text-input"><%=agreeDto.getAgree1()%></textarea>
	    </div>
	    <div class="row">
	    <label class="label-text">약관2</label>
	    <textarea name="agree2" class="text-input"><%=agreeDto.getAgree2()%></textarea>
	    </div>
	    <div class="row">
	    <label class="label-text">약관3</label>
	    <textarea name="agree3" class="text-input"><%=agreeDto.getAgree3()%></textarea>
	    </div>
	    <div class="row">
	    <label class="label-text">약관4</label>
	    <textarea name="agree4" class="text-input"><%=agreeDto.getAgree4()%></textarea>
	    </div>
		<div class="row">
		<input type="submit" value="약관변경"class="form-btn">
		</div>
	</form>
</body>


</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>