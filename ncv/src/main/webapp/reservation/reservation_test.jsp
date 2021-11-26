<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/reservation/test.txt" method="post">
		<div class="container-400 container-center">
			<div class="row center">
				<h1>테스트하기</h1>
			</div>

			<div class="row">
				<label>병원번호</label> 
				<input type="text" name="clinicNo" class="form-input">
			</div>

			<div class="row">
				<label>백신번호</label> 
				<input type="text" name="vaccineNo" class="form-input">
			</div>

			<div class="row right">
				<input type="submit" value="테스트" class="link-btn">
			</div>
		</div>

	</form>

</body>
</html>