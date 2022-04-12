package com.yosi.myapp.member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
