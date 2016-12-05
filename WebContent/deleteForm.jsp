<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="/view/color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="myform" method="post" action="deleteProc.jsp">
<table width=260 cellpadding=1 cellspacing=1 align=center border=1>
<tr height=30>
		<td colspan=2 align=middle bgcolor="<%=title_c %>"><font size="+1"><b>회원탈퇴</b></font></td>
		
</tr>
<tr>
		<td width=110 bgcolor="<%=title_c%>" align=center>비밀번호</td>
		<td width=150 align=center>
			<input type="password" name="passwd" size=15 maxlength=12>
		</td>
</tr>
<tr>
		<td colspan=2 bgcolor="<%=value_c %>" align=middle>
			<input type="submit" value="회원탈퇴">
			<input type="button" value="탈퇴취소" onClick="javascript:window.location='main.jsp'">
		</td>
</tr>
</table>


</form>


</body>
</html>




















