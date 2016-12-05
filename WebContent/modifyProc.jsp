<%@page import="mirim.hs.kr.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/view/color.jsp" %>
      <%	request.setCharacterEncoding("utf-8"); %>
      <jsp:useBean id="member" class="mirim.hs.kr.LogonDataBean">
      <jsp:setProperty name="member" property="*"/>
      </jsp:useBean>
      
      <%
      		String id=(String)session.getAttribute("mirim");
      		member.setId(id);
      		
      		LogonDBBean manager=LogonDBBean.getInstance();
      		manager.updateMember(member);
      %>
      
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
				<body bgcolor="<%=bodyback_c %>">
				<form name="userinput" method="post" action="main.jsp">
				<table width=270 cellpadding=5 cellspacing=0 align=center border=0>
				<tr bgcolor="<%=title_c %>">
					<td height=39 align=center>
						<font size="+1"><b>회원정보가 수정되었습니다.</b></font>
					</td>
				</tr>
				<tr>
					<td align=center bgcolor="<%=value_c%>">
					<form> 
					<input type="button" value="메인으로" onclick="window.location='main.jsp'">
					</form>
					5초후에 메인으로 이동합니다.
						<meta http-equiv="Refresh" content="5;url=main.jsp">
					</td>
				</tr>
				</table>
				</form>
</body>
</html>