package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.AuthenticationRequest;
import com.board.domain.User;
import com.board.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Value(value = "${ckeditor.storage.image.path}")
	private String ckeditorStorageImagePath;
	
	@Value(value = "${ckeditor.access.image.url}")
	private String ckeditorAccessImageUrl;
	
	
	@RequestMapping(value="/test")
	public ModelAndView test() throws Exception{
		return new ModelAndView("test");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() throws Exception{
		return new ModelAndView("loginform");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestBody AuthenticationRequest authenticationRequest, HttpSession session) throws IOException{
		String username = authenticationRequest.getUsername();
		String password = authenticationRequest.getPassword();
		
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		
		Authentication authentication = authenticationManager.authenticate(token);
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
		
//		User user = userService.readUser(username);
//		NotificationService.start();
		
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
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(@RequestParam("file")MultipartFile file,RedirectAttributes redirectAttributes) throws Exception{
		String UPLOAD_FOLDER = "A://test//";
		try{
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);
			
			redirectAttributes.addFlashAttribute("message","OK '"+ file.getOriginalFilename() + "'");
		}catch(IOException e){
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/test" , method=RequestMethod.POST)
	public void ckeditupload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		try{
			
			String filename = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			String root_path_name = ckeditorStorageImagePath + "\\";
			
			File rootFile = new File(root_path_name);
			if (! rootFile.exists()){
				rootFile.mkdir();
			}
			
			String path_name = rootFile + File.separator + filename;
			File newfile = new File(path_name);
			
			String file_url = ckeditorAccessImageUrl;
			out = new FileOutputStream(newfile);
			out.write(bytes);
			
			String callback = request.getParameter("CKEditorFuncNum");
			
			printWriter = response.getWriter();
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
					+ callback +",'" + file_url + "','업로드 완료'"+")</script>");
			printWriter.flush();
			
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				if (out != null){
					out.close();
				}
				if (printWriter != null){
					printWriter.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		} 
		
		return;
	}

}

