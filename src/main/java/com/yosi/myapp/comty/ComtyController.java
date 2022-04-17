package com.yosi.myapp.comty;

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
public class ComtyController {
	@Autowired
	ComtyService ComtyService;
	@Inject
	ComtyService service;

	@Inject
	ComtyReplyService replyService;

	@GetMapping("/comty/comtyList")
	public ModelAndView allSelect(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		mav.addObject("lst", service.allSelect(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("comty/comtyList");
		return mav;
	}
	
	@GetMapping("/comty/comtyWrite")
	public ModelAndView comtyWrite(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lst", service.allSelect(pVO));
		mav.setViewName("comty/comtyWrite");
		return mav;
	}

	@PostMapping("/comty/comtyWriteOk")
    public ResponseEntity<String> comtyWriteOk(ComtyVO vo, HttpServletRequest request){
		vo.setNickname((String)request.getSession().getAttribute("userId"));
		ResponseEntity<String> entity = null;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("text", "html",Charset.forName("UTF-8")));
        try {
			//글등록 성공
			service.comtyInsert(vo);
			
			//글 목록으로 이동
			String msg = "<script>alert('글이 등록되었습니다.');location.href='/comty/comtyList';</script>";
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
	@RequestMapping("/comty/comtyView")
	public ModelAndView comtyView(@RequestParam("comtyNo") int comtyNo) {
		 ModelAndView mav = new ModelAndView();

		 service.cntHit(comtyNo); // 조회수 증가

		 mav.addObject("vo", service.comtySelect(comtyNo));
		 mav.setViewName("comty/comtyView");


		 return mav;
	}

	//글 수정
	@GetMapping("/comty/comtyEdit")
	public ModelAndView comtyEdit( int comtyNo) {
		ModelAndView mav = new ModelAndView();
		 mav.addObject("vo", service.comtySelect(comtyNo));
		 mav.setViewName("comty/comtyEdit");
		 return mav;
	}

	@PostMapping("/comty/comtyEditOk")
	public ResponseEntity<String> comtyEditOk(ComtyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("userId"));

		ResponseEntity<String> entity =null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			service.comtyUpdate(vo);
			
			String msg="<script>alert('글이 수정되었습니다.');location.href='/comty/comtyView?comtyNo="+vo.getComtyNo()+"';</script>";
			entity=new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글 수정 실패 하였습니다.'); history.go(-1);</script>";
			entity=new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
				
	}
	// 글 삭제
	@GetMapping("/comty/comtyDel")
	public ModelAndView comtyDel(int comtyNo, HttpSession session, ModelAndView mav) {
		String nickname = (String)session.getAttribute("userId");
		int result = service.comtyDelete(comtyNo, nickname);
		if(result>0) {
			//삭제됨
			mav.setViewName("redirect:comtyList");
			
		} else {
			//삭제 안됨
			mav.addObject("comtyNo", comtyNo);
			mav.setViewName("redirect:comtyView");
		}

		return mav;
	}


}