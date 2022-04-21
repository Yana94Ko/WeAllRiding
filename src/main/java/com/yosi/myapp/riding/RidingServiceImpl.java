package com.yosi.myapp.riding;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yosi.myapp.RidingPagingVO;

@Service
public class RidingServiceImpl implements RidingService {

	@Inject
	RidingDAO dao;
	
	//참가 여부
	public int resolveStatus(String nickName,int ridingNo) {
		return dao.resolveStatus(nickName,ridingNo);
	}
	
	@Override
	public List<RidingVO> ridingList(RidingPagingVO pVO) {
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
	public int totalRecord(RidingPagingVO pVO) {
		return dao.totalRecord(pVO);
	}
	//
	@Override
	public int totalRecord1(RidingVO vo, RidingPagingVO pVO) {
		return dao.totalRecord1(vo, pVO);
	}
	@Override
	public int totalRecord2(RidingVO vo, RidingPagingVO pVO) {
		return dao.totalRecord2(vo, pVO);
	}
	@Override
	public int totalRecord3(RidingVO vo, RidingPagingVO pVO) {
		return dao.totalRecord3(vo, pVO);
	}
	
	//
	
	
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
	public List<RidingVO> myRidingJoinList(RidingVO vo, RidingPagingVO pVO) {
		return dao.myRidingJoinList(vo, pVO);
	}
	@Override
	public List<RidingVO> myRidingEndList(RidingVO vo, RidingPagingVO pVO) {
		return dao.myRidingEndList(vo, pVO);
	}
	@Override
	public List<RidingVO> myRidingMadeList(RidingVO vo, RidingPagingVO pVO) {
		return dao.myRidingMadeList(vo, pVO);
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
	@Override
	public int applyUserCount(RidingVO vo) {
		return dao.applyUserCount(vo);
	}
	@Override
	public int ridingApplyUpdate(RidingVO vo) {
		return dao.ridingApplyUpdate(vo);
	}
	@Override
	public int ridingApplicantCntUp(RidingVO vo) {
		return dao.ridingApplicantCntUp(vo);
	}
	@Override
	public int ridingApplicantCntDown(RidingVO vo) {
		return dao.ridingApplicantCntDown(vo);
	}
	@Override
	public int ridingStateCancle(RidingVO vo) {
		return dao.ridingStateCancle(vo);
	}

	@Override
	public String availableRiding() {
		return dao.availableRiding();
	}

	@Override
	public String todayRiding() {
		return dao.todayRiding();
	}

	@Override
	public int ridingCountUp(RidingVO vo) {
		return dao.ridingCountUp(vo);
	}


}
