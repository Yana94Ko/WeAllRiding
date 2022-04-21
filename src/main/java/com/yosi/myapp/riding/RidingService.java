package com.yosi.myapp.riding;

import java.util.List;

import com.yosi.myapp.RidingPagingVO;


public interface RidingService {
	//참가 여부
	public int resolveStatus(String nickName,int ridingNo);
	public List<RidingVO> ridingList(RidingPagingVO pVO);
	public int ridingInsert(RidingVO vo); 
	public RidingVO ridingSelect(int ridingNo);
	public int ridingUpdate(RidingVO vo);
	public int ridingDelete(int ridingNo, String nickname);
	public void cntHit (int ridingNo);
		
	//총레코드수
	public int totalRecord(RidingPagingVO pVO);
	public int totalRecord1(RidingVO vo, RidingPagingVO pVO);
	public int totalRecord2(RidingVO vo, RidingPagingVO pVO);
	public int totalRecord3(RidingVO vo, RidingPagingVO pVO);
	
	public int ridingMemberInsert(RidingVO vo);
	public int ridingMemberUpdate(RidingVO vo);
	public List<RidingVO> ridingMemberShow(int ridingMemberNo);
	public int ridingMemberDelete(RidingVO vo);
	
	public int ridingStateUpdate(RidingVO vo);
	public int ridingStateDel(RidingVO vo);
	
	//마이라이딩
	public List<RidingVO> myRidingJoinList(RidingVO vo, RidingPagingVO pVO);
	public List<RidingVO> myRidingEndList(RidingVO vo, RidingPagingVO pVO);
	public List<RidingVO> myRidingMadeList(RidingVO vo, RidingPagingVO pVO);
	
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

	//관리자 페이지 라이딩 삭제
	public int adminRidingDel(int ridingNo);

	//관리자 피이지 라이딩 리스트 오름차순
	public List<RidingVO> ridingList2(RidingPagingVO pVO);

    public String availableRiding();
	public String todayRiding();

}
