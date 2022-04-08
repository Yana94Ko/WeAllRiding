package com.yosi.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/member/")
public class MemberController {
    @Autowired
    MemberService service;

    @GetMapping("loginForm")
    public String loginForm() {
        return "member/loginForm";
    }
    @PostMapping("loginOk")
    public ModelAndView loginOk(MemberVO vo, HttpSession session) throws ParseException {
        MemberVO vo2 = service.loginCheck(vo);
        ModelAndView mav = new ModelAndView();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date suspendDate = formatter.parse(vo2.getSuspendDate()); // DB에 있는 정지 기간을 Date 객체로 파싱
        if (suspendDate.compareTo(new Date()) <= 0) { // 현재 날짜와 비교해서 이전이면 로그인
            session.setAttribute("logId", vo2.getUserId());
            session.setAttribute("logName", vo2.getNickname());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("isAdmin", vo2.getIsAdmin()); // 운영자인 경우 1, 아닌 경우 0
            mav.setViewName("redirect:/");
        } else if (suspendDate.compareTo(new Date()) > 0){ //정지 기간이 남아있으면 memberSuspended 페이지로 이동시키고, alert를 띄운다
            mav.setViewName("redirect:/memberSuspended");
        } else {
            mav.setViewName("redirect:loginForm"); // vo가 null인 경우 다시 로그인폼으로 돌아가기
        }
        return mav;
    }
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }
    @GetMapping("memberForm")
    public String memberForm() {
        return "member/memberForm";
    }
    @PostMapping("memberOk")
    public String memberFormOk(MemberVO vo, Model model) {
        int cnt = service.memberInsert(vo);
        model.addAttribute("cnt", cnt);
        return "member/memberResult";
    }
}
