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
	int commentID = Integer.parseInt( request.getParameter("commentID"));
	int bbsID = Integer.parseInt(request.getParameter("bbsID"));
	
	System.out.print(commentID);
	RegularComment comment = new RegularCommentDAO().getUser(commentID);
	System.out.print(comment.getNickname());
	System.out.print(UserNick);
	
	if(!UserNick.equals(comment.getNickname())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'normalbbs.jsp'");
		script.println("</script>");	
	}
	
	RegularCommentDAO commentDAO = new RegularCommentDAO();
	int result = commentDAO.delete(commentID);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.')");
		script.println(" 'history.back()'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		%>
	<script>
      document.write("location.replace = 'view_normal.jsp?bbsID=")
      document.write("<%=bbsID %>'")
   </script>
		<%
	}
}
%>
</body>
</html>