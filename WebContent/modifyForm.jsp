<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/view/color.jsp" %>
    <%@ page import="mirim.hs.kr.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function checkIt(){
		var userinput=eval("document.userinput");
		
		if(!userinput.passwd.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(!userinput.name.value){
			alert("사용자 이름을 입력하세요");
			return false;
		}
	}
</script>

</head>
<%
		String id=(String)session.getAttribute("mirim");
		LogonDBBean manager=LogonDBBean.getInstance();
		LogonDataBean c=manager.getMember(id);
%>
<body bgcolor="<%= bodyback_c %>">
<form method="post" action="modifyProc.jsp" name="userinput" onSubmit="return checkIt()">
<table width=600 border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td colspan=2 height=39 align=center bgcolor="<%= value_c%>">
		<font size="+1"><b>회원정보수정</b></font>
	</td>
</tr>
<tr>
	<td colspan=2 class="nomal" align="center" >
		회원정보를 수정합니다.
	</td>
</tr>
<tr>
	<td  width=200 bgcolor="<%= value_c%>"><b>아이디 입력</b></td>
	<td  width=400 bgcolor="<%= value_c%>"></td>
</tr>

<tr>
	<td  width=200>사용자 ID</td>
	<td  width=400><%=c.getId() %>
	</td>
</tr>
<tr>
	<td  width=200>비밀번호</td>
	<td  width=400>
		<input type="password" name="passwd" size=15 maxlength=12 value="<%=c.getPasswd() %>">
	</td>
</tr>
<tr>
	<td  width=200 bgcolor="<%= value_c%>"><b>개인정보 입력</b></td>
	<td  width=400 bgcolor="<%= value_c%>"></td>
</tr>
<tr>
	<td  width=200>사용자 이름</td>
	<td  width=400>
		<input type="text" name="name" size=15 maxlength=10 value="<%=c.getName()%>">
	</td>
</tr>
<tr>
	<td  width=200>주민등록번호</td>
	<td  width=400>
	<%=c.getJumin1() %>-<%=c.getJumin2() %>
	</td>
</tr>
<tr>
	<td  width=200>E-mail</td>
	<td  width=400>
		<%
				if(c.getEmail()==null){%>
					<input type="text" name="email" size=40 maxlength=30>			
		<%}else{%>
					<input type="text" name="email" size=40 maxlength=30 value="<%=c.getEmail() %>">
			<% 	}
		%>
		
	</td>
</tr>
<tr>
	<td  width=200>Blog</td>
	<td  width=400>
	<%
		if(c.getBlog()==null){%>
			<input type="text" name="blog" size=60 maxlength=50>
		<% }
		else{%>
			<input type="text" name="blog" size=60 maxlength=50 value="<%=c.getBlog()%>">
		<% }
	
	%>
		
	</td>
</tr>
<tr>
	<td colspan=2 align=center bgcolor="<%= value_c%>">
		<input type="submit" name="modify" value="수정">
		<input type="button" value="취소" onclick="window.location='main.jsp'">
	</td>
</tr>



</table>

</form>
</body>
</html>









