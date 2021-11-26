<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
 
 <h2> 로그인 완료</h2>
 
<h4><a href="<%=request.getContextPath()%>/member/mypage.jsp">My Page</a></h4>
<h4><a href="<%=request.getContextPath()%>/reservation/reservation_reserve.jsp">예약하기</a></h4>
<h4><a href="<%=request.getContextPath()%>/reservation/reservation_edit.jsp">예약 수정</a></h4>
  
 <jsp:include page="/template/footer.jsp"></jsp:include>
 