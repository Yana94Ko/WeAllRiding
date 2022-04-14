package com.yosi.myapp.riding;

import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yosi.myapp.PagingVO;

@RestController
public class RidingController {
	@Autowired
	RidingService RidingService;
	@Inject
	RidingService service;
	
	/*
	 * @Inject RidingReplyService replyService;
	 */
	
	@GetMapping("/riding/ridingList")
	public ModelAndView ridingList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		mav.addObject("lst", service.ridingList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("riding/ridingList");
		return mav;
	}
	
	@GetMapping("/riding/ridingWrite")
	public ModelAndView ridingWrite(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", service.ridingList(pVO));
		mav.setViewName("riding/ridingWrite");
		return mav;
	}
	
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
	
	//글 보기
	@RequestMapping("/riding/ridingView")
	public ModelAndView ridingView(@RequestParam(value="ridingNo", required=false) int ridingNo) {
		 ModelAndView mav = new ModelAndView();
		 
		 
		 service.cntHit(ridingNo); // 조회수 증가
		 
		 mav.addObject("vo", service.ridingSelect(ridingNo));
		 mav.setViewName("riding/ridingView");
		 
		 return mav;
	}
	
	//글 수정
	@GetMapping("/riding/ridingEdit")
	public ModelAndView ridingEdit(int ridingNo) {
		System.out.println(ridingNo);
		ModelAndView mav = new ModelAndView();
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
			System.out.println("삭제가 안됬어요");
			mav.addObject("ridingNo", ridingNo);
			mav.setViewName("redirect:ridingView");
		}
		
		return mav;
	}

}
