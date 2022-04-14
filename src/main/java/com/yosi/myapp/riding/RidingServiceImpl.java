package com.yosi.myapp.riding;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yosi.myapp.PagingVO;

@Service
public class RidingServiceImpl implements RidingService {

	@Inject
	RidingDAO dao;
	@Override
	public List<RidingVO> ridingList(PagingVO pVO) {
		return dao.ridingList(pVO);
	}
	@Override
	public int ridingInsert(RidingVO vo) {
		return dao.ridingInsert(vo);
	}
	@Override
	public RidingVO ridingSelect(int ridingNo) {
		return dao.ridingSelect(ridingNo);
	}
	@Override
	public int ridingUpdate(RidingVO vo) {
		return dao.ridingUpdate(vo);
	}
	@Override
	public int ridingDelete(int ridingNo, String nickname) {

		return dao.ridingDelete(ridingNo, nickname);
	}
	@Override
	public void cntHit(int ridingNo) {
		dao.cntHit(ridingNo);
	}
	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

}
