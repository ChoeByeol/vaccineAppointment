package ncv.beans;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtils {
		
		//연결 생성(1) : 직접 연결을 수행하는 방법
		//- 다수의 사용자가 몰릴 경우 연결 생성 시간이 과다하여 부하로 인한 오류가 발생
		public static Connection connect(String username, String password) throws Exception{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",username,password);

			return con;		
		}

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
