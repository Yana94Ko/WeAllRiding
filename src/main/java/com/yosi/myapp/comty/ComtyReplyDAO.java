package com.yosi.myapp.comty;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ComtyReplyDAO {

	// 댓글등록
	public int comtyReplyWrite(ComtyReplyVO vo);
	
	// 댓글 목록
	public List<ComtyReplyVO> comtyReplyList(int comtyNo);
	
	// 댓글 수정
	public int comtyReplyEdit(ComtyReplyVO vo);
	
	// 댓글 삭제
	public int comtyReplyDel(int comtyReplyNo, String nickname);
}
