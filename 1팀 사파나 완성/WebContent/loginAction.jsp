<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="user" class="user.User" scope="page" />
    <jsp:setProperty name="user" property="id" />
    <jsp:setProperty name="user" property="passwd" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 세션: nickname, rank, authority -->
<%! 
	UserDAO userDAO = new UserDAO();
	int result;
	String rid;
	String link;
%>

<%
 link = (String)request.getHeader("REFERER")!=null? (String)request.getHeader("REFERER") : "http://localhost:8080";
	 result = userDAO.login(user.getId(), user.getPasswd());
	if (result == 1){
		rid = user.getId();
	}
	else if (result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다. ')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다. ')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>

<jsp:include page="sessionAction.jsp">
	<jsp:param value= "<%=result%>" name= "CHECK"/>
	<jsp:param value= "<%=rid%>" name= "USERID"/>
	<jsp:param value= "<%=link %>" name="URL"/>

</jsp:include>
</body>
</html>