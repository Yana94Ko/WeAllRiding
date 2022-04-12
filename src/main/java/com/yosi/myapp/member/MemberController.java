package com.yosi.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session) throws ParseException {
        ResponseEntity<String> entity = null;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/html; charset=utf-8");
        try {
            MemberVO rVO = service.loginCheck(vo);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date suspendDate = rVO.getSuspendDate() == null ? new Date() : formatter.parse(rVO.getSuspendDate()); //정지일이 없으면 현재 날짜, 있으면 DB에 등록된 정지일을 파싱해서 넣는다.
            if (suspendDate.compareTo(new Date()) <= 0) { // 정지일 <= 현재날짜 로그인
                session.setAttribute("userId", rVO.getUserId());
                session.setAttribute("nickName", rVO.getNickname());
                session.setAttribute("logStatus", "Y");
                session.setAttribute("isAdmin", rVO.getIsAdmin()); // 운영자인 경우 1, 아닌 경우 0
                String msg="<script>location.href='/';</script>";
                entity = new ResponseEntity<String> (msg, headers, HttpStatus.OK);
            } else if (suspendDate.compareTo(new Date()) > 0) { // 정지일 > 현재날짜 로그인 실패
                String msg="<script>alert('정지된 회원입니다');location.href='/';</script>";
                entity = new ResponseEntity<String> (msg, headers, HttpStatus.BAD_REQUEST);
            } else { // 일치하는 ID, PWD가 없다면 예외 발생
                throw new Exception();
            }
        }
        catch(Exception e) { // 예외처리 로그인 실패
            e.printStackTrace();
            String msg="<script>alert('로그인 실패');history.go(-1);</script>";
            entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
        }
        return entity;
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
    @GetMapping("/phoneCheck")
    @ResponseBody
    public String sendSMS(@RequestParam("userTel") String userTel) {
        int randomNumber = (int)((Math.random() * (9999 - 1000 + 1)) + 1000);
        service.certifiedPhone(userTel, randomNumber);
        return Integer.toString(randomNumber);
    }
}