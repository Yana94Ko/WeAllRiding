package com.yosi.myapp.recommend;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class RecommendServiceImpl implements RecommendService {
	@Inject
	RecommendDAO dao;

	@Override
	public int recommendCheck(int recNo) {
		return dao.recommendCheck(recNo);
	}

	@Override
	public RecommendVO recommendSelect(int recNo) {
		return dao.recommendSelect(recNo);
	}

	@Override
	public int recommendInsert(RecommendVO recVO) {
		return dao.recommendInsert(recVO);
	}

	@Override
	public List<RecommendVO> recommendAllSelect() {
		return dao.recommendAllSelect();
	}

	@Override
	public int recommendUpdate(RecommendVO recommendVO) {
		return dao.recommendUpdate(recommendVO);
	}

	@Override
	public int recommendDelete(int recNo) {
		return dao.recommendDelete(recNo);
	}

	@Override
	public int totalRecord(RecommendPagingVO rPVO) {
		return dao.totalRecord(rPVO);
	}

	@Override
	public List<RecommendVO> recommendList(RecommendPagingVO rPVO) {
		return dao.recommendList(rPVO);
	}


}
