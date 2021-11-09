package kh8semi1.beans;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtils {

	private static DataSource ds;
	
	static {
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} 
		catch (Exception e) {
			System.err.println("DataSource 생성 오류");
			e.printStackTrace();
		}
	}
	
	public static Connection connect() throws Exception{
		return ds.getConnection();
	}
	
}
