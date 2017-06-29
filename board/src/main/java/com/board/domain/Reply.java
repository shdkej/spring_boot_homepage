package com.board.domain;

import java.sql.Date;

public class Reply {
	
	private int bno;
	private String r_name;
	private String r_password;
	private String r_content;
	private int r_no;
	private Date r_date;
	
	
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_no() {
		return r_no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_password() {
		return r_password;
	}
	public void setR_password(String r_password) {
		this.r_password = r_password;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

}
