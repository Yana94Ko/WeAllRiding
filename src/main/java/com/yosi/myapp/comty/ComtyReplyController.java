package com.yosi.myapp.comty;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public List<ComtyReplyVO> comtyReplyList(int no) {
		return service.comtyReplyList(no);
	}
	
}
