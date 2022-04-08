package com.yosi.myapp.service;

import java.util.List;

import com.yosi.myapp.vo.comtyVO;

public interface comtyService {
	public List<comtyVO> allSelect();
	public int comtyInsert(comtyVO vo); 
	public comtyVO comtySelect(int comtyNo);
	public int comtyUpdate(comtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);
}
