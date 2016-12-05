<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/view/color.jsp" %>
      <%	request.setCharacterEncoding("utf-8"); %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
		String id=(String)session.getAttribute("mirim");
		String passwd=request.getParameter("passwd");
		
		LogonDBBean dbb=LogonDBBean.getInstance();
		int check=dbb.deleteMember(id, passwd);
		
		if(check==1){//회원 탈퇴
			session.invalidate();
		%>
				<body bgcolor="<%=bodyback_c %>">
				<form name="userinput" method="post" action="main.jsp">
				<table width=270 cellpadding=5 cellspacing=0 align=center border=0>
				<tr bgcolor="<%=title_c %>">
					<td height=39 align=center>
						<font size="+1"><b>회원정보가 삭제되었습니다.</b></font>
					</td>
				</tr>
				<tr bgcolor="<%=value_c %>">
					<td align=center>
						<p>안녕히 가십시요...흐극흑흑ㅠ.ㅠ</p>
						<meta http-equiv="Refresh" content="5;url=main.jsp">
					</td>
				</tr>
				<tr bgcolor="<%=value_c%>">
					<td align=center>
						<input type="submit" value="확인">
				</tr>
				
				</table>
				</form>
		<%}
		else{// 비밀번호 틀림%>
				<script>
					alert("비밀번호가 잘못되었습니다.");
					history.go(-1);
				</script>
 <% 		}
%>

ID : <%=id %>
PW : <%=passwd %>
</body>
</html>