package com.yosi.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yosi.myapp.dao.comtyDAO;
import com.yosi.myapp.vo.comtyVO;
@Service
public class comtyServiceImpl implements comtyService {
	@Inject
	comtyDAO dao;
	@Override
	public List<comtyVO> allSelect() {
		return dao.allSelect();
	}
	@Override
	public int comtyInsert(comtyVO vo) {
		return dao.comtyInsert(vo);
	}
	@Override
	public comtyVO comtySelect(int comtyNo) {
		return dao.comtySelect(comtyNo);
	}
	@Override
	public int comtyUpdate(comtyVO vo) {
		return dao.comtyUpdate(vo);
	}
	@Override
	public int comtyDelete(int comtyNo, String nickname) {

		return dao.comtyDelete(comtyNo, nickname);
	}

}