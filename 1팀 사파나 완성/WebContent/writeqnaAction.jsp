<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="qna.QnaDAO" %>
        <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="qna" class="qna.Qna" scope="page" />
    <jsp:setProperty name="qna" property="bbsTitle" />
    <jsp:setProperty name="qna" property="bbsContent" /> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String bbsTitle = request.getParameter("bbsTitle");
String bbsContent = request.getParameter("bbsContent");

String UserNick = null;
if(session.getAttribute("UserNick") !=  null){
	UserNick = (String) session.getAttribute("UserNick");
}
if((UserNick == null) &(UserNick !="admin")){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}else{
if(bbsTitle == null || bbsContent == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안된 사항이 있습니다.')");
	script.println(" 'history.back()'");
	script.println("</script>");
}
else{
	QnaDAO bbsDAO = new QnaDAO();
	UserDAO userDAO = new UserDAO();
	int result = bbsDAO.write(UserNick, bbsTitle, bbsContent);
	int result2 = userDAO.bbsCount(UserNick);
	if(result == -1 || result2 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println(" 'history.back()'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'qnabbs.jsp'");
		script.println("</script>");
	}
}	
}
%>
</body>
</html>