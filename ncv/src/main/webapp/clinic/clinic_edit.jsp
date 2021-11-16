<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    $(function(){
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
                    document.querySelector("input[name=clinicPostcode]").value = data.zonecode;
                    //$("input[name=postcode]").val(data.zonecode);
                    document.querySelector("input[name=clinicAddress]").value = addr;
                    //$("input[name=address]").val(addr);
                    
                    //시도
                    document.querySelector("input[name=clinicSido]").value = data.sido;
                    //시군구
                    document.querySelector("input[name=clinicSigungu]").value = data.sigungu;
                    //읍면동
                    document.querySelector("input[name=clinicBname]").value = data.bname;

                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("input[name=clinicDetailAddress]").focus();
                    //$("input[name=detailAddress]").focus();

                }
            }).open();
        };
    });
</script>

<%--입력--%>
<% int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));%>

<%--처리--%>
<%
	ClinicDao clinicDao = new ClinicDao();
	ClinicDto clinicDto = clinicDao.select(clinicNo);
%>

<form action="edit.txt" method="post">
				<input type="hidden" name="clinicNo" required value="<%=clinicDto.getClinicNo()%>">
				병원 이름 : <input type="text" name="clinicName" required value="<%=clinicDto.getClinicName()%>">
				<br><br>
				병원 연락처 : <input type="text" name="clinicTel" required value="<%=clinicDto.getClinicTel()%>">
				<br><br>
				진료시간 : <input type="text" name="clinicTime" required value="<%=clinicDto.getClinicTime()%>">
				<br><br>
				우편번호 : <input type="text" name="clinicPostcode" required value="<%=clinicDto.getClinicPostcode()%>">
				<button type="button" class="find-address-btn">주소 검색</button>
				<br><br>
				병원 주소 : <input type="text" name="clinicAddress" required value="<%=clinicDto.getClinicAddress()%>">
				<br><br>
				상세주소 : <input type="text" name="clinicDetailAddress" required value="<%=clinicDto.getClinicDetailAddress()%>">
				<br><br>
				<input type="submit" value="수정">
				<input type="hidden" name="clinicSido" required value="<%=clinicDto.getClinicSido()%>">
				<input type="hidden" name="clinicSigungu" required value="<%=clinicDto.getClinicSigungu()%>">
				<input type="hidden" name="clinicBname" required value="<%=clinicDto.getClinicBname()%>">		
</form>