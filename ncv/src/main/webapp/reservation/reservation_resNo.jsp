<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

            <div class="container-1000 container-center">
                <div class="row">
                    <img src="<%=request.getContextPath()%>/resource/image/reservation_resNo.png" width="70%">
					<br>
					<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="link-btn" href="<%=request.getContextPath()%>/member/mypage.jsp">마이페이지</a>
					<a class="link-btn" href="<%=request.getContextPath()%>">메인 페이지로</a> 				
				</div>
            </div>
            
<jsp:include page="/template/footer.jsp"></jsp:include>
