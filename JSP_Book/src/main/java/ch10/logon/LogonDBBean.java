package ch10.logon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private LogonDBBean() {}
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}
	
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		
		SHA256 sha = SHA256.getInstance();
		try {
			conn = getConnection();
			
			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());
			
			pstmt = conn.prepareStatement(
					"select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String dbpasswd = rs.getString("passwd");
				if(BCrypt.chechpw(shaPass, dbpasswd)) {
					x = 1;
					else
					x = 0;
				}else
					x = -1;
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException ex){}
					if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
					if(conn !=null) try{conn.close();}catch()SQLException ex{}
				}
				return x;
			}
		}
	}
}
