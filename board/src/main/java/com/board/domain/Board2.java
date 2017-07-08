package com.board.domain;

import java.sql.Date;

public class Board2 {
	
	
	private String boardname;
	private int bno;
	private String subject;
    private String content;
    private String writer;
    private Date reg_date;
    private int hit;
    
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}



}
