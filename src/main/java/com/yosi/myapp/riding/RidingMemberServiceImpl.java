package com.yosi.myapp.riding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RidingMemberServiceImpl implements RidingMemberService {

	@Autowired(required = false)
	RidingMemberDAO dao;
	
	@Override
	public int ridingMemberWrite(RidingMemberVO vo) {
		return dao.ridingMemberWrite(vo);
	}

	@Override
	public List<RidingMemberVO> ridingMemberList(int ridingNo) {
		return dao.ridingMemberList(ridingNo);
	}

	@Override
	public int ridingMemberDel(int ridingMemberNo, String nickname) {
		return dao.ridingMemberDel(ridingMemberNo, nickname);
	}

}
