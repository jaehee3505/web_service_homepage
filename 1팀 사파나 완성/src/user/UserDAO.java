package user;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

public class UserDAO{
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/bbd_test";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		
		String SQL = "SELECT passwd FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) 
						return 1;
					else
						return 0;
			}
			return -1;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,?,?,'bronze','1',?,'0')";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPasswd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getGender());
			pstmt.setString(7, user.getSns());
			pstmt.setString(8, user.getSms());
			pstmt.setString(9, user.getNickname());
			pstmt.setInt(10,getNext());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public User getUser(String NickName) {
		String SQL = "SELECT * FROM USER WHERE nickname = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, NickName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getString(1));
				user.setPasswd(rs.getString(2));
				user.setName(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setPhone(rs.getString(5));
				user.setGender(rs.getString(6));
				user.setSns(rs.getString(7));
				user.setSms(rs.getString(8));
				user.setNickname(rs.getString(9));
				user.setRank(rs.getString(10));
				user.setAuthority(rs.getString(11));
				user.setUsernum(rs.getInt(12));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	
public int user_update(String UserNick,String name, String nickname, String email, String phone, String gender, String sns, String sms) {
		
		String SQL = "UPDATE USER SET name = ?, nickname = ?, email = ?, phone = ?, gender = ?, sns = ?, sms = ? WHERE nickname = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,name);
			pstmt.setString(2,nickname);
			pstmt.setString(3,email);
			pstmt.setString(4,phone);
			pstmt.setString(5,gender);
			pstmt.setString(6,sns);
			pstmt.setString(7,sms);
			pstmt.setString(8,UserNick);
		
			return pstmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

public int user_delete(String UserNick) {
	
	String SQL = "DELETE FROM USER WHERE nickname = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,UserNick);
	
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public ArrayList<User> getList(int pageNumber){
	String SQL = "SELECT * FROM USER WHERE usernum < ?  ORDER BY usernum DESC LIMIT 10";
	ArrayList<User> list = new ArrayList<User>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1,getNext() - (pageNumber - 1) * 10);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			User user = new User();
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setPhone(rs.getString(5));
			user.setGender(rs.getString(6));
			user.setSns(rs.getString(7));
			user.setSms(rs.getString(8));
			user.setNickname(rs.getString(9));
			user.setRank(rs.getString(10));
			user.setAuthority(rs.getString(11));
			user.setUsernum(rs.getInt(12));
			list.add(user);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}


public int getNext() {
	String SQL = "SELECT usernum FROM USER ORDER BY usernum DESC";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1) + 1;
		}
		return 1;
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}


public boolean nextPage(int pageNumber) {
	
	String SQL = "SELECT * FROM USER WHERE usernum < ? ORDER BY usernum DESC LIMIT 10";
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


public User getUser(int usernum) {
	String SQL = "SELECT * FROM USER WHERE usernum = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, usernum);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			User user = new User();
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setPhone(rs.getString(5));
			user.setGender(rs.getString(6));
			user.setSns(rs.getString(7));
			user.setSms(rs.getString(8));
			user.setNickname(rs.getString(9));
			user.setRank(rs.getString(10));
			user.setAuthority(rs.getString(11));
			user.setUsernum(rs.getInt(12));
			return user;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;	
}

public User getUserNick(String usernick) {
	String SQL = "SELECT * FROM USER WHERE nickname = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, usernick);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			User user = new User();
			user.setId(rs.getString(1));
			user.setPasswd(rs.getString(2));
			user.setName(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setPhone(rs.getString(5));
			user.setGender(rs.getString(6));
			user.setSns(rs.getString(7));
			user.setSms(rs.getString(8));
			user.setNickname(rs.getString(9));
			user.setRank(rs.getString(10));
			user.setAuthority(rs.getString(11));
			user.setUsernum(rs.getInt(12));
			user.setBbscount(rs.getInt(13));
			return user;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;	
}


public int admin_update(int usernum,String userId, String userPasswd,String userName,String userEmail, String userPhone, String userGender, String userSns, String userSms, String userNickname, String userRank, String userAuthority) {
	
	String SQL = "UPDATE USER SET id = ?, passwd = ?, name =?, email =?, phone =?, gender =?, sns =?, sms =?, nickname =?, rank =?, authority=? WHERE usernum = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,userId);
		pstmt.setString(2,userPasswd);
		pstmt.setString(3,userName);
		pstmt.setString(4,userEmail);
		pstmt.setString(5,userPhone);
		pstmt.setString(6,userGender);
		pstmt.setString(7,userSns);
		pstmt.setString(8,userSms);
		pstmt.setString(9,userNickname);
		pstmt.setString(10,userRank);
		pstmt.setString(11,userAuthority);
		pstmt.setInt(12,usernum);
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public int admin_delete(int usernum) {
	
	String SQL = "DELETE FROM USER WHERE usernum = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1,usernum);
	
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public int bbsCount(String usernick) {
	
	String SQL = "UPDATE USER SET bbscount = bbscount + 1 WHERE nickname = ?";
	try {
	PreparedStatement pstmt = conn.prepareStatement(SQL);
	pstmt.setString(1,usernick);
	return pstmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
}
return -1;
}

public int rankUpdate(String userNickname, String userRank, String userAuthority) {
	
	String SQL = "UPDATE user SET rank = ?, authority = ? WHERE nickname = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,userRank);
		pstmt.setString(2,userAuthority);
		pstmt.setString(3,userNickname);

		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

}
