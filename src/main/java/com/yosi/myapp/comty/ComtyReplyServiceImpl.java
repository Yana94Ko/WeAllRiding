package com.yosi.myapp.comty;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComtyReplyServiceImpl implements ComtyReplyService {
	
	/*
	 * @Inject private ComtyReplyDAO dao;
	 */
	
	@Autowired
	ComtyReplyDAO dao;

	@Override
	public int replyWrite(ComtyReplyVO vo) {
		return dao.replyWrite(vo);
	}

	@Override
	public List<ComtyReplyVO> replyList(int comtyNo) {
		return dao.replyList(comtyNo);
	}

	@Override
	public int replyEdit(ComtyReplyVO vo) {
		return dao.replyEdit(vo);
	}

	@Override
	public int replyDel(int comtyReplyNo, String nickname) {
		return dao.replyDel(comtyReplyNo, nickname);
	}

	/*
	 * @Override public List<ComtyReplyVO> comtyReplyList(int comtyNo) throws
	 * Exception { return dao.comtyReplyList(comtyNo); }
	 */

}
