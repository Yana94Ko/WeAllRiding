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
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        Date suspendDate = formatter.parse(vo2.getSuspendDate());
        Date nowDate = new Date();
        if (suspendDate.compareTo(new Date()) >= 0) {
            session.setAttribute("logId", vo2.getUserId());
            session.setAttribute("logName", vo2.getNickname());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("isAdmin", vo2.getIsAdmin());
            mav.setViewName("redirect:/");
        } else if (suspendDate.compareTo(new Date()) < 0){
            mav.setViewName("redirect:/memberSuspended");
        } else {
            mav.setViewName("redirect:loginForm");
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
