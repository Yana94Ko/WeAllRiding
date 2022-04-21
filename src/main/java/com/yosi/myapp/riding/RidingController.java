package com.yosi.myapp.riding;

import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yosi.myapp.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.yosi.myapp.PagingVO;
import com.yosi.myapp.RidingPagingVO;

@RestController
public class RidingController {
	@Autowired
	RidingService RidingService;
	@Inject
	RidingService service;
	@Autowired
	MemberService memberService;
	
	/*
	 * @Inject RidingReplyService replyService;
	 */
	
	@GetMapping("/riding/ridingList")
	public ModelAndView ridingList(RidingPagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		mav.addObject("lst", service.ridingList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("riding/ridingList");
		return mav;
	}
	
	@GetMapping("/riding/myRidingList")
	public ModelAndView myRidingList(RidingVO vo, HttpSession session, RidingPagingVO pVO) {
		vo.setNickname((String)session.getAttribute("nickName"));
		//System.out.println(vo.getNickname());
		ModelAndView mav = new ModelAndView();
	
		pVO.setTotalRecord1(service.totalRecord1(vo, pVO));
		mav.addObject("myRidingJoinList", service.myRidingJoinList(vo, pVO));
		mav.addObject("pVO1", pVO);
		
		pVO.setTotalRecord2(service.totalRecord2(vo, pVO));
		mav.addObject("myRidingEndList", service.myRidingEndList(vo, pVO));
		mav.addObject("pVO2", pVO);
		
		pVO.setTotalRecord3(service.totalRecord3(vo, pVO));
		mav.addObject("myRidingMadeList", service.myRidingMadeList(vo, pVO));
		mav.addObject("pVO3", pVO);
		
		mav.setViewName("riding/myRidingList");
		return mav;
	}
	@PostMapping("/riding/ridingWrite")
	public ModelAndView ridingWritepost(RidingVO rVO, RidingPagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println("데이터 잘 넘어왔어요+++"+(rVO.getCourseSendData().length()));	
		//JSONObject courseResiveData = new JSONObject(rVO.getCourseSendData());
		mav.addObject("lst", service.ridingList(pVO));
		mav.addObject("rVO", rVO );
		mav.setViewName("riding/ridingWrite");
		return mav;
	}
	//코스 정보 없이 ridingWriteOk 접근시
	@GetMapping("/riding/ridingWrite")
	public ModelAndView ridingWrite(RidingVO rVO) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("데이터 잘 넘어왔어요..."+rVO.getStartPointName());	
		mav.addObject("rVO", rVO );
		mav.setViewName("riding/ridingWrite");
		return mav;
	}
	//코스정보 받아서 ridingWriteOk 접근시
	@PostMapping("/riding/ridingWriteOk")
    public ResponseEntity<String> ridingWriteOk(RidingVO vo, HttpServletRequest request){
		vo.setNickname((String)request.getSession().getAttribute("nickName"));
		ResponseEntity<String> entity = null;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html",Charset.forName("UTF-8")));
        try {
			//글등록 성공
			service.ridingInsert(vo);
			
			//글 목록으로 이동
			String msg = "<script>alert('글이 등록되었습니다.');location.href='/riding/ridingList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {
			// 글등록 실패
			e.printStackTrace();
			//글 등록 폼으로
			String msg = "<script>alert('글등록 실패 하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 라이딩 신청
	@ResponseBody
	@GetMapping("/riding/ridingMemberOk")
	public void ridingMemberOk (RidingVO vo, HttpServletRequest request) {
		vo.setNickname((String)request.getSession().getAttribute("nickName"));
		try {
			service.ridingMemberInsert(vo);
			service.ridingMemberUpdate(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 라이딩 신청 삭제
	@GetMapping("/riding/ridingMemberCan")
	public void ridingMemberCan(RidingVO vo, HttpServletRequest request) {
		vo.setNickname((String)request.getSession().getAttribute("nickName"));
		try {
			service.ridingStateCancle(vo);
			service.ridingApplicantCntDown(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// (개설자) - 참가자 참여수락
	@ResponseBody
	@RequestMapping(value="/riding/ridingStateOk", method = RequestMethod.GET) 
	public boolean ridingStateOk(int ridingNo, RidingVO vo) { 
		service.ridingSelect(ridingNo);
		System.out.println(vo.getApplicantNickName());
		System.out.println(vo.getRidingNo());
		try { 
			service.ridingStateUpdate(vo);
			service.ridingApplicantCntUp(vo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} 
	}
	// (개설자) - 참가자 참여거절
	@ResponseBody
	@RequestMapping(value="/riding/ridingStateDel", method = RequestMethod.GET) 
	public boolean ridingStateDel(int ridingNo, RidingVO vo) {
		service.ridingSelect(ridingNo);
		System.out.println(vo.getApplicantNickName());
		System.out.println(vo.getRidingNo());
		
		try { 
			service.ridingStateDel(vo);
			return true;
		} catch (Exception e) { 
			System.out.println(e);
			e.printStackTrace();
			return false;
		}
	}
	@ResponseBody
	@RequestMapping(value="/riding/ridingStateTest", method = RequestMethod.GET) 
	public ModelAndView ridingStateTest(int ridingNo, RidingVO vo) {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject(service.ridingSelect(ridingNo));

		System.out.println(vo.getApplicantNickName());
		System.out.println(vo.getRidingNo());
		
		
		return mav; 
	}
	
	//글 보기
	@GetMapping("/riding/ridingView")
	public ModelAndView ridingView(int ridingNo,RidingVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		service.cntHit(ridingNo); // 조회수 증가
		mav.addObject("vo", service.ridingSelect(ridingNo));
		mav.addObject("lst2", service.ridingMemberShow(ridingNo));
		mav.addObject("nickName",(String)session.getAttribute("nickName"));
		String nickName = (String)session.getAttribute("nickName");
		if (nickName != null) {
			mav.addObject("resolveStatus", service.resolveStatus(nickName, ridingNo));
		}

		mav.setViewName("riding/ridingView");
		return mav;
	}
	
	//글 수정
	@GetMapping("/riding/ridingEdit")
	public ModelAndView ridingEdit(int ridingNo, RidingVO vo) {
		System.out.println(ridingNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst2", service.ridingMemberShow(ridingNo));
		mav.addObject("vo", service.ridingSelect(ridingNo));
		mav.setViewName("riding/ridingEdit");
		return mav;
	}
	
	@PostMapping("/riding/ridingEditOk")
	public ResponseEntity<String> ridingEditOk(RidingVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickName"));
		ResponseEntity<String> entity =null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			service.ridingUpdate(vo);
			
			String msg="<script>alert('글이 수정되었습니다.');location.href='/riding/ridingView?ridingNo="+vo.getRidingNo()+"';</script>";
			entity=new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글 수정 실패 하였습니다.'); history.go(-1);</script>";
			entity=new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
				
	}
	// 글 삭제
	@GetMapping("/riding/ridingDel")
	public ModelAndView ridingDel(int ridingNo, HttpSession session, ModelAndView mav) {
		String nickname = (String)session.getAttribute("nickName");
		int result = service.ridingDelete(ridingNo, nickname);
		if(result>0) {
			//삭제됨
			mav.setViewName("redirect:ridingList");
			
		} else {
			//삭제 안됨
			System.out.println("삭제가 안됐어요");
			mav.addObject("ridingNo", ridingNo);
			mav.setViewName("redirect:ridingView");
		}
		
		return mav;
	}
	// 라이딩 후기
	// 글 보기
	@GetMapping("/riding/ridingReview")
	public ModelAndView ridingReview(int ridingNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.ridingSelect(ridingNo));
		mav.addObject("lst2", service.ridingMemberShow(ridingNo));
		mav.setViewName("riding/ridingReview");
		return mav;
	}

	// 리뷰 등록
	@RequestMapping(value="/riding/ridingReviewWriteOk", method=RequestMethod.POST)
	public int ridingReviewWriteOk (RidingVO vo, HttpSession session) {
		System.out.println(vo.getRidingReviewComent());
		vo.setNickname((String)session.getAttribute("nickName"));
		service.ridingCountUp(vo); // 참가 수 증가
		return service.ridingReviewWrite(vo);
	}
	// 리뷰목록
	@RequestMapping("/riding/ridingReviewList")
	public List<RidingVO> ridingReviewList(int ridingNo) {
		return service.ridingReviewList(ridingNo);
	}
		
		
		
	// (참가자)회원평가 - 추천
	@ResponseBody
	@PostMapping("/riding/ridingScoreUpOk")
	public int ridingScoreUpOk(@RequestBody RidingVO vo) {
		int result = service.ridingScoreUp(vo);
		if(result==1){
			return memberService.ScoreUpdate(vo.getNickname(), 1);
		}
		return result;
	}
	
	// (참가자)회원평가 - 비추
	@ResponseBody
	@PostMapping("/riding/ridingScoreDownOk")
	public int ridingScoreDownOk(@RequestBody RidingVO vo) {
		int result = service.ridingScoreDown(vo);
		if(result==1){
			return memberService.ScoreUpdate(vo.getNickname(), -1);
		}
		return result;
	}
	
}
