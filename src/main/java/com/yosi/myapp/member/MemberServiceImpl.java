package com.yosi.myapp.member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO dao;

    @Override
    public MemberVO loginCheck(MemberVO vo) {
        return dao.loginCheck(vo);
    }

    @Override
    public int memberInsert(MemberVO vo) {
        return dao.memberInsert(vo);
    }

    @Override
    public void certifiedPhone(String userTel, int randomNumber) {
        DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSKKC73RJXPIMRP","CLORVTKEGBQEYIGM9HK3YO2TRKWW8DWL","https://api.coolsms.co.kr");
        Message message = new Message();
        message.setFrom("01048039287");
        message.setTo(userTel);
        message.setText("[WeAllRiding] 인증번호는 " +randomNumber+ "입니다.");
        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
    }

    // 관리자 페이지 회원 목록
    @Override
    public List<MemberVO> memberList() {
        return dao.memberList();
    }

    public MemberVO findUserId(MemberVO vo) {
        return dao.findUserId(vo);
    }

    @Override
    public MemberVO isValidEmail(MemberVO vo) {
        return dao.isValidEmail(vo);
    }

    @Override
    public int findUserPwd(MemberVO vo) {
        return dao.findUserPwd(vo);
    }

    @Override
    public MemberVO memberSelect(String UserId) {
        return dao.memberSelect(UserId);
    }

    @Override
    public int memberUpdate(MemberVO vo) {
        return dao.memberUpdate(vo);
    }

    @Override
    public int memberDelete(MemberVO vo) {
        return dao.memberDelete(vo);
    }

    @Override
    public MemberVO checkId(MemberVO vo) {
        return dao.checkId(vo);
    }

    @Override
    public MemberVO checkNick(MemberVO vo) {
        return dao.checkNick(vo);
    }

    @Override
    public MemberVO checkTel(MemberVO vo) {
        return dao.checkTel(vo);
    }

    @Override
    public List<Map<String,String>> genderCount() {
        return dao.genderCount();
    }

    @Override
    public Map<String,String> ageCount() {
        return dao.ageCount();
    }

}
