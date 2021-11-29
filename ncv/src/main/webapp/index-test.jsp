<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- --%>
<%
String memberId = (String) session.getAttribute("ses");

Shot2Dao shotDao = new Shot2Dao();
Shot2Vo shotVo = shotDao.get(memberId);
%>

<%
String shot = shotVo.getShotDateDay() ;
%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
var mindate  = 2021-11-20
</script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  
  function noWeekendsOrHolidays(date) { 
	   var noWeekend = jQuery.datepicker.noWeekends(date); 
	   return noWeekend[0] ? [true] : noWeekend; 
	}
  </script>

<script>

    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        minDate: 'mindate',
        maxDate: "2M",
        beforeShowDay: noWeekendsOrHolidays
    });

    $(function() {
        $("#datepicker1").datepicker();
    });

</script>

<jsp:include page="/template/header.jsp"></jsp:include>

<h2>접종일자 : <%=shot%></h2>


<form method="post">

달력: <input type="text" id="datepicker1" name="shot" readonly>

<input type="submit">

</form>



<jsp:include page="/template/footer.jsp"></jsp:include>


