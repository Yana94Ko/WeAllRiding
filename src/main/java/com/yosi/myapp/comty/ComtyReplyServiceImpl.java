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
	public int comtyReplyWrite(ComtyReplyVO vo) {
		return dao.comtyReplyWrite(vo);
	}

	@Override
	public List<ComtyReplyVO> comtyReplyList(int comtyNo) {
		return dao.comtyReplyList(comtyNo);
	}

	@Override
	public int comtyReplyEdit(ComtyReplyVO vo) {
		return dao.comtyReplyEdit(vo);
	}

	@Override
	public int comtyReplyDel(int comtyReplyNo, String nickname) {
		return dao.comtyReplyDel(comtyReplyNo, nickname);
	}

	/*
	 * @Override public List<ComtyReplyVO> comtyReplyList(int comtyNo) throws
	 * Exception { return dao.comtyReplyList(comtyNo); }
	 */

}