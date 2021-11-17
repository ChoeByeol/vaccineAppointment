<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <script>    	
        $(".find-address-btn").click(function(){
            findAddress();
        });
        function findAddress(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ""; // 주소 변수
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
                            addr = data.roadAddress + " (" + data.bname + ")";
                        }
                        else{
                            addr = data.roadAddress;
                        }
                    } 
                    else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector("input[name=memberPostcode]").value = data.zonecode;
                    //$("input[name=postcode]").val(data.zonecode);
                    document.querySelector("input[name=memberAddress]").value = addr;
                    //$("input[name=address]").val(addr);
                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("input[name=memberDetailAddress]").focus();
                    //$("input[name=detailAddress]").focus();
                }
            }).open();
        };
    
</script>

<%-- 입력 : memberId (session) --%>
<%
	String memberId = request.getParameter("memberId");
%>

<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%-- 출력 --%>
<%-- <jsp:include page="/template/header.jsp"></jsp:include> --%>

<h2>회원 정보 수정</h2>

<form action="edit.txt" method="post">
	
	<table border="0">
		<tbody>
		<tr>
                <th>이름</th>
                <td>
                <input type="hidden" name="memberName" value="<%=memberDto.getMemberName()%>">
                <%=memberDto.getMemberName()%>
                </td>
            </tr>
            
			<tr>
                <th>아이디</th>
                <td>
                <input type="hidden" name="memberId" value="<%=memberDto.getMemberId()%>">
                <%=memberDto.getMemberId()%>
                </td>
            </tr>
				
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="memberPw" required value="<%=memberDto.getMemberPw()%>">
				</td>
			</tr>
			
			 <tr>
                <th>주민등록번호</th>
                <td>
                <input type="hidden" name="memberRrn" value="<%=memberDto.getMemberRrn()%>">
                <%=memberDto.getMemberRrn()%>
                </td>
            </tr>
            
			<tr>
                <th>성별</th>
                <td>
                <input type="hidden" name="memberGender" value="<%=memberDto.getMemberGender()%>">
                <%=memberDto.getMemberGender()%>
                </td>
            </tr>
            
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="memberAddress" required value="<%=memberDto.getMemberPostcode()%>">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="memberAddress" required value="<%=memberDto.getMemberAddress()%>">
				</td>
			</tr>
			
			<tr>
				<th>상세주소</th>
				<td>
					<input type="text" name="memberAddress" required value="<%=memberDto.getMemberDetailAddress()%>">
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type= "tel" name= "memberPhone"	required value="<%=memberDto.getMemberPhone()%>">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
				</td>
			</tr>
		</tbody>
	</table>
	
</form>

<%if(request.getParameter("error") != null){%>
<h4><font color="red">비밀번호가 일치하지 않습니다</font></h4>
<%} %>

<%-- <jsp:include page="/template/footer.jsp"></jsp:include> --%>