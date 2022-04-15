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
public class RidingReplyController {
	@Inject
	RidingReplyService service;
	
	// 댓글 등록
	@RequestMapping(value="/riding/ridingReplyWriteOk", method=RequestMethod.POST)
	public int ridingReplyWriteOk (RidingReplyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickName"));
		return service.ridingReplyWrite(vo);
	}
	// 댓글목록
	@RequestMapping("/riding/ridingReplyList")
	public List<RidingReplyVO> ridingReplyList(int ridingNo) {
		return service.ridingReplyList(ridingNo);
	}

	// 댓글수정
	@PostMapping("/riding/ridingReplyEditOk")
	public int ridingReplyEditOk(RidingReplyVO vo, HttpSession session) {
		vo.setNickname((String) session.getAttribute("nickName"));
		return service.ridingReplyEdit(vo);
	}

	// 댓글삭제
	@GetMapping("/riding/ridingReplyDel")
	public int ridingReplyDelOk(int ridingReplyNo, HttpSession session) {
		return service.ridingReplyDel(ridingReplyNo, (String) session.getAttribute("nickName"));
	}
}