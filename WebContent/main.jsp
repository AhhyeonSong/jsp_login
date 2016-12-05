<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file = "/view/color.jsp" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
<%
		try{
			if(session.getAttribute("mirim")==null){//회원 아님%>
			<script>
				function focusIt(){
					document.inform.id.focus();
				}
				function checkIt(){
					inputForm=eval("document.inform");
					if(!inputForm.id.value){
						alert("아이디를 입력하세요...");
						inputForm.id.focus();
						return false;
					}
					if(!inputForm.passwd.value){
						alert("비밀번호를 입력하세요...");
						inputForm.passwd.focus();
						return false;
					}
				}
			</script> 
	</head>
				<body onLoad="focusIt()" bgcolor="<%=bodyback_c%>">
						<table width=500 cellpadding=0 cellspacing=0 align=center border=1>
								<form name="inform" method="post" action="loginProc.jsp" onSubmit="return checkIt()">
										<tr>
											<td width=300 bgcolor="<%= bodyback_c%>" height=20>&nbsp</td>
											<td bgcolor="<%= title_c %>"  width=100 align="center">아이디</td>
											<td width="100" bgcolor="<%= value_c%>" ><input type="text" name="id" size=15 maxlength=10></td>
										</tr>
										<tr>
											<td rowspan=2 align="center" bgcolor="<%=bodyback_c %>" width=300><a href='deli.jsp'>맛집탐방</a></td>
											<td bgcolor="<%=title_c %>" width=100 align="center">패스워드</td>
											<td width="100" bgcolor="<%=value_c %>"  >
												<input type="password" name="passwd" size=15 maxlength=10>
											</td>
										</tr>
										<tr>
											<td colspan=2 bgcolor="<%= title_c %>" align="center">
												<input type="submit" name="submit" value="로그인">
												<input type="button"  value="회원가입" onclick="javascript:window.location='inputForm.jsp'">  </td>
										</tr>
								</form>
						</table>
				</body>
	<% 		}
			else{//회원 아님%>
				<table width=500 cellpadding="0" align="center" border=1>
						<tr>
							<td width=300 bgcolor="<%= back_c %>" height=20>하하하</td>
							<td rowspan="3" bgcolor="<%= value_c%>" align="center">
							<%= session.getAttribute("mirim") %> 님이 <br> 방문하셨습니다.
							<form method="post" action="logout.jsp">
									<input type="submit"  value="로그아웃">
									<input type="button"  value="정보수정" onclick="javascript:window.location='modify.jsp'">
							</form>
						</tr>
						<tr>
								<td rowspan=2 align="center" bgcolor="<%=bodyback_c %>" width=300><a href='deli.jsp'>맛집탐방</a></td>
						</tr>
				</table>
				<br>
	<%		} 
			
	 	}
		catch(Exception e){
			e.printStackTrace();
		} 	
%>



