package com.yosi.myapp.riding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RidingReplyServiceImpl implements RidingReplyService {

	@Autowired
	RidingReplyDAO dao;
	
	@Override
	public int ridingReplyWrite(RidingReplyVO vo) {
		return dao.ridingReplyWrite(vo);
	}

	@Override
	public List<RidingReplyVO> ridingReplyList(int ridingNo) {
		return dao.ridingReplyList(ridingNo);
	}

	@Override
	public int ridingReplyEdit(RidingReplyVO vo) {
		return dao.ridingReplyEdit(vo);
	}

	@Override
	public int ridingReplyDel(int ridingReplyNo, String nickname) {
		return dao.ridingReplyDel(ridingReplyNo, nickname);
	}

}
