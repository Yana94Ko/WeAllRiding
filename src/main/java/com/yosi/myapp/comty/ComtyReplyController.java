package com.yosi.myapp.comty;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

public class ComtyReplyController {
	@Inject
	ComtyReplyService service;
	
	//1. 댓글 등록
	@RequestMapping(value="/reply/writeOk", method=RequestMethod.POST)
	public int writeOk(ComtyReplyVO vo, HttpSession session) {
		//1) DB의 replyBoard에 저장할 userid를 session의 logId값으로 지정(현재 로그인된 아이디)
		vo.setNickname((String)session.getAttribute("logId"));
		//2) 해당 아이디로, 댓글 등록(sql)
		return service.replyWrite(vo);
	}
	//2. 댓글 목록
	@RequestMapping("/reply/list")
	public List<ComtyReplyVO> list(int comtyNo) {
		return service.replyList(comtyNo);
	}
	//3. 댓글 수정
	@PostMapping("/reply/editOk")
	public int editOk(ComtyReplyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("logId"));
		return service.replyEdit(vo);
	}
	//4. 댓글 삭제
	@GetMapping("/reply/del")
	public int delOk(int comtyReplyNo, HttpSession session) {
		return service.replyDel(comtyReplyNo, (String)session.getAttribute("logId"));
	}
}
