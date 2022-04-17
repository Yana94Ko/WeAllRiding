package com.yosi.myapp.comty;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class ComtyReplyController {
	@Inject
	ComtyReplyService service;
	
	// 댓글 등록
	@RequestMapping(value="/comty/comtyReplyWriteOk", method=RequestMethod.POST)
	public int comtyReplyWriteOk (ComtyReplyVO vo, HttpSession session) {
		
		vo.setNickname((String)session.getAttribute("nickName"));
		return service.comtyReplyWrite(vo);
	}
	// 댓글목록
	@RequestMapping("/comty/comtyReplyList")
	public List<ComtyReplyVO> comtyReplyList(int comtyNo) {
		return service.comtyReplyList(comtyNo);
	}

	// 댓글수정
	@PostMapping("/comty/comtyReplyEditOk")
	public int comtyReplyEditOk(ComtyReplyVO vo, HttpSession session) {
		vo.setNickname((String) session.getAttribute("nickName"));
		return service.comtyReplyEdit(vo);
	}

	// 댓글삭제
	@GetMapping("/comty/comtyReplyDel")
	public int comtyReplyDelOk(int comtyReplyNo, HttpSession session) {
		return service.comtyReplyDel(comtyReplyNo, (String) session.getAttribute("nickName"));
	}
}