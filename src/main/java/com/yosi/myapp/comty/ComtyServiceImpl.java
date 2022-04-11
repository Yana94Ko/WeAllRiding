package com.yosi.myapp.comty;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ComtyServiceImpl implements ComtyService {
	@Inject
	ComtyDAO dao;
	@Override
	public List<ComtyVO> allSelect() {
		return dao.allSelect();
	}
	@Override
	public int comtyInsert(ComtyVO vo) {
		return dao.comtyInsert(vo);
	}
	@Override
	public ComtyVO comtySelect(int comtyNo) {
		return dao.comtySelect(comtyNo);
	}
	@Override
	public int comtyUpdate(ComtyVO vo) {
		return dao.comtyUpdate(vo);
	}
	@Override
	public int comtyDelete(int comtyNo, String nickname) {

		return dao.comtyDelete(comtyNo, nickname);
	}
	@Override
	public void hitCount(int comtyNo) {
		// TODO Auto-generated method stub
	}
	public void cntHit(int comtyNo) {
		dao.cntHit(comtyNo);
	}

}