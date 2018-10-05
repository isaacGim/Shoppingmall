package board_qna.controller;

import java.util.List;

import board_qna.bean.Board_qnaDTO;

public interface Board_qnaService {
	// qna 글 쓰기
	public int insertQna(Board_qnaDTO board_qnaDTO);	
	// qna 글 수정
	public int updateQna(Board_qnaDTO board_qnaDTO);
	// qna 글 삭제
	public int deleteQna(int board_qna_num);
	// re_seq update
	public int updateQna_reSeq(int board_qna_ref, int board_qna_seq);
	// Q&A 게시판 목록 보기
	public List<Board_qnaDTO> qnaList(int startNum, int endNum);
	// 글 상세보기
	public Board_qnaDTO qnaView(int board_qna_num);
	// 총 글 수 얻어오기
	public int getQnaTotalA();
}
