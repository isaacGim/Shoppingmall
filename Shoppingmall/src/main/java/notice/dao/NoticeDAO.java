package notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import notice.bean.NoticeDTO;

@Repository 
public class NoticeDAO {	// 공지사항
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	/** Mybatis로 데이터 주입 */
	// 글 쓰기
	public int insert(NoticeDTO noticeDTO) {
		return sqlSession.insert("mybatis.board.insertNotice", noticeDTO);
	}
	
	// 글 삭제
	public int delete(int notice_num) {
		return sqlSession.insert("mybatis.board.deleteNotice", notice_num);
	}
	
	// 글 수정
	public int update(NoticeDTO noticeDTO) {
		return sqlSession.update("mybatis.board.updateNotice", noticeDTO);
	}
	
	// 조회수 증가 시키기 
	public int updateHit(int notice_num) {
		return sqlSession.update("mybatis.board.updateNoticeHit", notice_num);
	}
	
	// 글 불러오기
	public NoticeDTO noticeView(int notice_num) {
		return sqlSession.selectOne("mybatis.board.noticeView", notice_num);
	}
	
	// 공지사항 게시판 목록 보기
	public List<NoticeDTO> noticeList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.board.noticeList", map);
		
	}
	
	// 공지사항 총 글 수 얻어오기
	public int getNoticeTotalA () {
		return sqlSession.selectOne("mybatis.board.getNoticeTotalA");
	}
	
	
}
