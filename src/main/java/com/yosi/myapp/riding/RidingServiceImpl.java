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
	
	
	@Override
	public int ridingMemberInsert(RidingVO vo) {
		return dao.ridingMemberInsert(vo);
	}
	@Override
	public int ridingMemberUpdate(RidingVO vo) {
		return dao.ridingMemberUpdate(vo);
	}
	@Override
	public List<RidingVO> ridingMemberShow(int ridingMemberNo) {
		return dao.ridingMemberShow(ridingMemberNo);
	}
	@Override
	public int ridingMemberDelete(RidingVO vo) {
		
		return dao.ridingMemberDelete(vo);
	}
	@Override
	public int ridingStateUpdate(RidingVO vo) {
		return dao.ridingStateUpdate(vo);
	}
	@Override
	public int ridingStateDel(RidingVO vo) {
		return dao.ridingStateDel(vo);
	}
	
	@Override
	public List<RidingVO> myRidingJoinList(RidingVO vo) {
		return dao.myRidingJoinList(vo);
	}
	@Override
	public List<RidingVO> myRidingEndList(RidingVO vo) {
		return dao.myRidingEndList(vo);
	}
	@Override
	public List<RidingVO> myRidingMadeList(RidingVO vo) {
		return dao.myRidingMadeList(vo);
	}
	
	
	@Override
	public int ridingReviewWrite(RidingVO vo) {
		return dao.ridingReviewWrite(vo);
	}
	@Override
	public List<RidingVO> ridingReviewList(int ridingNo) {
		return dao.ridingReviewList(ridingNo);
	}
	@Override
	public int ridingScoreUp(RidingVO vo) {
		return dao.ridingScoreUp(vo);
	}
	@Override
	public int ridingScoreDown(RidingVO vo) {
		return dao.ridingScoreDown(vo);
	}
	
	

}
