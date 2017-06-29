package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@RequestMapping(value="/board")
	public ModelAndView adminlist() throws Exception{
		return new ModelAndView("managerboard");
	}

}
