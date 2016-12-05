package mirim.hs.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean {
	
	// JSP, DB작업에서 필요한 것을 모아두고 호출
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	public LogonDBBean() { }
	 
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
		
		return ds.getConnection();
	}
	
	public void insertMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getBlog());
			pstmt.setTimestamp(8, member.getReg_date());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
	}
	
	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					x = 1;
				} else {
					 x = 0;
				}
			}
			else { // 해당 아이디가 없음
				x = -1;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)		try { rs.close(); }		catch (Exception e) { }
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		
		return x;
		
	} // userCheck
	
	public int confirmId(String id) throws Exception {	//중복된 아이디가 있냐없냐, 아이디 중복 검색
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // 해당아이디가 존재함, 아이디 중복
				x = 1;
			}
			else {	// 아이디 사용가능
				x = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)		try { rs.close(); }		catch (Exception e) { }
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		
		return x;
	}
	
	public LogonDataBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new LogonDataBean();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setJumin1(rs.getString("jumin1"));
				member.setJumin2(rs.getString("jumin2"));
				member.setEmail(rs.getString("email"));
				member.setBlog(rs.getString("blog"));
				member.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)		try { rs.close(); }		catch (Exception e) { }
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		
		return member;
	}
	
	public void updateMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update member set passwd=?, name=?, email=?, blog=? where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getBlog());
			pstmt.setString(5, member.getId());
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		
	}
	
	public int deleteMember(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select passwd from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpass = rs.getString("passwd");
				if (dbpass.equals(passwd)) {
					
					pstmt=conn.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;
				}
				else {
					x = 0;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)		try { rs.close(); }		catch (Exception e) { }
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		
		return x;
	}
	
	public String findId(String name, String jumin1, String jumin2) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		String x="";
	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from member where name=? and jumin1=? and jumin2=?");
			pstmt.setString(1, name);
			pstmt.setString(2, jumin1);
			pstmt.setString(3, jumin2);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {				
				x = rs.getString("id");						
			} 		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
			if (conn != null)	try { conn.close(); }	catch (Exception e) { }
		}
		return x;
	}
	

public String findPw(String id, String jumin1, String jumin2) throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	String x="";

	try {
		conn = getConnection();
		pstmt = conn.prepareStatement("select passwd from member where id=? and jumin1=? and jumin2=?");
		pstmt.setString(1, id);
		pstmt.setString(2, jumin1);
		pstmt.setString(3, jumin2);
		rs=pstmt.executeQuery();
		
		if (rs.next()) {				
			x = rs.getString("passwd");						
		} 		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)	try { pstmt.close(); }	catch (Exception e) { }
		if (conn != null)	try { conn.close(); }	catch (Exception e) { }
	}
	return x;
}

}