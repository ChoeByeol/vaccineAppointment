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
%>



<%
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list  = clinicDao.list();
%>	

<%
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> vaccineList = vaccineDao.list();
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
            $(".form-btn-check").on("click",function(){

                var inputName = $("input[name=resName]").val();
                var inputRrn = $("input[name=resRrn]").val();
                var inputPhone = $("input[name=resPhone]").val();
                $.ajax({
                    url:"http://localhost:8080/ncv/reservation/memberCheck.txt",
                    //contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                    type:"post",//전송방식
                    data:{
                        resName:inputName,
                        resRrn:inputRrn,
                        resPhone:inputPhone
                    },
                    success:function(resp){//NNNNN, YYYYYY 중 하나가 돌아옴.
                        if(resp=="YYYYY"){
                        	console.log(resp);
                            alert("본인인증에 성공하였습니다.")
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
        });
    </script>

<div class="container-500 container-center"></div>
<input type="hidden" name="memberId" value="<%=memberId%>">
		
	<div class="container-400 container-center">
	<div class="row center">
		<h1>예약하기</h1>
	</div>
					
	<div class="row">
			<label>예약자 이름</label>
			<input type="text" name="resName" class="form-input">
	</div>
	<div class="row">
			<label>예약자 주민번호</label>
			<input type="text" name="resRrn" class="form-input">
	</div>
	<div class="row">
			<label>예약자 전화번호</label>
			<input type="tel" name="resPhone" class="form-input">
			<span></span>
			<button type="button" class="form-btn-check"></button>
	</div>
	<form action="reserve.txt" method="post">
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
			
		</div>
		<div class="container-400 container-center">	
			
	<% if (check) { %>
	<div class="row">
		<label>접종차수</label>
		<input type="hidden" name="resShot" value="1" >
		<label>1차</label>
	</div>			
	<%} else{ %>			
		<div class="row">
			<label>접종차수</label>
			<input type="hidden" name="resShot" value="2">
			<label>2차</label>
		</div>				
	<% } %>

	<div class="row">
		<label>의료기관</label>
		<select name="clinicNo" >
			<option value="" selected="selected" hidden="hidden" class="form-input">병원선택</option>
				<%for(ClinicDto clinicDto : list){ %>
				<option value="<%=clinicDto.getClinicNo()%>">
				<%=clinicDto.getClinicName()+" / "+clinicDto.getClinicAddress()+" / "+clinicDto.getClinicDetailAddress()%>
				</option>
				<%} %>
			</select>
		</div>		
			
	<div class="row">
		<label>예약일</label>
		<input type="date" name="resDate" class="form-input">
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
			

	<div class="row right">
		<input type="submit" value="예약" class="link-btn" >
		<input type="button" value="취소" onclick=" location.href = '<%=request.getContextPath()%>'" class="link-btn">
	</div>

	</div>
		
	
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>