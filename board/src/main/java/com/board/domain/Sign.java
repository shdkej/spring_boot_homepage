package com.board.domain;

import java.sql.Date;

public class Sign {
	
	User user;
	
	private String name;
	private int docno;
	private String docname;
	private int doctype;
	private int doclevel;
	private String content1;
	private String content2;
	private String content3;
	private Date reg_date;
	
	private int signno;
	private String signtitle;
	private String signcontent;
	private int checkno;
	private String checkman1;
	private String checkman2;
	private String checkman3;
	private int signconfirm;
	private int signlevel;
	private String sign;
	private String denycouse;
	private int signdocno;
	private int department;
	
	
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDocno() {
		return docno;
	}
	public void setDocno(int docno) {
		this.docno = docno;
	}
	public String getDocname() {
		return docname;
	}
	public void setDocname(String docname) {
		this.docname = docname;
	}
	public int getDoctype() {
		return doctype;
	}
	public void setDoctype(int doctype) {
		this.doctype = doctype;
	}
	public int getDoclevel() {
		return doclevel;
	}
	public void setDoclevel(int doclevel) {
		this.doclevel = doclevel;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getSignno() {
		return signno;
	}
	public void setSignno(int signno) {
		this.signno = signno;
	}
	public String getSigntitle() {
		return signtitle;
	}
	public void setSigntitle(String signtitle) {
		this.signtitle = signtitle;
	}
	public String getSigncontent() {
		return signcontent;
	}
	public void setSigncontent(String signcontent) {
		this.signcontent = signcontent;
	}
	public int getCheckno() {
		return checkno;
	}
	public void setCheckno(int checkno) {
		this.checkno = checkno;
	}

	public String getCheckman1() {
		return checkman1;
	}
	public void setCheckman1(String checkman1) {
		this.checkman1 = checkman1;
	}
	public String getCheckman2() {
		return checkman2;
	}
	public void setCheckman2(String checkman2) {
		this.checkman2 = checkman2;
	}
	public String getCheckman3() {
		return checkman3;
	}
	public void setCheckman3(String checkman3) {
		this.checkman3 = checkman3;
	}
	public int getSignconfirm() {
		return signconfirm;
	}
	public void setSignconfirm(int signconfirm) {
		this.signconfirm = signconfirm;
	}
	public int getSignlevel() {
		return signlevel;
	}
	public void setSignlevel(int signlevel) {
		this.signlevel = signlevel;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getDenycouse() {
		return denycouse;
	}
	public void setDenycouse(String denycouse) {
		this.denycouse = denycouse;
	}
	public int getSigndocno() {
		return signdocno;
	}
	public void setSigndocno(int signdocno) {
		this.signdocno = signdocno;
	}
	

	
}
