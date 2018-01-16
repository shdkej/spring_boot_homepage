package com.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.AuthenticationRequest;
import com.board.domain.User;
import com.board.mapper.UserMapper;
import com.board.service.NotificationService;
import com.board.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	@Autowired
	UserMapper userMapper;
	@Autowired
	AuthenticationManager authenticationManager;

	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test() throws Exception{
		
		return "test";
		//return "redirect:https://kauth.kakao.com/oauth/authorize?client_id=91992d817c30e5dcdfd06f485ea464d4&redirect_uri=http://localhost:8080/oauth&response_type=code";
	}
	
	@RequestMapping(value="/test2", method=RequestMethod.GET)
	public String test2() throws Exception{
		return "boardlist2";
	}
	
	@RequestMapping(value="/test1", method=RequestMethod.GET)
	public JsonNode tokenCreate() throws Exception{
		NotificationService test = new NotificationService();
		JsonNode jsonToken = test.test();
		return jsonToken;
		
	}
	
	
	@RequestMapping(value="/oauth",produces="application/json", method={RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse httpServletResponse) throws Exception{
		NotificationService test = new NotificationService();
		JsonNode jsonToken = test.test();
		System.out.println("JSON 반환 : "+jsonToken.getTextValue());
		return "/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() throws Exception{
		return new ModelAndView("loginForm");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestBody AuthenticationRequest authenticationRequest, HttpSession session) throws IOException{
		String username = authenticationRequest.getUsername();
		String password = authenticationRequest.getPassword();
		
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		
		Authentication authentication = authenticationManager.authenticate(token);
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
		
		User user = userService.readUser(username);
		
		return "redirect:/board";
	}
	
	@RequestMapping(value="/createmember", method=RequestMethod.GET)
	public ModelAndView joinform() throws Exception{
		return new ModelAndView("joinForm");
	}
	
	@RequestMapping(value="/createmember", method=RequestMethod.POST)
	public String join(@ModelAttribute("User") User user) throws Exception{
		
		userService.createUser(user);
		
		return "redirect:/login";
	}
	
	@RequestMapping(value="/checkId", method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int idCheck(User user,Model model) throws Exception{
		return userMapper.checkId(user);
	}

}

