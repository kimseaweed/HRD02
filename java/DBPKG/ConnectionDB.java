package HRD02.DBPKG;

import java.sql.*;


public class ConnectionDB {
	
		public static Connection getConnection() throws Exception{
				Class.forName("org.gjt.mm.mysql.Driver");
				return DriverManager.getConnection("jdbc:mysql://localhost:포트번호/db이름","아이디","비밀번호");
		}
		
		public static void closeAll(Connection conn,java.sql.PreparedStatement pstmt,ResultSet rs) throws Exception {
			if(conn!=null) {conn.close();}
			if(pstmt!=null) {pstmt.close();}
			if(rs!=null) {rs.close();}
		}
}
