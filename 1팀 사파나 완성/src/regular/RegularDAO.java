package regular;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RegularDAO {

	private Connection conn;
	private ResultSet rs;
	
	public RegularDAO() {
		
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM REGULAR ORDER BY bbsID DESC";
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
	
	public int write(String userNick, String bbsTitle, String bbsContent,String bbsURL, String bbsRealURL ) {
		String SQL = "INSERT INTO REGULAR VALUES(?,?,?,?,?,?,?,?,0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,bbsTitle);
			pstmt.setString(3,userNick);
			pstmt.setString(4,getDate());
			pstmt.setString(5,bbsContent);
			pstmt.setInt(6,1);
			pstmt.setString(7,bbsURL);
			pstmt.setString(8,bbsRealURL);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Regular> getList(int pageNumber){
		String SQL = "SELECT * FROM REGULAR WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Regular> list = new ArrayList<Regular>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Regular bbs = new Regular();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsURL(rs.getString(7));
				bbs.setBbsRealURL(rs.getString(8));
				bbs.setBbsHit(rs.getInt(9));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public boolean nextPage(int pageNumber) {
		
		String SQL = "SELECT * FROM REGULAR WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
					return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Regular getBbs(int bbsID) {
		String SQL = "SELECT * FROM REGULAR WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Regular bbs = new Regular();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsURL(rs.getString(7));
				bbs.setBbsRealURL(rs.getString(8));
				bbs.setBbsHit(rs.getInt(9));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	
	public int update(int bbsID,String bbsTitle, String bbsContent,String bbsURL) {
		
		String SQL = "UPDATE REGULAR SET bbsTitle = ?, bbsContent = ?, bbsURL =? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,bbsTitle);
			pstmt.setString(2,bbsContent);
			pstmt.setString(3,bbsURL);
			pstmt.setInt(4,bbsID);
			return pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int bbsID) {	
		String SQL = "UPDATE REGULAR SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,bbsID);
		
			return pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int hit(int bbsID) {
		String SQL = "UPDATE REGULAR SET bbsHit = bbsHit + 1 WHERE bbsID = ?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1,bbsID);
		return pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
 }
}