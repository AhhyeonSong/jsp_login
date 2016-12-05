<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
     <%@ include file = "/view/color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<% request.setCharacterEncoding("utf-8"); 
		String name=request.getParameter("name");
		String jumin1=request.getParameter("jumin1");
		String jumin2=request.getParameter("jumin2");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		String check =manager.findId(name, jumin1, jumin2);
		
%>			

	<form name="myform" method="post" action="findPwProc.jsp">
		<table width=400 cellpadding=1 cellspacing=1 align=center border=1>
			<tr height=30>
				<td colspan=2 align=middle bgcolor="<%=title_c %>"><h2
						style="font-family: 배달의민족 주아">
						<font color="#FFFFFF"> <b>비밀번호 찾기</b></font>
					</h2></td>
			</tr>
			<tr>
				<td width=110 bgcolor="<%=title_c%>" align=center>아이디</td>
				<td width=290 align=center><input type="text" name="id"
					size=10 maxlength=15></td>
			</tr>
			<tr>
				<td width=110 bgcolor="<%=title_c%>" align=center>주민등록번호</td>
				<td width=290 align=center><input type="text" name="jumin1"
					size=7 maxlength=6>- <input type="password" name="jumin2"
					size=7 maxlength=7></td>
			</tr>
			<tr>
				<td colspan=2 bgcolor="<%=value_c %>" align=middle><input
					type="submit" value="찾기"></td>
			</tr>
		</table>


	</form>


</body>
</html>