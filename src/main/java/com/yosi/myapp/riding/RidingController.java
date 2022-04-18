package com.yosi.myapp.riding;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yosi.myapp.PagingVO;

import kotlinx.serialization.json.Json;

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
	
	@GetMapping("/riding/myRidingList")
	public ModelAndView myRidingList(RidingVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickName"));
		//System.out.println(vo.getNickname());
		ModelAndView mav = new ModelAndView();
		mav.addObject("myRidingJoinList", service.myRidingJoinList(vo));
		mav.addObject("myRidingEndList", service.myRidingEndList(vo));
		mav.addObject("myRidingMadeList", service.myRidingMadeList(vo));
		mav.setViewName("riding/myRidingList");
		return mav;
	}
	
	@GetMapping("/riding/ridingWrite")
	public ModelAndView ridingWrite(RidingVO rVO) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("데이터 잘 넘어왔어요..."+rVO.getStartPointName());	
		mav.addObject("rVO", rVO );
		mav.setViewName("riding/ridingWrite");
		return mav;
	}
	
	@PostMapping("/riding/ridingWrite")
	public ModelAndView ridingWritepost(RidingVO rVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println("데이터 잘 넘어왔어요+++"+(rVO.getCourseSendData().length()));	
		//JSONObject courseResiveData = new JSONObject(rVO.getCourseSendData());
		mav.addObject("rVO", rVO );
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
	
	@GetMapping("/riding/ridingMemberOk")
    public ResponseEntity<String> ridingMemberOk(RidingVO vo, HttpServletRequest request) {
        vo.setNickname((String)request.getSession().getAttribute("nickName"));

        // DB작업
        ResponseEntity<String> entity = null; // 데이터와 처리상태를 가진다.

        HttpHeaders headers = new HttpHeaders();

        headers.add("Content-Type", "text/html; charset=utf-8");
        try {
            service.ridingMemberInsert(vo);
            service.ridingMemberUpdate(vo);
            String msg = "<script>";
            msg += "alert('글이 등록되었습니다');";
            msg += "location.href='/riding/ridingList';";
            msg += "</script>";
            entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();

            // 등록안됨
            String msg = "<script>";
            msg += "alert('글등록이 실패하였습니다');";
            msg += "history.back();";
            msg += "</script>";
            entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
        }

        return entity;
    }
	
	//글 보기
	@GetMapping("/riding/ridingView")
    public ModelAndView ridingView(int ridingNo) {
        ModelAndView mav = new ModelAndView();
        service.cntHit(ridingNo); // 조회수 증가
        
        mav.addObject("vo", service.ridingSelect(ridingNo));
        mav.addObject("lst2", service.ridingMemberShow(ridingNo));
        mav.setViewName("riding/ridingView");
        return mav;
    }
	
	//글 수정
	@GetMapping("/ridingEdit")
	public ModelAndView ridingEdit(int ridingNo) {
		System.out.println(ridingNo);
		System.out.println("ridingEdit");
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
	@GetMapping("/ridingDel")
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
