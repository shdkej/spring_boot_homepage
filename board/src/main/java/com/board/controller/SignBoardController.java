package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.Sign;
import com.board.domain.User;
import com.board.mapper.SignMapper;
import com.board.mapper.UserMapper;

@Controller
@RequestMapping(value="/sign")
public class SignBoardController {

	@Autowired
	SignMapper signMapper;
	@Autowired
	UserMapper userMapper;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView signready(@AuthenticationPrincipal UserDetails userDetail) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Sign> sign = signMapper.signRead();
		String username = userDetail.getUsername();
		User user = userMapper.readUser(username);
		mv.addObject("sign", sign);
		mv.addObject("user", user);
		mv.setViewName("SignList");
		return mv;
	}
	
	@RequestMapping(value="/post", method=RequestMethod.GET)
	public ModelAndView signlist() throws Exception{
		List<Sign> list = signMapper.signList();
		ModelAndView mv = new ModelAndView();
		mv.addObject("sign",list);
		mv.setViewName("SignDocList");
		return mv;
	}
	
	@RequestMapping(value="/post", method=RequestMethod.POST)
	public String signpost(@ModelAttribute("Sign")Sign sign) throws Exception{
		signMapper.signWrite(sign);
		String username = sign.getName();
//		NotificationService.send(username);
		return "redirect:/sign";
	}
	
	@RequestMapping(value="/{docno}", method=RequestMethod.GET)
	public ModelAndView signwrite(@PathVariable("docno")int docno,@AuthenticationPrincipal UserDetails userDetail) throws Exception{
		ModelAndView mv = new ModelAndView();
		String username = userDetail.getUsername();
		User user = userMapper.readUser(username);
		Sign sign = signMapper.signDocView(docno);
		mv.addObject("sign",sign);
		mv.addObject("user", user);
		mv.setViewName("SignWrite");
		return mv;
	}
	
	@RequestMapping(value="/permit",method=RequestMethod.POST)
	public String signok(@AuthenticationPrincipal UserDetails userDetail,@ModelAttribute("Sign")Sign sign) throws Exception{
		signMapper.signPermit(sign);
		return "redirect:/sign";
	}
	
	@RequestMapping(value="/check/{signno}", method=RequestMethod.GET)
	public ModelAndView signview(@PathVariable("signno")int signno, @AuthenticationPrincipal UserDetails userDetail) throws Exception{
		ModelAndView mv = new ModelAndView();
		Sign sign = signMapper.signView1(signno);
		User user = signMapper.signView2(signno);
		String username = userDetail.getUsername();
		User me = userMapper.readUser(username);
		mv.addObject("sign",sign);
		mv.addObject("user", user);
		mv.addObject("me",me);
		mv.setViewName("SignView");
		return mv;
	}
	

	
	
}
