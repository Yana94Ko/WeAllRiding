package com.yosi.myapp.riding;

import java.util.List;

import com.yosi.myapp.PagingVO;


public interface RidingService {
	public List<RidingVO> ridingList(PagingVO pVO);
	public int ridingInsert(RidingVO vo); 
	public RidingVO ridingSelect(int ridingNo);
	public int ridingUpdate(RidingVO vo);
	public int ridingDelete(int ridingNo, String nickname);
	public void cntHit (int ridingNo);
		
	//총레코드수
	public int totalRecord(PagingVO pVO);
	
	public int ridingMemberInsert(RidingVO vo);
	public int ridingMemberUpdate(RidingVO vo);
	public List<RidingVO> ridingMemberShow(int ridingMemberNo);
	public int ridingMemberDelete(RidingVO vo);
	
	public int ridingStateUpdate(RidingVO vo);
	public int ridingStateDel(RidingVO vo);
	
	//마이라이딩
	public List<RidingVO> myRidingJoinList(RidingVO vo);
	public List<RidingVO> myRidingEndList(RidingVO vo);
	public List<RidingVO> myRidingMadeList(RidingVO vo);
	
	//후기등록
	public int ridingReviewWrite(RidingVO vo);
	//후기목록
	public List<RidingVO> ridingReviewList(int ridingNo);
	
	//유저평가
	public int ridingScoreUp(RidingVO vo);
	public int ridingScoreDown(RidingVO vo);
	
	public int applyUserCount(RidingVO vo);
	
	public int ridingApplyUpdate(RidingVO vo);
	
	public int ridingApplicantCntUp(RidingVO vo);
	public int ridingApplicantCntDown(RidingVO vo);
	public int ridingStateCancle(RidingVO vo);
}
