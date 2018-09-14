package board_qna.dao;

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
	public int insert(Board_qnaDTO board_qnaDTO) {
		return sqlSession.insert("mybatis.board.insertQna", board_qnaDTO);
	}
	// qna 글 수정
	public int update(Board_qnaDTO board_qnaDTO) {
		return sqlSession.update("mybatis.board.updateQna", board_qnaDTO);
	}
	// qna 글 삭제
	public int delete(int board_qna_num) {
		return sqlSession.delete("mybatis.board.deleteQna", board_qna_num);
	}
	
	// re seq 값 증가
	
	// 게시판 목록 보기
	
	// 글 상세보기
	
	// 총 글 수 얻어오기
	
}
