package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.board.domain.Sign;
import com.board.mapper.SignMapper;

public class SignService {
	
	@Autowired
	SignMapper signMapper;
	
	public float countDay(Sign sign){
		long start_date = sign.getStart_date().getTime();
		long end_date = sign.getEnd_date().getTime();
		int type = sign.getType();
		
		long count = 0;
		
		if(type==1){
			count = (long) 0.5;
		}else if(type==2){
			count = 1;
		}else{
			count = end_date - start_date;
		}
		
		return count;
	}

}
