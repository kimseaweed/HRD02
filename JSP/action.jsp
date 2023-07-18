<%@page import="java.io.PrintWriter,HRD02.DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
	PrintWriter script = response.getWriter();
int row = new Dao().setVote(
		request.getParameter("v_jumin"),
		request.getParameter("v_name"),
		request.getParameter("v_no"),
		request.getParameter("v_time"),
		request.getParameter("v_area"),
		request.getParameter("v_confirm")
		);


if(row==1){
	script.println("<script>");
	script.println("alert('투표하기 정보가 정상적으로 등록 되었습니다!')");
	script.println("location.href='index.jsp'");
	script.println("</script>");
}else{
	script.println("<script>");
	if(row==0){
		script.println("alert('입력값이 잘못되었습니다.')");	
	}else{		
		script.println("alert('데이터베이스 오류')");
	}
	script.println("history.back()");
	script.println("</script>");
}
%>
</body>
</html>