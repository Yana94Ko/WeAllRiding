package com.yosi.myapp.member;

import com.yosi.myapp.aMemberPagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);

    //관리자 페이지 회원목록
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

    public int ScoreUpdate(String nickname, int score);

}
