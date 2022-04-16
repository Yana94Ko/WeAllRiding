package com.yosi.myapp.riding;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class RidingMemberServiceImpl implements RidingMemberService {
	
	@Inject
	RidingMemberDAO dao;
	
	@Override
	public int ridingMemberInsert(RidingMemberVO vo) {
		return dao.ridingMemberInsert(vo);
	}

}
