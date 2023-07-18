<%@page import="java.beans.Encoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램 / 투표하기</title>
</head>
<style>
 #vote td,#vote th{
 	text-align:left;
 }
</style>
<body>
<jsp:include page="header.jsp"/>
<section>
<h2>투표하기</h2>
<form action="action.jsp" name="vote" id="vote">
	<table border="1">
	<tr>
		<td>주민번호</td>
		<td><input type="number" name="v_jumin"/> 예 : 8906153154726</td>
	</tr>
	<tr>
		<td>성명</td>
		<td><input type="text" name="v_name"/></td>
	</tr>
	<tr>
		<td>투표번호</td>
		<td><select name="v_no">
			<option value="1">[1] 김후보</option>
			<option value="2">[2] 이후보</option>
			<option value="3">[3] 박후보</option>
			<option value="4">[4] 조후보</option>
			<option value="5">[5] 최후보</option>
		</select></td>
	</tr>
	<tr>
		<td>투표시간</td>
		<td><input type="number" name="v_time"/></td>
	</tr>
	<tr>
		<td>투표장소</td>
		<td><input type="text" name="v_area"/></td>
	</tr>
	<tr>
		<td>유권자 확인</td>
		<td><label><input type="radio" name="v_confirm" value="Y"/>확인</label> <label><input type="radio" name="v_confirm" value="N"/>미확인</label></td>
	</tr>
	<tr>
		<td style="text-align:center;" colspan="2"><input type="submit" value="투표하기" onclick="check_form(); return false;"><input type="reset" value="다시하기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!'); document.vote.v_jumin.focus();"/></td>
	</tr>
	</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	function check_form(){
	if(document.vote.v_jumin.value==""){
		alert('주민번호가 입력되지 않았습니다!');
		document.vote.v_jumin.focus();
		return false;
	}else if(document.vote.v_name.value==""){
		alert('성명이 입력되지 않았습니다!');
		document.vote.v_name.focus();
		return false;
	}else if(document.vote.v_no.value==""){
		alert('후보번호가 선택되지 않았습니다!');
		document.vote.v_no.focus();
		return false;
	}else if(document.vote.v_time.value==""){
		alert('투표시간이 입력되지 않았습니다!');
		document.vote.v_time.focus();
		return false;
	}else if(document.vote.v_area.value==""){
		alert('투표장소가 입력되지 않았습니다!');
		document.vote.v_area.focus();
		return false;
	}else if(document.vote.v_confirm.value==""){
		alert('유권자확인이 선택되지 않았습니다!');
		document.vote.v_confirm.focus();
		return false;
	}else{
		vote.submit();
	}
	}
</script>
</body>
</html>