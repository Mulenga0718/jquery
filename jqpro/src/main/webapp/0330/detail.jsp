<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
	BuyerVO vo = (BuyerVO)request.getAttribute("idDetail");
%>

{

  "id" : "<%=vo.getBuyer_id()%>",
  "name" : "<%=vo.getBuyer_name()%>",
  "lgu" : "<%=vo.getBuyer_lgu()%>",
  "bank" : "<%=vo.getBuyer_bank()%>",
  "bankname" : "<%=vo.getBuyer_bankname()%>",
  "bankno" : "<%=vo.getBuyer_bankno()%>",
  "mail" : "<%=vo.getBuyer_mail()%>",
  "zip" : "<%=vo.getBuyer_zip()%>",
  "add1" : "<%=vo.getBuyer_add1()%>",
  "add2" : "<%=vo.getBuyer_add2()%>"

}