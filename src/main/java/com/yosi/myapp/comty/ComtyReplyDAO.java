package com.yosi.myapp.comty;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ComtyReplyDAO {
	/*
	 * // 댓글 목록 조회 public List<ComtyReplyVO> comtyReplyList(int comtyNo) throws
	 * Exception;
	 */

	//댓글등록
	public int comtyReplyWrite(ComtyReplyVO vo);
	//댓글목록
	public List<ComtyReplyVO> comtyReplyList(int comtyNo);
	//댓글수정
	public int comtyReplyEdit(ComtyReplyVO vo);
	//댓글삭제
	public int comtyReplyDel(int comtyReplyNo, String nickname);
}