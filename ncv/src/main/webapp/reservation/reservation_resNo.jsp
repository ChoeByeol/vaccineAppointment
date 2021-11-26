<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>


 <h1> 허용 차수를 초과하여 예약이 불가능합니다. </h1>

<h3><a class="link-btn" href="<%=request.getContextPath()%>/member/mypage.jsp">마이페이지</a></h3>
<h3><a class="link-btn" href="<%=request.getContextPath()%>">메인 페이지로</a></h3>



<jsp:include page="/template/footer.jsp"></jsp:include>