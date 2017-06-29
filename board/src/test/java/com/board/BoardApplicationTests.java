package com.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.board.domain.BoardVO;
import com.board.mapper.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
@WebAppConfiguration
public class BoardApplicationTests {

	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void contextLoads() {
	}
	
	@Test
	public void testConnection() throws Exception{
		BoardVO vo = new BoardVO();
		
		vo.setSubject("제목입니다.");
		vo.setContent("내용입니다.");
		vo.setWriter("작성자입니다.");
		
		mapper.boardInsert(vo);
	}

}
