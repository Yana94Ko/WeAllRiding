package com.yosi.myapp.riding;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yosi.myapp.PagingVO;

@RestController
public class RidingMemberController {
	@Autowired
	RidingMemberService RidingMemberService;
	
	@Inject
	RidingMemberService service;
	
	@RequestMapping(value="/riding/ridingMemberOk", method=RequestMethod.GET)
	public int ridingMemberOk (RidingMemberVO vo, HttpSession session) {
		System.out.println("오냐?");
		System.out.println(vo.getRidingSubject());
		vo.setNickname((String)session.getAttribute("nickName"));
		System.out.println(vo.getGender());
		System.out.println(vo.getRidingNo());
		System.out.println(vo.getStartDate());
		System.out.println(vo.getNickname());
		return service.ridingMemberInsert(vo);
	}
	
}
