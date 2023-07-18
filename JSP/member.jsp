<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,HRD02.DBPKG.*,HRD02.DTO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 / 후보조회</title>
</head>
<body>
<% List<MemberDTO> memberList = new Dao().getMemeber(); %>
<jsp:include page="header.jsp"/>
<section>
	<h2>후보조회</h2>
	<table border="1">
	<thead>
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
		</tr>
	</thead>
	<tbody>
		<% for(MemberDTO member:memberList){%>
		<tr>
			<td><%=member.getM_no() %></td>
			<td><%=member.getM_name() %></td>
			<td><%=member.getP_code() %></td>
			<td><%=member.getP_school() %></td>
			<td><%=member.getM_jumin()%></td>
			<td><%=member.getM_city() %></td>
			<td><%=member.getP_tel() %></td>
		</tr>
		<% } %>
	</tbody>
	</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>