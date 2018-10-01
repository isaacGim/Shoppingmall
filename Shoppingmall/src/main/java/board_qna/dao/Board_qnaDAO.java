package board_qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board_qna.bean.Board_qnaDTO;

@Repository
public class Board_qnaDAO { // qna
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	/** Mybatis로 데이터 주입 */
	// qna 글 쓰기
	public int insertQna(Board_qnaDTO board_qnaDTO) {
		return sqlSession.insert("mybatis.board.insertQna", board_qnaDTO);
	}
	// qna 글 수정
	public int updateQna(Board_qnaDTO board_qnaDTO) {
		return sqlSession.update("mybatis.board.updateQna", board_qnaDTO);
	}
	// qna 글 삭제
	public int deleteQna(int board_qna_num) {
		return sqlSession.delete("mybatis.board.deleteQna", board_qna_num);
	}
	
	// re_seq update
	public int updateQna_reSeq(int board_qna_ref, int board_qna_seq) {
		Map<String, Integer> map = new HashMap<>();
		map.put(String.valueOf(board_qna_ref), board_qna_seq);
		return sqlSession.update("mybatis.board.updateQna_reSeq", map);
	}
	
	// Q&A 게시판 목록 보기
	public List<Board_qnaDTO> qnaList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.board.qnaList", map);
	}
	// 글 상세보기
	public Board_qnaDTO qnaView(int board_qna_num) {
		return sqlSession.selectOne("mybatis.board.qnaView", board_qna_num);
	}
	
	// 총 글 수 얻어오기
	public int getQnaTotalA () {
		return sqlSession.selectOne("mybatis.board.getQnaTotalA");
	}
	
}
