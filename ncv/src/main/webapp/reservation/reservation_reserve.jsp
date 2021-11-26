<%@page import="ncv.beans.ShotDao"%>
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
ClinicDao clinicDao = new ClinicDao();
List<ClinicDto> list  = clinicDao.list();
%>	


<%
VaccineDao vaccineDao = new VaccineDao();
List<VaccineDto> canShotVaccineList = vaccineDao.listByAge(memberDto);

Shot2Dao shotDao = new Shot2Dao();
List<Shot2Vo> shotVaccineList = shotDao.myVaccineList(memberId);

boolean shot2 = shotVaccineList.size()>0;
%>



<%
			ReservationDao reservationDao = new ReservationDao();
			List<ReservationVo> myResList = reservationDao.myResList(memberId);
			ReservationDto reservationDto = reservationDao.vaccineCheck(memberId);

			boolean check = memberId != null && myResList.size() == 0; // 미접종
			
			
%>

<%--
	ReservationDao reservationDao = new ReservationDao();
	List<ReservationDto> reservationList = reservationDao.list();
--%>


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
.address-input{
	width:63%;
}
.text-auto{
	font-size: 20px;
}
.content-auto{
	height:50px;
}
 .button_base {
    position:absolute;
    bottom:10%;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 100px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
    color: #000000;
    background-color:#dee2e6;
 	padding:7px; 
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn:hover {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}

@-webkit-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}

@-moz-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}
 .button_base_oppo {
    position:absolute;
    bottom:10%;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 100px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn_oppo {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
 	padding:7px; 
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn_oppo:hover {
    color: #000000;
    background-color:#dee2e6;
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}

@-webkit-keyframes btn_oppo {
    from,
    to {
        background-color: #ffffff;
        color: #000000;
    }
    50% {
        background-color: #f8f8f8;
        color: #080808;
    }
}

@-moz-keyframes btn_oppo {
    from,
    to {
        background-color: #ffffff;
        color: #000000;
    }
    50% {
        background-color: #f8f8f8;
        color: #080808;
    }
}
.shot-sec{
	border:none;
	font-size:20px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
         $(function(){
        	$(".page").hide();
            $(".page").eq(0).show();
            
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
                            alert("본인인증에 성공하였습니다.")

                            $(".page").eq(1).show();
                            $(".readonly-form").attr("readonly",true)
                            $(".form-btn-check").hide();
                        }
                        else if(resp=="NNNNN"){
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
                var option="resizable=no, scrollbars=no, status=no, width=800, height=600, left=400%, top=100%";
                
                var child;
                child = window.open(url,'',option);
            });
        });
    </script>
   


    
<form action="<%=request.getContextPath()%>/reservation/reserve.txt">
<div class="container-400 container-center">


	<div class="page">
		<%-- <input type="hidden" id="memberId" value="<%=memberId%>"> --%>
		<div class="row">
			<label>예약자 이름</label>
			<input type="text" name="resName" class="form-input readonly-form" value="김김김">
		</div>
		<div class="row">
			<label>예약자 주민번호</label>
<<<<<<< HEAD
			<input type="text" name="resRrn" class="form-input readonly-form" value="1231411231231">
=======
			<input type="text" name="resRrn" class="form-input readonly-form" maxlength="13">
>>>>>>> refs/remotes/origin/BYEOL
		</div>
		<div class="row">
			<label>예약자 전화번호</label>
<<<<<<< HEAD
			<input type="text" name="resPhone" class="form-input readonly-form" value="01023120301">
			
=======
			<input type="text" name="resPhone" class="form-input readonly-form" maxlength="11">
>>>>>>> refs/remotes/origin/BYEOL
			<span></span>
			<button type="button" class="form-btn form-btn-check">본인인증</button>
		</div>
	</div>
	
	<div class="page">
		<div class="row">
			<label>예약일</label>
			<input type="date" name="resDate" class="form-input">
		</div>
		<div class="row">
			<label>의료기관</label><br>
			<input type="text" id="pClinicName" class="address-input" readonly>
			<button type="button" class="clinic-btn form-btn form-inline" >의료기관 찾기</button>
			<input type="hidden" name="clinicNo" id="pClinicNo">
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
<<<<<<< HEAD

		<% if (vacNo == 1) { %>				
			<div class="row">
				<label>백신</label>
=======
		<% if (shot2) { %>				
			<div class="row content-auto">
				<label class="text-auto">백신</label>
>>>>>>> refs/remotes/origin/BYEOL
				<input type="hidden" name="vaccineNo" value="1" class="form-input">
				<%for(Shot2Vo shot2Vo : shotVaccineList){ %>
				<input type="text" value="<%=shot2Vo.getVaccineName()%>" class="shot-sec" readonly>
				<%} %>
			</div>		
		<%} else{ %>		
			<div class="row content-auto">
				<label class="text-auto">백신</label>
				<select class="text-auto" name="vaccineNo">
			<%for(VaccineDto vaccineDto : canShotVaccineList){ %>
				<option value="<%=vaccineDto.getVaccineNo()%>">
			<%=vaccineDto.getVaccineName()%>
				</option>
			<%} %>
				</select>
<<<<<<< HEAD
				</div>
			<% } %>	
			
		<div class="container-400 container-center">		
=======
			</div>
			<% } %>	
>>>>>>> refs/remotes/origin/BYEOL
			<% if (check) { %>
			<div class="row content-auto">
				<label class="text-auto">접종차수</label>
				<input type="hidden" name="resShot" value="1" >
				<label class="text-auto">1차</label>
			</div>			
			<%} else { %>			
			<div class="row content-auto">
				<label class="text-auto">접종차수</label>
				<input type="hidden" name="resShot" value="2">
				<label class="text-auto">2차</label>
			</div>				
			<% } %>
			<div class="row center">
				<input type="submit" value="예약" class="btn_oppo button_base_oppo" >
				<input type="button" value="취소" onclick=" location.href = '<%=request.getContextPath()%>'" class="btn button_base">
			</div>
	</div>
</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>