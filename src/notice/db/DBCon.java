package notice.db;

import java.sql.Connection;
import java.sql.DriverManager;

//DB드라이버 로드 / DB연결 하는곳
public class DBCon {
	public static Connection getConnection() throws Exception {
		
		//DB드라이버 로드 / DB연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//접속
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";
		Connection con = DriverManager.getConnection(url, user, pw);
		
		return con;
		
/*		return con;
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/noticeOrcl");
		Connection con = ds.getConnection();//DB의 연결고리를 가져온다
*/		

	}
}
