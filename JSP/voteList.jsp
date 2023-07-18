<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="HRD02.DBPKG.*,HRD02.DTO.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 / 투표검수조회</title>
</head>
<body>
<% List<VoteDTO> list = new Dao().getVote(); %>
<jsp:include page="header.jsp"/>
<section>
	<h2>투표검수조회</h2>
	<table border="1">
	<thead>
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
	</thead>
	<tbody>
	<%for(VoteDTO vote : list){%>
		<tr>
			<td><%=vote.getV_name()%></td>
			<td><%=vote.getV_birth()%></td>
			<td><%=vote.getV_age()%></td>
			<td><%=vote.getV_gender()%></td>
			<td><%=vote.getV_no()%></td>
			<td><%=vote.getV_time()%></td>
			<td><%=vote.getV_confirm()%></td>
		</tr>
	<%} %>
	</tbody>
	</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>