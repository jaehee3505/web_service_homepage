	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="bbs.BbsDAO" %>
        <%@ page import="bbs.Bbs" %>
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
}
int bbsID = 0;
if(request.getParameter("bbsID") != null){
	bbsID =  Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글 입니다.')");
	script.println("location.href = 'normalbbs.jsp'");
	script.println("</script>");
}

Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!UserNick.equals(bbs.getUserID()) && !UserNick.equals("admin")){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'normalbbs.jsp'");
	script.println("</script>");	
}
else{
	BbsDAO bbsDAO = new BbsDAO();
	int result = bbsDAO.delete(bbsID);
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
		script.println("location.href = 'normalbbs.jsp'");
		script.println("</script>");
	}
}
%>
</body>
</html>