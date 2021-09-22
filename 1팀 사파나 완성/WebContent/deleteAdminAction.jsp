	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
        <%@ page import="user.User" %>
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
int userNum = 0;
if(request.getParameter("usernum") != null){
	userNum =  Integer.parseInt(request.getParameter("usernum"));
}

System.out.print("hello");
	UserDAO userDAO = new UserDAO();
	int result = userDAO.admin_delete(userNum);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.')");
		script.println(" 'history.back()'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'admin.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>