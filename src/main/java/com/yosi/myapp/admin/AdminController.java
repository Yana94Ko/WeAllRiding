package com.yosi.myapp.admin;




import com.yosi.myapp.PagingVO;
import com.yosi.myapp.aMemberPagingVO;
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


import javax.inject.Inject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import java.util.List;


@RequestMapping("/admin/")
@Controller // 현재의 클래스를 controller bean에 등록시킴
public class AdminController {

	@Autowired
	MemberService memberService;
	@Autowired
	ComtyService comtyService;



	// 관리자 메인 페이지
	@GetMapping("adminMain")
	public String adminMain(Model model) {

		model.addAttribute("adminMain", model);

		return("admin/adminMain");
	}

	// 관리자 회원관리 페이지
	@GetMapping("adminMember")
	public ModelAndView memberList(Model model, aMemberPagingVO mVO) {
		ModelAndView mav = new ModelAndView();

		mVO.setTotalRecord(memberService.totalRecord(mVO));

		mav.addObject("memberList", memberService.memberList(mVO));
		mav.addObject("mVO", mVO);

		mav.setViewName("admin/adminMember");
		return mav;
	}
	//관리자 페이지 회원정보 상세보기
	@RequestMapping("adminMember")
	public ModelAndView AdminView(@RequestParam String userId) {
		System.out.println(userId);
		MemberVO vo = memberService.AdminView(userId);
		if (vo.getSuspendDate()!=null) {
			LocalDateTime d = LocalDateTime.parse(vo.getSuspendDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
			vo.setSuspendDate(d.toString());
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("av", vo);

		mav.setViewName("admin/adminMember");
		return mav;
	}

	// 관리자 커뮤니티관리 페이지
	@GetMapping("adminComty")
	public ModelAndView allSelect(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();

		pVO.setTotalRecord(comtyService.totalRecord(pVO));

		mav.addObject("lst", comtyService.allSelect(pVO));
		mav.addObject("pVO", pVO);

		mav.setViewName("admin/adminComty");
		return mav;
	}

	//관리자 페이지 회원정보 수정
	@RequestMapping(value="adminMemberEdit", method = RequestMethod.POST)
	public String AdminUpdate(MemberVO vo) throws Exception {
		if(vo.getSuspendDate().equals("")){
			vo.setSuspendDate(null);
		}
		memberService.AdminUpdate(vo);
		return "redirect:/admin/adminMember";
	}

}


