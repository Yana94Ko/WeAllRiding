package com.yosi.myapp.member;

import net.nurigo.sdk.message.response.SingleMessageSentResponse;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);
}
