<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
             
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션: nickname, rank, authority -->
<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String rid = request.getParameter("USERID");
	int result = Integer.parseInt(request.getParameter("CHECK"));
	String link = request.getParameter("URL");
	System.out.print(link);
	
	if(result == 1){
		try { //DB연결
			String dbURL = "jdbc:mysql://localhost:3306/bbd_test";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			out.println("session:: 데이터베이스 연결 오류");
			e.printStackTrace();
		}
		String SQL = "SELECT * FROM user WHERE id = ?"; //id탐색
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, rid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				session.setAttribute("UserNick",rs.getString(9));
				session.setAttribute("UserRank",rs.getString(10));
				session.setAttribute("UserAuth",rs.getString(11));
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href =  '"+link+"'");
				script.println("</script>");
			}
		}
		catch(Exception e){
			out.println("session:: sql쿼리문 오류");
			e.printStackTrace();
		}
	}
%>
</body>
</html>