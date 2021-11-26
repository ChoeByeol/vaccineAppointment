<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String clinicSido = request.getParameter("clinicSido");
	ClinicDao clinicDao = new ClinicDao();
	List<String> sigunguList = clinicDao.sigunguList(clinicSido);

	//out.println("<select name=\"clinicSigungu\" id=\"sigungu\">");
	out.println("<option value=\"\">시군구</option>");
	for(String sigungu : sigunguList){
		out.println("<option value='"+sigungu+"'>"+sigungu+"</option>");
	}
	//out.println("</select>");
%>