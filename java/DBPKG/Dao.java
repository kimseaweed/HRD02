package HRD02.DBPKG;

import java.sql.*;
import java.util.*;
import HRD02.DBPKG.*;
import HRD02.DTO.*;


public class Dao {	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public List<MemberDTO> getMemeber(){
		List<MemberDTO> list = new ArrayList<>();
		try {
			conn = ConnectionDB.getConnection();
			String sql = "SELECT m.M_NO, m.M_NAME, p.P_name, CASE m.P_SCHOOL  WHEN '1' THEN '고졸' WHEN '2' THEN '학사' WHEN '3' THEN '석사' WHEN '4' THEN '박사' END AS p_school, CONCAT(SUBSTR(m.M_JUMIN, 1, 6), '-', SUBSTR(m.M_JUMIN, 7, 14)) AS m_jumin, m.M_CITY, CONCAT(TRIM(p.P_TEL1), '-', p.P_TEL2, '-', p.P_TEL3) AS TEL FROM TBL_MEMBER_202005 m JOIN TBL_PARTY_202005 p ON m.p_code = p.p_code";
			rs = conn.prepareStatement(sql).executeQuery();
			if(rs.next()) {
				do {
				MemberDTO dto = new MemberDTO(
						rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				list.add(dto);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionDB.closeAll(conn, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public int setVote(String jumin,String name,String no,String time,String area,String confirm) {
		try {
			conn = ConnectionDB.getConnection();
			String sql = "insert into TBL_VOTE_202005 values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,jumin);
			pstmt.setString(2,name);
			pstmt.setString(3,no);
			pstmt.setString(4,time);
			pstmt.setString(5,area);
			pstmt.setString(6,confirm);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionDB.closeAll(conn, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return -1;
	}
	public List<VoteDTO> getVote(){
		List<VoteDTO> list = new ArrayList<>();
		try {
			conn = ConnectionDB.getConnection();
			String sql ="SELECT V_NAME, "
					+ "CONCAT( "
					+ "    CASE WHEN SUBSTR(V_JUMIN, 7, 1) IN ('1','2') THEN CONCAT('19', SUBSTR(V_JUMIN, 1, 2)) "
					+ "         WHEN SUBSTR(V_JUMIN, 7, 1) IN ('3','4') THEN CONCAT('20', SUBSTR(V_JUMIN, 1, 2)) END, "
					+ "	 '년 ', SUBSTR(V_JUMIN, 3, 2), '월', SUBSTR(V_JUMIN, 5, 2), '일생' ) AS birth, "
					+ "CONCAT('만 ', YEAR(NOW())-CONCAT('19', SUBSTR(V_JUMIN, 1, 2)), '살') AS age, "
					+ "CASE WHEN SUBSTR(V_JUMIN, 7, 1) IN ('1','3') THEN '남자' "
					+ "     WHEN SUBSTR(V_JUMIN, 7, 1) IN ('2','4') THEN '여자' END AS gender, "
					+ "V_NO, "
					+ "CONCAT(SUBSTR(V_TIME, 1, 2), ':', SUBSTR(V_TIME, 3, 2)) AS time, "
					+ "CASE V_CONFIRM WHEN 'Y' THEN '확인' "
					+ "               WHEN 'N' THEN '미확인' END AS confirm "
					+ "FROM TBL_VOTE_202005 "
					+ "WHERE V_AREA = '제1투표장'";
			rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				VoteDTO dto = new VoteDTO(
					rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
				list.add(dto);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionDB.closeAll(conn, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<RankDTO> getRank(){
		List<RankDTO> list = new ArrayList<>();
		try {
			conn = ConnectionDB.getConnection();
			String sql ="SELECT m.M_NO, m.M_NAME, COUNT(v.v_NO) AS tot "
					+ "FROM TBL_MEMBER_202005 m "
					+ "JOIN TBL_VOTE_202005 v ON m.M_NO = v.V_NO "
					+ "WHERE v.V_CONFIRM != 'N' "
					+ "GROUP BY m.M_NO, m.M_NAME "
					+ "ORDER BY tot DESC";
			rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				RankDTO dto = new RankDTO(
					rs.getInt(1),rs.getString(2),rs.getInt(3));
				list.add(dto);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionDB.closeAll(conn, pstmt, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
