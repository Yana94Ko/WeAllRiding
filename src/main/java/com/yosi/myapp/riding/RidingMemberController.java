package com.yosi.myapp.riding;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class RidingMemberController {
	@Inject
	RidingMemberService service;
	
	// 댓글 등록
	@RequestMapping(value="/riding/ridingMemberWriteOk", method=RequestMethod.POST)
	public int ridingMemberWriteOk (RidingMemberVO vo, HttpSession session) {
		
		vo.setNickname((String)session.getAttribute("nickName"));
		return service.ridingMemberWrite(vo);
	}
	// 댓글목록
	@RequestMapping("/riding/ridingMemberList")
	public List<RidingMemberVO> ridingMemberList(int ridingNo) {
		return service.ridingMemberList(ridingNo);
	}
	
	// 댓글삭제
	@GetMapping("/riding/ridingMemberDel")
	public int ridingMemberDelOk(int ridingMemberNo, HttpSession session) {
		return service.ridingMemberDel(ridingMemberNo, (String) session.getAttribute("nickName"));
	}
}