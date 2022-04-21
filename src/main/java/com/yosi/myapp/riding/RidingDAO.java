package com.yosi.myapp.riding;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.yosi.myapp.RidingPagingVO;

@Mapper
@Repository
public interface RidingDAO {
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
	
	//라이딩 참가 횟수
	public int ridingCountUp(RidingVO vo);
	
	//유저평가
	public int ridingScoreUp(RidingVO vo);
	public int ridingScoreDown(RidingVO vo);
	
	public int applyUserCount(RidingVO vo);
	
	public int ridingApplyUpdate(RidingVO vo);
	
	public int ridingApplicantCntUp(RidingVO vo);
	public int ridingApplicantCntDown(RidingVO vo);
	public int ridingStateCancle(RidingVO vo);

	public String availableRiding();
	public String todayRiding();
}
