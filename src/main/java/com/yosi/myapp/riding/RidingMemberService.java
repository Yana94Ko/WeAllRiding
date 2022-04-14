package com.yosi.myapp.riding;

import java.util.List;

public interface RidingMemberService {
	// 댓글등록
	public int ridingMemberWrite(RidingMemberVO vo);
		
	// 댓글 목록
	public List<RidingMemberVO> ridingMemberList(int ridingNo);
			
	// 댓글 삭제
	public int ridingMemberDel(int ridingMemberNo, String nickname);	
}
