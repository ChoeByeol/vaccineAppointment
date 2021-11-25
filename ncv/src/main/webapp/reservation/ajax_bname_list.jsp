<%@page import="java.util.List"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String clinicSido = request.getParameter("clinicSido");
String clinicSigungu = request.getParameter("clinicSigungu");
ClinicDao clinicDao = new ClinicDao();
List<String> bnameList = clinicDao.bnameList(clinicSido, clinicSigungu);

	//out.println("<select name=\"clinicBname\" id=\"bname\">");
	out.println("<option value=\"\">읍면동</option>");
	for(String bname : bnameList){
		out.println("<option value='"+bname+"'>"+bname+"</option>");
	}
	//out.println("</select>");
%>
