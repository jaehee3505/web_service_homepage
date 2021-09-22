<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="user" class="user.User" scope="page" />
    <jsp:setProperty name="user" property="id" />
    <jsp:setProperty name="user" property="passwd" />
    <jsp:setProperty name="user" property="name" />
    <jsp:setProperty name="user" property="nickname" />
    <jsp:setProperty name="user" property="email" />
    <jsp:setProperty name="user" property="phone" />
    <jsp:setProperty name="user" property="gender" />
    <jsp:setProperty name="user" property="sns" />
    <jsp:setProperty name="user" property="sms" />
         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
	int result;
	String rid;
%>
<%

	UserDAO userDAO = new UserDAO();
	 result = userDAO.join(user);	
	 rid = user.getId();
	if (result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다. ')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		result = 1;
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
%>
	<jsp:include page="sessionAction.jsp">
	<jsp:param value= "<%=result%>" name= "CHECK"/>
	<jsp:param value= "<%=rid%>" name= "USERID"/>
	</jsp:include>
</body>
</html>