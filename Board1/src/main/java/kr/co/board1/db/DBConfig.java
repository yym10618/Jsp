package kr.co.board1.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// ΩÃ±€≈Ê ∞¥√º
	private static DBConfig instance = new DBConfig();
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	private DBConfig() {}
	
	private final String HOST = "jdbc:mysql://192.168.56.102:3306/yym10618";
	private final String USER = "root";
	private final String PASS = "12345";
	
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
