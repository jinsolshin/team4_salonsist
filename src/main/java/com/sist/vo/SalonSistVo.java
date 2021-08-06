package com.sist.vo;

import java.sql.Date;

public class SalonSistVo {
	private int d_no;
	private String d_name;
	private String d_position;
	
	private int style_no;
	private String style_name;
	
	private int style_detail_no;
	private String style_detail_name;
	
	private int booker_num;
	private String booker_name;
	private String booker_phone;
	private int booker_pwd;
	private Date booker_date;
	private String booker_time;
	
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_position() {
		return d_position;
	}
	public void setD_position(String d_position) {
		this.d_position = d_position;
	}
	public int getStyle_no() {
		return style_no;
	}
	public void setStyle_no(int style_no) {
		this.style_no = style_no;
	}
	public String getStyle_name() {
		return style_name;
	}
	public void setStyle_name(String style_name) {
		this.style_name = style_name;
	}
	public int getStyle_detail_no() {
		return style_detail_no;
	}
	public void setStyle_detail_no(int style_detail_no) {
		this.style_detail_no = style_detail_no;
	}
	public String getStyle_detail_name() {
		return style_detail_name;
	}
	public void setStyle_detail_name(String style_detail_name) {
		this.style_detail_name = style_detail_name;
	}
	public int getBooker_num() {
		return booker_num;
	}
	public void setBooker_num(int booker_num) {
		this.booker_num = booker_num;
	}
	public String getBooker_name() {
		return booker_name;
	}
	public void setBooker_name(String booker_name) {
		this.booker_name = booker_name;
	}
	public String getBooker_phone() {
		return booker_phone;
	}
	public void setBooker_phone(String booker_phone) {
		this.booker_phone = booker_phone;
	}
	public int getBooker_pwd() {
		return booker_pwd;
	}
	public void setBooker_pwd(int booker_pwd) {
		this.booker_pwd = booker_pwd;
	}
	public Date getBooker_date() {
		return booker_date;
	}
	public void setBooker_date(Date booker_date) {
		this.booker_date = booker_date;
	}
	public String getBooker_time() {
		return booker_time;
	}
	public void setBooker_time(String booker_time) {
		this.booker_time = booker_time;
	}
	public SalonSistVo(int d_no, String d_name, String d_position, int style_no, String style_name, int style_detail_no,
			String style_detail_name, int booker_num, String booker_name, String booker_phone, int booker_pwd,
			Date booker_date, String booker_time) {
		super();
		this.d_no = d_no;
		this.d_name = d_name;
		this.d_position = d_position;
		this.style_no = style_no;
		this.style_name = style_name;
		this.style_detail_no = style_detail_no;
		this.style_detail_name = style_detail_name;
		this.booker_num = booker_num;
		this.booker_name = booker_name;
		this.booker_phone = booker_phone;
		this.booker_pwd = booker_pwd;
		this.booker_date = booker_date;
		this.booker_time = booker_time;
	}
	
	public SalonSistVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SalonSistVo(int booker_num, Date booker_date, String booker_time, String style_name,
			String style_detail_name, String d_name) {
		super();
		this.booker_num = booker_num;
		this.booker_date = booker_date;
		this.booker_time = booker_time;
		this.style_name = style_name;
		this.style_detail_name = style_detail_name;
		this.d_name = d_name;
	}
}