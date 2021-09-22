	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="regularcomment.RegularCommentDAO" %>
        <%@ page import="regularcomment.RegularComment" %>
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
if((UserNick == null) & (UserNick !="admin") ){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
} else {
	String commentContent =  request.getParameter("commentContent");
	int bbsID = Integer.parseInt(request.getParameter("bbsID"));
	
	RegularCommentDAO commentDAO = new RegularCommentDAO();
	int result = commentDAO.write(bbsID,UserNick,commentContent);
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
	script.println("location.href = 'regularbbs.jsp'");
	script.println("</script>");

	
	}
}
%>
</body>
</html>