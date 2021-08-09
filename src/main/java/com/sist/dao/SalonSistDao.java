package com.sist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.SalonSistVo;

public class SalonSistDao {
	
	// 싱글턴 방식으로 객체 정의
	private static SalonSistDao dao;
	// 매개변수가 없는 생성자 
	private SalonSistDao() {}
	
	// getInstance 메소드 생성
	public static SalonSistDao getInstance() {
		if(dao==null) {
			dao = new SalonSistDao();
		}
		return dao;
	}
	
	// 신규 예약 날짜, 시간을 매개변수로 전달받아 중복 예약 여부를 판별하는 메소드
	public int getCnt(Date booker_date, String booker_time) {
		int cnt = -1;
		
		try {
			String sql = "select count(*) as cnt from booking where booker_date=? and booker_time=?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, booker_date);
			pstmt.setString(2, booker_time);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
		        System.out.println("행의 개수: " + cnt);
			}
		} catch (Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		return cnt;
	}
	
	// 예약 추가 메소드
	public int insertBooking(SalonSistVo v) {
		int re = -1;
		try {
			String sql2 = "insert into booking(booker_num, booker_name, booker_phone, "
					+ "booker_pwd, booker_date, booker_time, style_detail_no, d_no) "
					+ "values(seq_booking.nextval, ?, ?, ?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, v.getBooker_name());
			pstmt.setString(2, v.getBooker_phone());
			pstmt.setInt(3, v.getBooker_pwd());
			pstmt.setDate(4, v.getBooker_date());
			pstmt.setString(5, v.getBooker_time());
			pstmt.setInt(6,	v.getStyle_detail_no());
			pstmt.setInt(7, v.getD_no());
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		return re; 
	}
	
	// 디자이너 추가 메소드
	public int insertDesigner(SalonSistVo v) {
		int re = -1;
		String sql = "insert into designer(d_no, d_name, d_position) values(?, ?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, v.getD_no());
			pstmt.setString(2, v.getD_name());
			pstmt.setString(3, v.getD_position());
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		return re;
	}
	
	//예약 조회 메소드
	public ArrayList<SalonSistVo> find(int booker_pwd, String booker_name, String booker_phone) {
		ArrayList<SalonSistVo> list = new ArrayList<SalonSistVo>();
		
		String sql = "select booker_num, booker_date, booker_time, style_name, style_detail_name, d_name "
				+ "from menu m, designer d, detail de, booking b "
				+ "where d.d_no=b.d_no and de.style_no=m.style_no and b.style_detail_no=de.style_detail_no and "
				+ "booker_pwd=? and booker_name=? and booker_phone=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, booker_pwd);
			pstmt.setString(2, booker_name);
			pstmt.setString(3, booker_phone);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new SalonSistVo(rs.getInt(1),rs.getDate(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return list;
	}
	
	// 예약자명을 전달받아 DB에 있는 예약자인지 판별하는 메소드
	public boolean isCorrectName(String booker_name) {
		boolean flag = false;
		String sql = "select * from booking where booker_name=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booker_name);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			System.out.println("name flag: " + flag);
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외 발생: " + e.getMessage());
		}
		return flag;
	}
	
	// 연락처를 전달받아 DB에 있는 연락처인지 판별하는 메소드
	public boolean isCorrectPhone(String booker_phone) {
		boolean flag = false;
		String sql = "select * from booking where booker_phone=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booker_phone);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			System.out.println("phone flag: " + flag);
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외 발생: " + e.getMessage());
		}
		return flag;
	}
	
	// 비밀번호와 연락처를 전달받아 DB에 있는 비밀번호인지 판별하는 메소드
	public boolean isCorrectPwd(int booker_pwd) {
		boolean flag = false;
		String sql = "select * from booking where booker_pwd=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, booker_pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			System.out.println("pwd flag: " + flag);
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e) {
			System.out.println("예외 발생: " + e.getMessage());
		}
		return flag;
	}
	
	//예약 취소 메소드
	public int deleteBooking(int booker_num) {
		int re = -1;
		String sql = "delete from booking where booker_num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##madang";
		String pwd = "madang";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, booker_num);	
			re = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
	
}