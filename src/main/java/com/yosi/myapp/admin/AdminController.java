package com.yosi.myapp.admin;




import com.yosi.myapp.PagingVO;
import com.yosi.myapp.comty.ComtyService;
import com.yosi.myapp.member.MemberController;
import com.yosi.myapp.member.MemberService;
import com.yosi.myapp.member.MemberVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RequestMapping("/admin/")
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	ComtyService comtyService;

	//기능 : Console 창에 해당 로그가 찍힌다. 따라서 프로그램이 오류 발생 시 어디서 어떤 이유로 오류가 발생하는지 알 수 있어 이슈 처리가 용이하다.
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 관리자 페이지에 가져올 데이터
	@GetMapping("adminMain")
	public String adminMain(Model model) {

		//회원 목록 가져오기
		model.addAttribute("memberList", memberService.memberList());
		//커뮤니티 목록 가져오기
		model.addAttribute("comtyList", comtyService.comtyList());

		return "/admin/adminMain";
	}


	//관리자 페이지 회원정보 수정
	@RequestMapping(value="admin/adminMain/", method = RequestMethod.POST)
	public String AdminUpdate(MemberVO vo) throws Exception {
		memberService.AdminUpdate(vo);
		return "redirect:/admin/adminMain";
	}

	//관리자 페이지 회원정보 상세보기
	@GetMapping("adminView")
	public String AdminView(String userId, Model model) {
		model.addAttribute("AdminView", memberService.AdminView(userId));
		//콘솔에 어떤 아이디인지 출력
		logger.info("클릭한 아이디 : "+userId);
		return "admin/adminView";
	}
}


