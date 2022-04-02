<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<% String id =  (String)request.getAttribute("res"); 
	//	String id2 =  (String)request.getAttribute("id2"); 
	
		if(id != null){%>
		{
			"flag" : "<%=id %>님 가입 성공!!"
		}
			
<% 		}else{ 		%>
		{
			"flag" : "Sorry~~ 가입 실패!!"			
		}
<%		}  			%>
