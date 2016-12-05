<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/view/color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 창</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function begin(){
		document.myform.id.focus();
	}
	function checkIt(){
		if(!document.myform.id.value){
			alert("아이디를 입력하세요..");
			document.myform.id.focus();
			return false;
		}
		if(!document.myform.passwd.value){
			alert("비밀번호를 입력하세요..");
			document.myform.passwd.focus();
			return false;
		}
	}

</script>
</head>
<body onLoad="begin()" bgcolor="<%= bodyback_c%>">
<h1 style="font-family:배달의민족 주아"><font color="<%=value_c %>" ><p align="center">아현이의 맛집탐방</p></font></h1>
<h2 style="font-family:나눔손글씨 붓"><font color="#39AFFF" ><p align="center">사용을 원하시면 하단의 로그인 창을 이용해 주세요</p></font></h2>
<h2 style="font-family:배달의민족 주아"><font color="#39AFFF" ><p align="center">↓ ↓ ↓ ↓</p></font></h2>
<form name="myform" method="post" action="loginProc.jsp" onSubmit="return checkIt()">
<table width=260 cellpadding=1 cellspacing=1 align="center" border=1>
<tr height="30">
	<td colspan=2 align="middle" bgcolor="<%=title_c%>"><strong>회원 로그인</strong></td>
</tr>
<tr height="30">
	<td width=110 bgcolor="<%=title_c%>" align="center">아이디 </td>
	<td width=150 bgcolor="<%=value_c%>" align="center">
			<input type="text" name="id" size=15 maxlength=12>
	</td>
</tr>
<tr height="30">
	<td width=110 bgcolor="<%=title_c%>" align="center">비밀번호 </td>
	<td width=150 bgcolor="<%=value_c%>" align="center">
			<input type="password" name="passwd" size=15 maxlength=12>
	</td>
</tr>
<tr height="30">
	<td colspan=2 bgcolor="<%=title_c%>" align=center>
			<input type="submit" value="로그인">
			<input type="reset" value="다시입력">
			<input type="button"  value="회원가입" onclick="javascript:window.location='inputForm.jsp'"> 
	</td>
</tr>
</table>
<p align="center"><a href="findId.jsp">아이디 찾기</a>	|		<a href="findPw.jsp">비밀번호 찾기</a></p>
</form>

</body>
</html>