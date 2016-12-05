<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
             <%@ include file = "/view/color.jsp" %>
<%@ page import ="mirim.hs.kr.*"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>

</script>
<% request.setCharacterEncoding("utf-8"); 
		String name=request.getParameter("name");
		String jumin1=request.getParameter("jumin1");
		String jumin2=request.getParameter("jumin2");
		
		LogonDBBean manager = LogonDBBean.getInstance();
		String check =manager.findId(name, jumin1, jumin2);
		
			
		//out.println(check);
		
		if(check==null || check=="") { %>
			<script>
				alert("찾고자 하는 아이디가 없습니다.");
				history.go(-1);
			</script>
<% 		}
		else {%>
					찾는 아이디 : <%=check %>
	<%}
		
		
%>
