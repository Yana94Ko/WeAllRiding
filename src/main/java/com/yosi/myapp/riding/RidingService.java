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
	
}
