package com.yosi.myapp.riding;

import java.util.List;

public interface RidingReplyService {
	//댓글등록
	public int ridingReplyWrite(RidingReplyVO vo);
	//댓글목록
	public List<RidingReplyVO> ridingReplyList(int ridingNo);
	//댓글수정
	public int ridingReplyEdit(RidingReplyVO vo);
	//댓글삭제
	public int ridingReplyDel(int ridingReplyNo, String nickname);
}
