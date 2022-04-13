package com.yosi.myapp.recommend;

import java.util.List;

public interface RecommendService {
	public int recommendCheck(int recNo);
	public RecommendVO recommendSelect(int recNo);
	public int recommendInsert(RecommendVO recVO);
	public List<RecommendVO> recommendAllSelect();
	public int recommendUpdate(RecommendVO recommendVO);
	public int recommendDelete(int recNo);
	//총레코드수
	public int totalRecord(RecommendPagingVO rPVO);
	//추천코스목록
	public List<RecommendVO> recommendList(RecommendPagingVO rPVO);
	
}
