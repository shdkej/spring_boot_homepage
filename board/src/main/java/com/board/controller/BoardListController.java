package com.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVO;
import com.board.domain.Reply;
import com.board.mapper.BoardMapper;
import com.board.mapper.ReplyMapper;
import com.board.mapper.UserMapper;


@Controller
@RequestMapping(value="/board")
public class BoardListController {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private UserMapper userMapper;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list() throws Exception{
		List<BoardVO> list = boardMapper.boardList();
		
		ModelAndView view = new ModelAndView();
		
		view.addObject("list",list);
		view.setViewName("boardList");

		return view;
	}
	
	@RequestMapping(value="/daily", method=RequestMethod.GET)
	public ModelAndView list3(HttpServletRequest request) throws Exception{

		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = "01";
		String reg_date = year+"-"+month+"-"+day;
		
		Date d = Date.valueOf(reg_date);
		
		BoardVO date = new BoardVO();
		date.setReg_date(d);
		
		List<BoardVO> list = boardMapper.boardListforday(date);
		
		return new ModelAndView("boardList","list",list);

	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView list2() throws Exception{
		List<BoardVO> list = boardMapper.boardList();
		return new ModelAndView("boardList","list",list);
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public ModelAndView writeForm() throws Exception{
		return new ModelAndView("boardWrite");
	}
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String write(@ModelAttribute("BoardVO") BoardVO board) throws Exception{
		
		boardMapper.boardInsert(board);

		return "redirect:/board";
	}
	
	@RequestMapping(value="/{bno}", method=RequestMethod.GET)
	public ModelAndView view(@PathVariable("bno") int bno) throws Exception{
		
		BoardVO board = boardMapper.boardView(bno);
		List<Reply> reply = replyMapper.replyList(bno);
		boardMapper.hitPlus(bno);
		ModelAndView view = new ModelAndView();
		view.addObject("board", board);
		view.addObject("reply",reply);
		view.setViewName("boardView");
		return view;
		
	}
	
	@RequestMapping(value="/post/{bno}", method=RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable("bno") int bno) throws Exception{
		
		BoardVO board = boardMapper.boardView(bno);
		
		return new ModelAndView("boardUpdate","board",board);
	}
	
	@RequestMapping(value="/post/{bno}", method=RequestMethod.PATCH)
	public String update(@ModelAttribute("BoardVO")BoardVO board,@PathVariable("bno") int bno) throws Exception{
		
		boardMapper.boardUpdate(board);
		
		return "redirect:/board/"+bno;
	}
	
	@RequestMapping(value="/delete/{bno}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("bno") int bno) throws Exception{
		
		boardMapper.boardDelete(bno);
		
		return "redirect:/board/";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public void upload(@RequestParam("upload")MultipartFile file, HttpServletRequest request, HttpServletResponse response){

		if (!file.isEmpty()){
			try{
				
				byte[] bytes = file.getBytes();
				File newfile = new File("/root");
				BufferedOutputStream buff = new BufferedOutputStream(new FileOutputStream(newfile));
				buff.write(bytes);
				buff.close();
				
			}catch(IOException e){
				e.printStackTrace();
			}
	}
	}
}