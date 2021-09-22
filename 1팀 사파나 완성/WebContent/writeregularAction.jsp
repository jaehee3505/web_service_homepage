<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="regular.RegularDAO" %>
        <%@ page import="user.UserDAO" %>
         <%@ page import = "user.User" %>
        <%@ page import="file.FileDAO" %>
    <%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
   <%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	String directory = application.getRealPath("/upload/");
int maxSize =  1024 *  1024 *  100;
String encoding = "UTF-8";

MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
String fileName = multipartRequest.getOriginalFileName("file");
String fileRealName = multipartRequest.getFilesystemName("file");
String bbsTitle = multipartRequest.getParameter("bbsTitle");
String bbsContent = multipartRequest.getParameter("bbsTitle");

String UserNick = null;
String UserRank = null;
String UserAuth = null;
if(session.getAttribute("UserNick") !=  null && session.getAttribute("UserRank") !=  null && session.getAttribute("UserAuth") !=  null){
	UserNick = (String) session.getAttribute("UserNick");
	UserRank = (String) session.getAttribute("UserRank");
	UserAuth = (String) session.getAttribute("UserAuth");
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
	User user = new UserDAO().getUser(UserNick);
	RegularDAO bbsDAO = new RegularDAO();
	UserDAO userDAO = new UserDAO();
	int result = bbsDAO.write(UserNick, bbsTitle, bbsContent,fileName,fileRealName);
	int result2 = userDAO.bbsCount(UserNick);
	System.out.print("test1: user.getBbscount()= ");
	System.out.print(user.getBbscount());
	if(result == -1 || result2 == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다.')");
		script.println(" 'history.back()'");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		user = userDAO.getUserNick(UserNick);
		if(UserRank !="silver" && 5 < user.getBbscount() && user.getBbscount() <= 10){
			result = userDAO.rankUpdate(UserNick, "silver", "2");
			if(result == -1){
				script.println("<script>");
				script.println("alert('랭크 업데이트에 실패했습니다.')");
				script.println(" 'history.back()'");
				script.println("</script>");
			}else{
				System.out.print("test:: "+user.getBbscount());
				if(session.getAttribute("UserNick")!=null && user.getBbscount() == 6){
				session.removeAttribute("UserRank");
				session.removeAttribute("UserAuth");
				session.setAttribute("UserRank","silver");
				session.setAttribute("UserAuth","2");
				}
			}
		}else if(UserRank !="gold" && 10 < user.getBbscount()){
			result = userDAO.rankUpdate(UserNick, "gold", "2");
			if(result == -1){
				script.println("<script>");
				script.println("alert('랭크 업데이트에 실패했습니다.')");
				script.println(" 'history.back()'");
				script.println("</script>");
			}else{
				if(session.getAttribute("UserNick")!=null && user.getBbscount() == 11){
					session.removeAttribute("UserRank");
					session.setAttribute("UserRank","gold");
				}
			}
		}
		script.println("<script>");
		script.println("location.href = 'regularbbs.jsp'");
		script.println("</script>");
	}
}	
}
%>
</body>
</html>