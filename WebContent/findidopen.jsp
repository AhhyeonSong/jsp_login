<%@page import="mirim.hs.kr.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ include file = "/view/color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		LogonDBBean ldb=LogonDBBean.getInstance();
		int check=ldb.confirmId(id);
		out.println(check);
%>
</head>
<body bgcolor="<%= bodyback_c%>">
<%
		if(check==1){ //아이디가 존재%>
			<table width=270 border=0 cellspacing=0 cellpadding=5>
				<tr bgcolor="<%=title_c%>">
						<td height=39><%=id %>는 이미 사용중인 아이디입니다.</td>
				</tr>
			</table>
			<form method="post" action="confirmId.jsp" name="checkForm">
					<table width=270 border=0 cellspacing=0 cellpadding=5>
						<tr>
							<td align=center bgcolor="<%=value_c %>">
								다른 아이디를 선택하세요.
								<input type="text" name="id" size=10 maxlength=12>
								<input type="submit" value="ID중복확인">
							</td>
						</tr>
					</table>
			</form>
<%	}
		else{//아이디가 없음
			//out.println(id+"는 사용할 수 있습니다.");%>
			<table width=270 border=0 cellspacing=0 cellpadding=5>
						<tr bgcolor="<%=title_c %>">
							<td align=center>
								<p>입력하신<%=id %> 아이디는 사용하실수 있습니다.</p>
								<input type="button" value="닫기" onclick="setId()">
							</td>
						</tr>
					</table>
<%		} %>
</body>
</html>
<script>
		function setId(){
			opener.document.usertinput.id.value="<%=id%>";
			self.close();
		}

</script>
