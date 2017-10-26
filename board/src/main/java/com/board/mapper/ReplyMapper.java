package com.board.mapper;

import java.util.List;

import com.board.domain.Reply;
import com.board.support.DB3;

@DB3
public interface ReplyMapper {
	
		
		public void replyInsert(Reply reply) throws Exception;
		public List<Reply> replyList(int bno) throws Exception;
		public void replyDelete(int bno) throws Exception;
		public void replyDeleteBoard(int bno) throws Exception;

	}

