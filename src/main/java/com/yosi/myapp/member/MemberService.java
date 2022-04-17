package com.yosi.myapp.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);

    //관리자 페이스 리스트
    public List<MemberVO> memberList();
    public MemberVO findUserId(MemberVO vo);
    public MemberVO isValidEmail(MemberVO vo);
    public int findUserPwd(MemberVO vo);
    public MemberVO memberSelect(String userId);
    public int memberUpdate(MemberVO vo);
    public int memberDelete(MemberVO vo);
    public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
    public List<Map<String,String>> genderCount();
    public Map<String,String> ageCount();

}
