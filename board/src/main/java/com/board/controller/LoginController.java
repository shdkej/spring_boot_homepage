package com.board.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.AuthenticationRequest;
import com.board.domain.User;
import com.board.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	@Autowired
	AuthenticationManager authenticationManager;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() throws Exception{
		return new ModelAndView("loginform");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestBody AuthenticationRequest authenticationRequest, HttpSession session, @PathVariable("reg_date") Date reg_date){
		String username = authenticationRequest.getUsername();
		String password = authenticationRequest.getPassword();
		
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		
		Authentication authentication = authenticationManager.authenticate(token);
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
		
		User user = userService.readUser(username);
		return "redirect://localhost:8080/board"; //new AuthenticationToken(user.getName(),user.getAuthorities(),session.getId());
	}
	
	@RequestMapping(value="/createmember", method=RequestMethod.GET)
	public ModelAndView joinform() throws Exception{
		return new ModelAndView("joinForm");
	}
	
	@RequestMapping(value="/createmember", method=RequestMethod.POST)
	public String join(@ModelAttribute("User") User user) throws Exception{
		
		userService.createUser(user);
		
		return "redirect://localhost:8080/login";
	}


}

