package board_qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board_qna.bean.Board_qnaDTO;
import board_qna.dao.Board_qnaDAO;

@Service
public class Board_qnaServiceImpl implements Board_qnaService {

	@Autowired
	Board_qnaDAO board_qnaDAO;
	
	@Override
	public int insertQna(Board_qnaDTO board_qnaDTO) {
		return board_qnaDAO.insertQna(board_qnaDTO);
	}

	@Override
	public int updateQna(Board_qnaDTO board_qnaDTO) {
		return board_qnaDAO.updateQna(board_qnaDTO);
	}

	@Override
	public int deleteQna(int board_qna_num) {
		return board_qnaDAO.deleteQna(board_qna_num);
	}

	@Override
	public int updateQna_reSeq(int board_qna_ref, int board_qna_seq) {
		return board_qnaDAO.updateQna_reSeq(board_qna_ref, board_qna_seq);
	}

	@Override
	public List<Board_qnaDTO> qnaList(int startNum, int endNum) {
		return board_qnaDAO.qnaList(startNum, endNum);
	}

	@Override
	public Board_qnaDTO qnaView(int board_qna_num) {
		return board_qnaDAO.qnaView(board_qna_num);
	}

	@Override
	public int getQnaTotalA() {
		return board_qnaDAO.getQnaTotalA();
	}

	@Override
	public List<Board_qnaDTO> re_qnaList(int board_qna_ref) {
		return board_qnaDAO.re_qnaList(board_qna_ref);
	}

	@Override
	public int insert_reSeq(Board_qnaDTO board_qnaDTO) {
		return board_qnaDAO.insert_reSeq(board_qnaDTO);
	}

	@Override
	public int deleteQna_reply(int board_qna_ref) {
		return board_qnaDAO.deleteQna_reply(board_qna_ref);
	}
	

}
