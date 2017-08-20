package com.board.mapper;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.support.DB1;

@DB1
public interface BoardMapper {
	
	public void boardInsert(BoardVO board) throws Exception;

	public List<BoardVO> boardList() throws Exception;
	
	public List<BoardVO> boardListforday(BoardVO board) throws Exception;
	
	public BoardVO boardView(int bno) throws Exception;
	
	public void hitPlus(int bno) throws Exception;
	
	public void boardUpdate(BoardVO vo) throws Exception;
	
	public void boardDelete(int bno) throws Exception;
	

}
