package com.yosi.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.ModelAndView;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.mail.SimpleMailMessage;

@Controller
@RequestMapping("/member/")
@Service
public class MemberController {
    @Autowired
    MemberService service;
    @Autowired
    JavaMailSender mailSender;

    @GetMapping("loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("loginOk")
    public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session, HttpServletRequest request) throws ParseException {
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
                String msg = "";
                if (rVO.getIsAdmin().equals("1")){ //운영자
                    msg="<script>location.href='/admin/adminMain';</script>";
                }
                else { // 일반회원
                    String dest = (String)session.getAttribute("dest");
                    String redirect = (dest == null) ? "/" : dest;
                    msg="<script>location.href='" + redirect + "';</script>";
                }
                entity = new ResponseEntity<String> (msg, headers, HttpStatus.OK);
            } else if (suspendDate.compareTo(new Date()) > 0) { // 정지일 > 현재날짜 로그인 실패
                String msg="<script>alert('정지된 회원입니다. 사유는 관리자에게 문의하시길 바랍니다.');location.href='/';</script>";
                entity = new ResponseEntity<String> (msg, headers, HttpStatus.OK);

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

    @GetMapping("memberFind")
    public String memberFind() {
        return "member/memberFind";
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

    @PostMapping("/findUserId")
    @ResponseBody
    public MemberVO findUserId(@RequestBody MemberVO vo) {
        return service.findUserId(vo);
    }
    @PostMapping("/isValidEmail")
    @ResponseBody
    public MemberVO isValidEmail(@RequestBody MemberVO vo) {
        return service.isValidEmail(vo);
    }

    @PostMapping("/findUserPwd")
    @ResponseBody
    public int findUserPwd(@RequestBody MemberVO vo) throws MessagingException, IOException {
        char[] charSet = new char[]{
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&'}; //임시 비밀번호 형성을 위한 문자열
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom(); //보안화된 난수 생성
        sr.setSeed(new Date().getTime()); //난수의 씨앗
        int idx = 0;
        int len = charSet.length;
        for (int i = 0; i < 10; i++) {
            idx = sr.nextInt(len);
            sb.append(charSet[idx]); //난수화된 숫자를 문자열로 치환 후 합쳐진 문자열 만들기
        }
        String tempPwd = sb.toString();
        vo.setUserPwd(tempPwd); //난수화된 임시 비밀번호를 vo에 넣고
        int result = service.findUserPwd(vo); //회원정보를 업데이트한다.
        MimeMessage message = mailSender.createMimeMessage();
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getUserEmail(),vo.getUserName(),"UTF-8"));
        message.setFrom("weallriding@gmail.com");
        message.setSubject("[WeAllRidng] 임시 비밀번호 발송");
        String htmlStr = "<div style='font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #555; margin: 100px auto; padding: 30px 0; box-sizing: border-box;'>";
        htmlStr += "<h1 style='margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;'>";
        htmlStr += "<span style='font-size: 15px; margin: 0 0 10px 3px;'>WeAllRiding</span><br />";
        htmlStr += "<span style='color: #555;'>임시 비밀번호</span> 안내입니다.";
        htmlStr += "<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>안녕하세요.<br />";
        htmlStr += "요청하신 임시 비밀번호가 생성되었습니다.<br />감사합니다.</p>";
        htmlStr += "<p style='font-size: 16px; margin: 40px 5px 20px; line-height: 28px;'>임시 비밀번호: <br /><span style='font-size: 24px;'>";
        htmlStr += tempPwd;
        htmlStr += "</span></p>";
        htmlStr += "<a style='color: #FFFFFF; text-decoration: none; text-align: center;' href='http://localhost:8091/member/loginForm' target='_blank'><p style='display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #555; line-height: 45px; vertical-align: middle; font-size: 16px;'>로그인 하러가기</p></a>";
        htmlStr += "<div style='border-top: 1px solid #DDD; padding: 5px;'><p style='font-size: 13px; line-height: 21px; color: #555;'>";
        htmlStr += "만약 버튼이 정상적으로 클릭되지 않는다면, 아래 링크를 복사하여 접속해 주세요.<br />";
        htmlStr += "http://localhost:8091/member/loginForm";
        htmlStr += "</p></div></div>";
        message.setText(htmlStr, "utf-8","html");
        mailSender.send(message);
        return result;
    }
    @GetMapping("/memberEdit")
    public ModelAndView memberEdit(HttpSession session) {
        String userId = (String)session.getAttribute("userId");
        MemberVO vo = service.memberSelect(userId);
        ModelAndView mav = new ModelAndView();
        mav.addObject("vo", vo);
        mav.setViewName("member/memberEdit");
        return mav;
    }
    @PostMapping("memberEditOk")
    public ModelAndView memberEidtOk(MemberVO vo, HttpSession session) {
        vo.setUserId((String)session.getAttribute("userId"));
        service.memberUpdate(vo);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:memberEdit");
        return mav;
    }
    @PostMapping("MemberDelete")
    @ResponseBody
    public int memberDelete(@RequestBody MemberVO vo) {
        return service.memberDelete(vo);
    }
    @PostMapping("checkId")
    @ResponseBody
    public MemberVO checkId (@RequestBody MemberVO vo) {
        return service.checkId(vo);
    }
    @PostMapping("checkNick")
    @ResponseBody
    public MemberVO checkNick (@RequestBody MemberVO vo) {
        return service.checkNick(vo);
    }
    @PostMapping("checkTel")
    @ResponseBody
    public MemberVO checkTel (@RequestBody MemberVO vo) {
        return service.checkTel(vo);
    }
}