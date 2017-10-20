package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.User;
import com.board.mapper.UserMapper;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	private UserMapper userMapper;

	@RequestMapping(value="/{username}", method=RequestMethod.GET)
	public ModelAndView updateform(@PathVariable("username")String username) throws Exception{
		User user = userMapper.readUser(username);
		return new ModelAndView("memberUpdate","user",user);
	}
	
	@RequestMapping(value="/{username}", method=RequestMethod.PATCH)
	public String update(@ModelAttribute("User")User user,@PathVariable("username")String username) throws Exception{

		userMapper.memberUpdate(user);

		return "redirect:/board";

	}
	
}
