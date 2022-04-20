package com.yosi.myapp.admin;




import com.yosi.myapp.PagingVO;

import com.yosi.myapp.aMemberPagingVO;
import com.yosi.myapp.comty.ComtyService;
import com.yosi.myapp.member.MemberController;
import com.yosi.myapp.member.MemberService;
import com.yosi.myapp.member.MemberVO;
import com.yosi.myapp.recommend.RecommendPagingVO;
import com.yosi.myapp.recommend.RecommendService;
import com.yosi.myapp.recommend.RecommendVO;
import com.yosi.myapp.riding.RidingService;
import com.yosi.myapp.riding.RidingVO;
import com.yosi.myapp.shop.ShopPagingVO;
import com.yosi.myapp.shop.ShopService;
import com.yosi.myapp.shop.ShopVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import java.util.List;


@RequestMapping("/admin/")
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class AdminController {
	@Autowired
	MemberService memberService;
	@Autowired
	ComtyService comtyService;
	@Autowired
	ShopService shopService;
	@Autowired
	RidingService ridingService;
	@Autowired
	RecommendService recommendService;

	// 관리자 메인 페이지
	@GetMapping("adminMain")
	public String adminMain(Model model) {

		model.addAttribute("adminMain", model);

		return("admin/adminMain");
	}

	// 관리자 회원관리 페이지
	@GetMapping("adminMember")
	public ModelAndView memberList(Model model, aMemberPagingVO mVO) {
		ModelAndView mav = new ModelAndView();

		mVO.setTotalRecord(memberService.totalRecord(mVO));

		mav.addObject("memberList", memberService.memberList(mVO));
		mav.addObject("mVO", mVO);

		mav.setViewName("admin/adminMember");
		return mav;
	}
	//관리자 페이지 회원정보 상세보기
	@RequestMapping("adminMember")
	public ModelAndView adminMember(@RequestParam String userId) {
		System.out.println(userId);
		MemberVO vo = memberService.AdminView(userId);
		if (vo.getSuspendDate()!=null) {
			LocalDateTime d = LocalDateTime.parse(vo.getSuspendDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			vo.setSuspendDate(d.toString());
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("av", vo);

		mav.setViewName("admin/adminMember");
		return mav;
	}
	@RequestMapping("adminMember2")
	@ResponseBody
	public MemberVO adminView2(@RequestParam String userId){
		return memberService.AdminView(userId);
	}
	// 관리자 커뮤니티관리 페이지
	@GetMapping("adminComty")
	public ModelAndView allSelect(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();

		pVO.setTotalRecord(comtyService.totalRecord(pVO));

		mav.addObject("lst", comtyService.allSelect(pVO));
		mav.addObject("pVO", pVO);

		mav.setViewName("admin/adminComty");
		return mav;
	}

	//관리자 페이지 회원정보 수정
	@RequestMapping(value="adminMemberEdit", method = RequestMethod.POST)
	public String AdminUpdate(MemberVO vo) throws Exception {
		if(vo.getSuspendDate().equals("")){
			vo.setSuspendDate(null);
		}
		memberService.AdminUpdate(vo);
		return "redirect:/admin/adminMember";
	}


	// 관리자 페이지 정비샵 리스트 출력
	@GetMapping("adminShop")
	public ModelAndView AdminShop(ShopPagingVO sPVO) {
		ModelAndView mav = new ModelAndView();
		
		sPVO.setTotalRecord(shopService.totalRecord(sPVO));
		mav.addObject("list", shopService.shopList(sPVO));
		mav.addObject("sPVO", sPVO);
		mav.addObject("shopVO", shopService.shopAllSelect());
		mav.setViewName("admin/adminShop");
		return mav;
	}
	
	
	//관리자 페이지정비샵 정보 삭제하기
	@GetMapping("shopDelete")
	public ModelAndView shopDelete(int shopId, ModelAndView mav) {
		shopService.shopDelete(shopId);
		mav.setViewName("redirect:/admin/adminShop");
		return mav;
	}
	

	// 관리자 페이지 라이딩 리스트 출력
	@GetMapping("adminRiding")
	public ModelAndView AdminRiding(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();

		pVO.setTotalRecord(ridingService.totalRecord(pVO));

		mav.addObject("ridingList", ridingService.ridingList(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("admin/adminRiding");

		return mav;

	}
	
	// 관리자 페이지 정비샵 리스트 출력
	@GetMapping("adminRecommend")
	public ModelAndView AdminRecommend(RecommendPagingVO rPVO) {
		ModelAndView mav = new ModelAndView();
		rPVO.setTotalRecord(recommendService.totalRecord(rPVO));
		mav.addObject("list", recommendService.recommendList(rPVO));
		mav.addObject("rPVO", rPVO);
		mav.addObject("RecommendVO", shopService.shopAllSelect());
		mav.setViewName("admin/adminRecommend");
		return mav;
	}
	
	// 추천 코스 작성 페이지
	@GetMapping("adminRecommendWrite")
	public ModelAndView adminRecommendWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminRecommendWrite");
		return mav;
	}
	
	// recommendWrite에서 입력받은 정보 recommend DB에 추가
	@PostMapping("adminRecommendWriteOk")
	public ResponseEntity<String> adminRecommendWriteOk(RecommendVO recommendVO, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		try {// 추천 경로 등록 성공
			recommendService.recommendInsert(recommendVO);
			String msg = "<script>alert('추천경로가 등록되었습니다.');location.href='/admin/adminRecommend';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// 추천경로 등록 실패
			e.printStackTrace();
			String msg = "<script>alert('추천경로 등록을 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	} 
	
	// 추천 경로 수정 폼
	@GetMapping("adminRecommendEdit")
	public ModelAndView adminRecommendEdit(int recNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("recommendVO", recommendService.recommendSelect(recNo));
		mav.setViewName("admin/adminRecommendEdit");
		return mav;
	}
	
	// recommendWrite에서 입력받은 정보 recommend DB에 추가
	@PostMapping("adminRecommendEditOk")
	public ResponseEntity<String> adminRecommendEditOk(RecommendVO recommendVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		try {// 추천 경로 수정 성공
			recommendService.recommendUpdate(recommendVO);
			String msg = "<script>alert('추천경로가 수정되었습니다.');location.href='/recommendView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

		} catch (Exception e) {// 추천경로 등록 실패
			e.printStackTrace();
			String msg = "<script>alert('추천경로 수정을 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	} 
	
	@GetMapping("adminRecommendDelete")
	public ModelAndView recommendDelete(int recNo, ModelAndView mav) {
		recommendService.recommendDelete(recNo);
		mav.setViewName("redirect:/adminRecommend");
		return mav;
	}
	
}
