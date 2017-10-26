package com.board.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.Reply;
import com.board.domain.User;
import com.board.mapper.ReplyMapper;
import com.board.service.NotificationService;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyMapper replyMapper;
	
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)	
	public String replyInsert(@ModelAttribute("Reply")Reply reply,HttpServletRequest request,@ModelAttribute("User") User user) throws Exception{
		
		String bno = request.getParameter("bno");
		replyMapper.replyInsert(reply);
		String name = request.getUserPrincipal().getName();
		NotificationService ns = new NotificationService();
		ns.send(name);
		return "redirect:/board/"+bno;
	}
	
	@RequestMapping(value="/reply/delete/{r_no}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("r_no") int rno,HttpServletRequest request) throws Exception{
		
		replyMapper.replyDelete(rno);
		String bno = request.getParameter("bno");
		return "redirect:/board/"+bno;
	}
	

}
