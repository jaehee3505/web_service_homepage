<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "user.User" %>
 <%@ page import = "user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String UserNick = null;
if(session.getAttribute("UserNick") !=  null){
	UserNick = (String) session.getAttribute("UserNick");
}
if(UserNick == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}

User user = new UserDAO().getUser(UserNick);

if(!UserNick.equals(user.getNickname())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'userCheck.jsp'");
	script.println("</script>");	
}

else{
if(request.getParameter("name") == null || request.getParameter("nickname") == null  || request.getParameter("email") == null || request.getParameter("phone") == null  || request.getParameter("gender") == null  || request.getParameter("sns") == null  ||  request.getParameter("sms") == null  ||
request.getParameter("name").equals("") || request.getParameter("nickname").equals("") || request.getParameter("email").equals("") || request.getParameter("phone").equals("") || request.getParameter("gender").equals("")||request.getParameter("sns").equals("")|| request.getParameter("sms").equals("")){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안된 사항이 있습니다.')");
	script.println(" 'history.back()'");
	script.println("</script>");
}
else{
	UserDAO userDAO = new UserDAO();
	int result = userDAO.user_update(UserNick, request.getParameter("name"), request.getParameter("nickname"), request.getParameter("email"), request.getParameter("phone"), request.getParameter("gender"), request.getParameter("sns"), request.getParameter("sms"));
	
	session.removeAttribute("UserNick");
	session.setAttribute("UserNick",request.getParameter("nickname"));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 수정에 실패했습니다.')");
		script.println(" 'history.back()'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'userCheck.jsp'");
		script.println("</script>");
	}
}
}
%>
</body>
</html>