package com.board.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.Reply;
import com.board.domain.User;
import com.board.mapper.ReplyMapper;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyMapper replyMapper;
	
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)	
	public String replyInsert(@ModelAttribute("Reply")Reply reply,HttpServletRequest request,@ModelAttribute("User") User user) throws Exception{
		
		String bno = request.getParameter("bno");
		
		
		/*
		String r_name = request.getParameter("r_name");
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		r_no++;
		*/
		
		replyMapper.replyInsert(reply);
		
		return "redirect://localhost:8080/board/"+bno;
	}
	

}
