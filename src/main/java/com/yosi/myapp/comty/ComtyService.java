package com.yosi.myapp.comty;

import java.util.List;


public interface ComtyService {
	public List<ComtyVO> allSelect();
	public int comtyInsert(ComtyVO vo); 
	public ComtyVO comtySelect(int comtyNo);
	public int comtyUpdate(ComtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);

	public void hitCount(int comtyNo);

	
	public void cntHit (int comtyNo);
}
