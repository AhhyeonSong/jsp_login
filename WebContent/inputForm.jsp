<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/view/color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function checkIt(){
		var userinput=eval("document.userinput");
		if(!userinput.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}if(!userinput.passwd.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if(userinput.passwd.value!=userinput.passwd2.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		if(!userinput.name.value){
			alert("사용자 이름을 입력하세요");
			return false;
		}
		if(!userinput.jumin1.value || !userinput.jumin2.value){
			alert("주민번호를 입력하세요");
			return false;
		}
	}


	function openConfirmid(userinput){
		if(userinput.id.value==""){
			alert("아이디를 입력하세요");
			userinput.id.focus();
			return;
		}
		url="confirmId.jsp?id="+userinput.id.value;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
</script>

</head>
<body bgcolor="<%= bodyback_c %>">
<form method="post" action="inputProc.jsp" name="userinput" onSubmit="return checkIt()">
<table width=630 border=1 cellspacing=0 cellpadding=3 align=center>
<tr>
	<td colspan=2  align="center" height=39 bgcolor="<%= value_c%>">
		<font size="+1"><b>회원가입</b></font>
	</td>
</tr>
<tr>
<td  align="right" colspan=2 bgcolor="<%= value_c%>" ><span style="font-size:8pt;"><font color=red>*</font>는 필수 입력사항 입니다</span></td>
</tr>
<tr>
	<td  width=230 bgcolor="<%= value_c%>"><b>아이디 입력</b></td>
	<td  width=400 bgcolor="<%= value_c%>"></td>
</tr>

<tr>
	<td  width=230><font color=red>*</font>사용자 ID</td>
	<td  width=400>
		<input type="text" name="id" size=10 maxlength=10>
		<input type="button"  name="comfirm_id" value="중복확인" onclick="openConfirmid(this.form)">
	</td>
</tr>
<tr>
	<td  width=230><font color=red>*</font>비밀번호</td>
	<td  width=400>
		<input type="password" name="passwd" size=15 maxlength=12>
	</td>
</tr>
<tr>
	<td  width=230><font color=red>*</font>비밀번호 확인</td>
	<td  width=400>
		<input type="password" name="passwd2" size=15 maxlength=12>
	</td>
</tr>
<tr>
	<td  width=230 bgcolor="<%= value_c%>"><b>개인정보 입력</b></td>
	<td  width=400 bgcolor="<%= value_c%>"></td>
</tr>
<tr>
	<td  width=230><font color=red>*</font>사용자 이름</td>
	<td  width=400>
		<input type="text" name="name" size=15 maxlength=10 >
	</td>
</tr>
<tr>
	<td  width=230><font color=red>*</font>주민등록번호</td>
	<td  width=400>
		<input type="text" name="jumin1" size=7 maxlength=6 >
		-
		<input type="password" name="jumin2" size=7 maxlength=7 >
	</td>
</tr>
<tr>
	<td  width=230>E-mail</td>
	<td  width=400>
		<input type="text" name="email" size=40 maxlength=30>
	</td>
</tr>
<tr>
	<td  width=230>Blog</td>
	<td  width=400>
		<input type="text" name="blog" size=60 maxlength=50>
	</td>
</tr>
<tr>
	<td colspan=2 align=center bgcolor="<%= value_c%>">
		<input type="submit" name="confirm" value="회원가입">
		<input type="reset" name="reset" value="다시입력">
		<input type="button" value="가입안함" onclick="javascript:window.locaion='main.jsp'">
	</td>
</tr>



</table>

</form>
</body>
</html>
























