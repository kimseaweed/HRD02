<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="HRD02.DBPKG.*,HRD02.DTO.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 / 후보자등수</title>
</head>
<body>
<% List<RankDTO> list = new Dao().getRank(); %>
<jsp:include page="header.jsp"/>
<section>
	<h2>후보자 등수</h2>
	<table border="1">
		<thead>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
		</thead>
		<tbody>
	<%for(RankDTO vote : list){%>
		<tr>
			<td><%=vote.getM_NO()%></td>
			<td><%=vote.getM_NAME()%></td>
			<td><%=vote.getTot()%></td>
		</tr>
	<%} %>
		</tbody>
	</table>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>