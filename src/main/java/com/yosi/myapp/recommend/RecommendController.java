package com.yosi.myapp.recommend;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class RecommendController {
	@Inject
	RecommendService service;

	// 추천 코스 페이지
	@GetMapping("/recommendView")
	public ModelAndView recommendView(RecommendPagingVO rPVO) {
		ModelAndView mav = new ModelAndView();
		// 총 레코드 수
		rPVO.setTotalRecord(service.totalRecord(rPVO));
		
		// db처리
		mav.addObject("list", service.recommendList(rPVO));
		mav.addObject("rPVO", rPVO);
		mav.addObject("recommendVO", service.recommendAllSelect());
		mav.setViewName("/recommend/recommendView");
		return mav;
	}
}
