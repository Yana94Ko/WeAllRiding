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
	
	// 추천 코스 작성 페이지
	@GetMapping("/adminRecommendWrite")
	public ModelAndView adminRecommendWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/recommend/adminRecommendWrite");
		return mav;
	}

	// recommendWrite에서 입력받은 정보 recommend DB에 추가
	@PostMapping("/adminRecommendWriteOk")
	public ResponseEntity<String> adminRecommendWriteOk(RecommendVO recommendVO, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		try {// 추천 경로 등록 성공
			service.recommendInsert(recommendVO);
			String msg = "<script>alert('추천경로가 등록되었습니다.');location.href='/recommendView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// 추천경로 등록 실패
			e.printStackTrace();
			String msg = "<script>alert('추천경로 등록을 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	} 
	
	// 추천 경로 수정 폼
	@GetMapping("/adminRecommendEdit")
	public ModelAndView adminRecommendEdit(int recNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("recommendVO", service.recommendSelect(recNo));
		mav.setViewName("recommend/adminRecommendEdit");
		return mav;
	}
	
	// recommendWrite에서 입력받은 정보 recommend DB에 추가
	@PostMapping("/adminRecommendEditOk")
	public ResponseEntity<String> adminRecommendEditOk(RecommendVO recommendVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		try {// 추천 경로 수정 성공
			service.recommendUpdate(recommendVO);
			String msg = "<script>alert('추천경로가 수정되었습니다.');location.href='/recommendView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

		} catch (Exception e) {// 추천경로 등록 실패
			e.printStackTrace();
			String msg = "<script>alert('추천경로 수정을 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	} 
	
	@GetMapping("/recommendDelete")
	public ModelAndView recommendDelete(int recNo, ModelAndView mav) {
		service.recommendDelete(recNo);
		mav.setViewName("redirect:recommendView");
		return mav;
	}
	
}
