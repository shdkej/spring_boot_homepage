package com.board.mapper;

import java.util.List;

import com.board.domain.Sign;
import com.board.domain.User;
import com.board.support.DB4;

@DB4
public interface SignMapper {
	

	public List<Sign> signList() ;
	public List<Sign> signRead() ;
	public Sign signDocView(int docno);
	public Sign signView(int sno) ;
	public void signWritedoc(Sign sign) ;
	public void signWrite(Sign sign) ;
	public void signPermit(Sign sign) ;
	public void signDeny(int signno) ;
	public void signInsert() ;
	public void signRegister() ;
	public void signRegisterCheck() ;
	public Sign signConfirm(String job_id, String department_id);
	
	
	}

