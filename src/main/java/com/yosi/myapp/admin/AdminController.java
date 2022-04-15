package com.yosi.myapp.admin;




import com.yosi.myapp.PagingVO;
import com.yosi.myapp.comty.ComtyService;
import com.yosi.myapp.comty.ComtyVO;
import com.yosi.myapp.member.MemberService;
import com.yosi.myapp.member.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Locale;


@RequestMapping("/admin/")
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	ComtyService comtyService;


	// 관리자 페이지에 가져올 데이터
	@GetMapping("adminMain")
	public String adminMain(PagingVO pVO, Model model) {

		//회원 목록 가져오기
		model.addAttribute("memberList", memberService.memberList());

		model.addAttribute("comtyList", comtyService.comtyList());

		return "/admin/adminMain";
	}



}
