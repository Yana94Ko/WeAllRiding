package com.yosi.myapp.member;

import com.yosi.myapp.PagingVO;
import com.yosi.myapp.aMemberPagingVO;
import java.util.List;
import java.util.Map;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);

    //관리자 페이지 리스트
    public List<MemberVO> memberList(aMemberPagingVO mVO);
    public int totalRecord(aMemberPagingVO mVO);

    //멤버 관련 메서드
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

    //관리자 페이지 회원수정 및 정지
    public void AdminUpdate(MemberVO vo) throws Exception;
    //관리자 페이지 회원정보 상세보기
    public MemberVO AdminView(String userId);
    //관리자 페이지 회원 삭제
    public void AdminDelete(String userId);
}
