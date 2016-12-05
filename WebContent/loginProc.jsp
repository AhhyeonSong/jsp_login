<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="mirim.hs.kr.*"%>
<%@ page import ="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); 
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		LogonDBBean manager = LogonDBBean.getInstance();
		int check =manager.userCheck(id, passwd);
	
		
		if(check==1){
			session.setAttribute("mirim",id);
			response.sendRedirect("main.jsp");
		}
		else if(check==0){%>
			<script>
				alert("비밀번호를 확인하세요..");
				history.go(-1);
			</script>
<%	}
		else if(check==-1){ %>
			<script>
				alert("회원가입을 해주세요..");
				location.href='inputForm.jsp';
			</script>
<%	}
%>
