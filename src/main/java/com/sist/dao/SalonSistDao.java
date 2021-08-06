package com.sist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.SalonSistVo;

public class SalonSistDao {
	
	// �̱��� ������� ��ü ����
	private static SalonSistDao dao;
	// �Ű������� ���� ������ 
	private SalonSistDao() {}
	
	// getInstance �޼ҵ� ����
	public static SalonSistDao getInstance() {
		if(dao==null) {
			dao = new SalonSistDao();
		}
		return dao;
	}
	
	// �ű� ���� ��¥, �ð��� �Ű������� ���޹޾� �ߺ� ���� ���θ� �Ǻ��ϴ� �޼ҵ�
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
		        System.out.println("���� ����: "+cnt);
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�: " + e.getMessage());
		}
		return cnt;
	}
	
	// ���� �߰� �޼ҵ�
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
			System.out.println("���ܹ߻�: " + e.getMessage());
		}
		return re; 
	}
	
	// �����̳� �߰� �޼ҵ�
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
			System.out.println("���ܹ߻�: " + e.getMessage());
		}
		return re;
	}
	
	//���� ��ȸ �޼ҵ�
	public ArrayList<SalonSistVo> find(String booker_pwd, String booker_name, String booker_phone) {
		ArrayList<SalonSistVo> list = new ArrayList<SalonSistVo>();
		
		String sql = "select booker_num, booker_date, booker_time, style_name, style_detail_name, d_name "
				+ "from menu m, designer d, detail de, booking b "
				+ "where d.d_no=b.d_no and de.style_no=m.style_no and b.style_detail_no=de.style_detail_no and "
				+ "booker_pwd=? and booker_name=? and booker_phone=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, booker_pwd);
			pstmt.setString(2, booker_name);
			pstmt.setString(3, booker_phone);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new SalonSistVo(rs.getInt(1),rs.getDate(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
			}
			ConnectionProvider.close(conn, pstmt, rs);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("���ܹ߻�:" + e.getMessage());
		}
		return list;
	}
	
}