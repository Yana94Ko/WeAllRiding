package com.yosi.myapp.riding;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.yosi.myapp.PagingVO;

@Mapper
@Repository
public interface RidingDAO {
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
	
	//마이라이딩
	public List<RidingVO> myRidingJoinList(RidingVO vo);
	public List<RidingVO> myRidingEndList(RidingVO vo);
	public List<RidingVO> myRidingMadeList(RidingVO vo);
}
