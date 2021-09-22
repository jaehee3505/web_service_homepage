package regularcomment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import regularcomment.RegularCommentDAO;

public class RegularCommentDAO {

	private Connection conn;
	private ResultSet rs;
	
	public RegularCommentDAO() {
		
		try {
			
			String dbURL = "jdbc:mysql://localhost:3306/bbd_test";
			String dbID ="root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int write(int bbsID, String nickname, String commentContent) {
		String SQL = "INSERT INTO REGULARCOMMENT VALUES(?,?,?,1,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsID);
			pstmt.setString(2,nickname);
			pstmt.setString(3,commentContent);
			pstmt.setInt(4,getNext());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public RegularComment getUser(int commentID) {
		String SQL = "SELECT * FROM REGULARCOMMENT WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RegularComment comment = new RegularComment();
				comment.setBbsID(rs.getInt(1));
				comment.setNickname(rs.getString(2));
				comment.setCommentContent(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentID(rs.getInt(5));
			
				return comment;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	
	
	public ArrayList<RegularComment> getList(int bbsID){
		String SQL = "SELECT * FROM REGULARCOMMENT WHERE bbsID = ? AND commentAvailable = 1";
		ArrayList<RegularComment> list = new ArrayList<RegularComment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RegularComment comment = new RegularComment();
				comment.setBbsID(rs.getInt(1));
				comment.setNickname(rs.getString(2));
				comment.setCommentContent(rs.getString(3));
				comment.setCommentAvailable(rs.getInt(4));
				comment.setCommentID(rs.getInt(5));
			
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public int getNext() {
		String SQL = "SELECT commentID FROM REGULARCOMMENT ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;  //현재가 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int commentID) {
		
		String SQL = "UPDATE REGULARCOMMENT SET commentAvailable = 0 WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,commentID);
		
			return pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
		

}
