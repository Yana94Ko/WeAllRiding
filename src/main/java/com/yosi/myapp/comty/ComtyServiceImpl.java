package com.yosi.myapp.comty;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.yosi.myapp.PagingVO;
@Service
public class ComtyServiceImpl implements ComtyService {
	@Inject
	ComtyDAO dao;
	@Override
	public List<ComtyVO> allSelect(PagingVO pVO) {
		return dao.allSelect(pVO);
	}
	@Override
	public int comtyInsert(ComtyVO vo) {
		return dao.comtyInsert(vo);
	}
	@Override
	public ComtyVO comtySelect(int comtyNo) {
		return dao.comtySelect(comtyNo);
	}
	@Override
	public int comtyUpdate(ComtyVO vo) {
		return dao.comtyUpdate(vo);
	}
	@Override
	public int comtyDelete(int comtyNo, String nickname) {
		return dao.comtyDelete(comtyNo, nickname);
	}
	@Override
	public void hitCount(int comtyNo) {
		// TODO Auto-generated method stub
	}
	public void cntHit(int comtyNo) {
		dao.cntHit(comtyNo);
	}
	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	//관리자 페이지 커뮤니티 글 목록
	@Override
	public List<ComtyVO> comtyList() {
		return dao.comtyList();
	}

}