<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="ncv.beans.ReservationDto"%>
<%@page import="ncv.beans.VaccineDto"%>
<%@page import="ncv.beans.VaccineDao"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@page import="ncv.beans.ClinicDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String memberId = (String) session.getAttribute("ses");

	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> vaccineList = vaccineDao.list();
//List<VaccineDto> vaccineList = vaccineDao.listByAge(memberDto);
%>


<%
			ReservationDao reservationDao = new ReservationDao();
			List<ReservationVo> myResList = reservationDao.myResList(memberId);
			ReservationDto reservationDto = reservationDao.vaccineCheck(memberId);

			int vacNo = 0;
			if (reservationDto != null) {
				vacNo= reservationDto.getVaccineNo();
			}

			boolean check = memberId != null && myResList.size() == 0; // 미접종
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
         $(function(){
        	 
        	
        	 
        	$(".page").hide();
            $(".page").eq(0).show();
             
            var p = 0;
            
            $(".form-btn-check").on("click",function(){
			
            	//var inputId = $("#memberId").val();
            	//console.log(inputId);
                var inputName = $("input[name=resName]").val();
                console.log(inputName);
                var inputRrn = $("input[name=resRrn]").val();
                console.log(inputRrn);
                var inputPhone = $("input[name=resPhone]").val();
                console.log(inputPhone);
                $.ajax({
                    url:"http://localhost:8080/ncv/reservation/member_check.txt",
                    type:"get",//전송방식
                    data:{
                    	//memberId:inputId,
                        resName:inputName,
                        resRrn:inputRrn,
                        resPhone:inputPhone
                    },
                    success:function(resp){//NNNNN, YYYYYY 중 하나가 돌아옴.
                        if(resp=="YYYYY"){
                        	console.log(resp);
                            alert("본인인증에 성공하였습니다.")

                            $(".page").eq(1).show();
                            $(".readonly-form").attr("readonly",true)
                            $(".form-btn-check").hide();
                        }
                        else if(resp=="NNNNN"){
                        	console.log(resp);
                            alert("본인인증에 실패하였습니다.")
                        }
                    },
                    error:function(err){//통신 실패
                        console.log("실패");
                        console.log(err);
                    }
                });
            });
            
            $(".clinic-btn").click(function(){
                var url ="reservation_popup.jsp";
                var option="resizable=no, scrollbars=no, status=no, width=500, height=500, left=400%, top=100%";
                
                var child;
                child = window.open(url,'',option);
            });
        });
    </script>
<%=memberId %>
<%=check %>

<form action="<%=request.getContextPath()%>/reservation/reserve.txt">
<div class="container-400 container-center">
	<div class="row center">
		<h1>예약하기</h1>
	</div>
	<div class="page">
		<%-- <input type="hidden" id="memberId" value="<%=memberId%>"> --%>
		<div class="row">
			<label>예약자 이름</label>
			<input type="text" name="resName" class="form-input readonly-form" value="테스트">
		</div>
		<div class="row">
			<label>예약자 주민번호</label>
			<input type="text" name="resRrn" class="form-input readonly-form" maxlength="13">
		</div>
		<div class="row">
			<label>예약자 전화번호</label>
			<input type="text" name="resPhone" class="form-input readonly-form" maxlength="11">
			<span></span>
			<button type="button" class="form-btn form-btn-check">본인인증</button>
		</div>
	</div>
	<div class="page">
		<div class="row">
			<label>예약일</label>
			<input type="date" name="resDate" class="form-input" min="now">
		</div>
		<div class="row">
			<label>의료기관</label>
			<button type="button" class="clinic-btn" >의료기관 찾기</button>
			<input type="hidden" name="clinicNo" id="pClinicNo">
			<input type="text" id="pClinicName" readonly>
		</div>
		<div class="row">
			<label>예약시간</label>
			<select name="resTime" class="form-input">
				<option>09:00</option>
				<option>10:00</option>
				<option>11:00</option>
				<option>12:00</option>
				<option>13:00</option>
				<option>14:00</option>
				<option>15:00</option>
				<option>16:00</option>
				<option>17:00</option>
				<option>18:00</option>
			</select>
		</div>	
		<% if (vacNo == 1) { %>				
			<div class="row">
				<label>백신</label>
				<input type="hidden" name="vaccineNo" value="1" class="form-input">
				<label>화이자</label>
			</div>	
		<%} else if (vacNo == 2){ %>	
			<div class="row">
				<label>백신</label>
				<input type="hidden" name="vaccineNo" value="2" class="form-input">
				<label>모더나</label>
			</div>					
		<%} else if (vacNo == 3){ %>
			<div class="row">
				<label>백신</label>
				<input type="hidden" name="vaccineNo" value="3" class="form-input">
				<label>아스트라제네카</label>
			</div>	
		<%} else{ %>		
			<div class="row">
				<label>백신</label>
				<select name="vaccineNo">
			<%for(VaccineDto vaccineDto : vaccineList){ %>
				<option value="<%=vaccineDto.getVaccineNo()%>">
			<%=vaccineDto.getVaccineName()%>
				</option>
			<%} %>
				</select>
			<% } %>	
			</div>	
			<% if (check) { %>
			<div class="row">
				<label>접종차수</label>
				<input type="hidden" name="resShot" value="1" >
				<label>1차</label>
			</div>			
			<%} else { %>			
			<div class="row">
				<label>접종차수</label>
				<input type="hidden" name="resShot" value="2">
				<label>2차</label>
			</div>				
			<% } %>
			<div class="row right">
				<input type="submit" value="예약" class="link-btn">
				<input type="button" value="취소" class="link-btn" onclick=" location.href = '<%=request.getContextPath()%>'" >
			</div>
	</div>
</div>
</form>
<<<<<<< HEAD

<jsp:include page="/template/footer.jsp"></jsp:include>

=======
>>>>>>> refs/remotes/origin/BYEOL

<jsp:include page="/template/footer.jsp"></jsp:include>