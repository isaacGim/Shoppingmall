package board_qna.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board_qna.bean.Board_qnaDTO;

@Controller
public class Board_qnaController {
	
	@Autowired
	Board_qnaServiceImpl board_qnaService;
	
	// Qna 목록 보기
	@RequestMapping(value="/qna/qnaList")
	public ModelAndView qnalist(HttpServletRequest request, ModelAndView modelAndView) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int startNum = 20 * (pg - 1) + 1;
		int endNum = startNum + 19;
		List<Board_qnaDTO> list = board_qnaService.qnaList(startNum, endNum);
		
		int count = board_qnaService.getQnaTotalA();
		int totalPage = (count + 19) / 20;
		int startPage = (pg - 1) / 5 * 5 + 1;
		int endPage = startPage + 4;
		if(endPage > totalPage) endPage = totalPage;
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("pg", pg);

		modelAndView.setViewName("/main/index.jsp?req=qnaList");
		return modelAndView;
	}
	
	// Qna 글쓰기 폼
	@RequestMapping(value="/qna/qnaWriteForm")
	public ModelAndView qnaWriteForm(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=qnaWriteForm");
		return modelAndView;
	}
	
	// Qna 글쓰기 등록 처리
	@RequestMapping(value="/qna/qnaWrite")
	public ModelAndView qnaWrite(HttpServletRequest request, ModelAndView modelAndView,
			MultipartFile file) {
		
		// 파일 경로
		String filePath =
			"C:\\Users\\user\\git\\Shoppingmall\\Shoppingmall\\src\\main\\webapp\\storage";
		// 파일이름
		String fileName1 = file.getOriginalFilename();
		
		// 파일 경로 + 파일 이름
		File file1 = new File(filePath, fileName1);
		
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file1));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 사용자 입력 정보 추출
		Board_qnaDTO board_qnaDTO = new Board_qnaDTO();
		board_qnaDTO.setBoard_qna_subject(request.getParameter("subject"));
		board_qnaDTO.setBoard_qna_content(request.getParameter("content"));
		board_qnaDTO.setBoard_qna_img(fileName1);
		board_qnaDTO.setBoard_qna_writer(request.getParameter("writer"));
		board_qnaDTO.setBoard_qna_pwd(request.getParameter("password"));
		int result = board_qnaService.insertQna(board_qnaDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/main/index.jsp?req=qnaWrite");
		return modelAndView;
	}
	// qna 보기
	@RequestMapping(value="/qna/qnaView")
	public ModelAndView qnaView(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int no = Integer.parseInt(request.getParameter("no"));
		
		Board_qnaDTO board_qnaDTO = board_qnaService.qnaView(no);
		int ref = board_qnaDTO.getBoard_qna_ref();
		List<Board_qnaDTO> list = board_qnaService.re_qnaList(ref);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("no", no);
		modelAndView.addObject("board_qnaDTO", board_qnaDTO);
		modelAndView.setViewName("/main/index.jsp?req=qnaView");
		return modelAndView;
	}
	// qna 삭제하기
	@Transactional
	@RequestMapping(value="/qna/qnaDelete")
	public ModelAndView qnaDelete(HttpServletRequest request, ModelAndView modelAndView) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int num = Integer.parseInt(request.getParameter("num"));
		Board_qnaDTO board_qnaDTO = board_qnaService.qnaView(num);
		int ref = board_qnaDTO.getBoard_qna_ref();
		
		board_qnaService.deleteQna(num);
		board_qnaService.deleteQna_reply(ref);
		
		modelAndView.setViewName("/qna/qnaList?pg="+pg);
		return modelAndView;
	}
	// qna 댓글 등록하기
	@Transactional
	@RequestMapping(value="/qna/qnaComment")
	public ModelAndView qnaComment(HttpServletRequest request, ModelAndView modelAndView) {
		Board_qnaDTO board_qnaDTO = new Board_qnaDTO();
		
		// 코멘트를 받아온다
		int pg = Integer.parseInt(request.getParameter("pg"));
		String comment = request.getParameter("comment");
		String board_qna_writer = request.getParameter("board_qna_writer");
		
		System.out.println("comment=" + comment);
		
		String str_no = request.getParameter("no");
		String str_no1 = request.getParameter("no1");
		
		// 원글 DTO를 가져온다.
		if ( str_no != null ) {
			int no = Integer.parseInt(str_no);
			board_qnaDTO = board_qnaService.qnaView(no);
			modelAndView.setViewName("redirect:/qna/qnaView?no=" + no + "&pg=" + pg);
		}
		
		if ( str_no1 != null ) {
			int no1 = Integer.parseInt(str_no1);
			board_qnaDTO = board_qnaService.qnaView(no1);
			modelAndView.setViewName("redirect:/qna/qnaView?no=" + no1 + "&pg=" + pg);
		}

		
		//원글 DTO의 REF/LEV/SEQ를 가져온다.
		int ref = board_qnaDTO.getBoard_qna_ref();
		int lev = board_qnaDTO.getBoard_qna_lev();
		int seq = board_qnaDTO.getBoard_qna_seq();
		System.out.println(seq);
		//댓글 DTO를 삽입하기 위에 REF/LEV/SEQ를 조작하고 UPDATE를 한다.
		int re_lev = lev + 1;
		int re_seq = seq + 1;
		board_qnaService.updateQna_reSeq(ref, re_seq);
		//댓글 DTO를 삽입한다.
		Board_qnaDTO re_board_qnaDTO = new Board_qnaDTO();
		re_board_qnaDTO.setBoard_qna_subject("reply");
		re_board_qnaDTO.setBoard_qna_content(comment);
		re_board_qnaDTO.setBoard_qna_img("reply");
		re_board_qnaDTO.setBoard_qna_writer(board_qna_writer);
		re_board_qnaDTO.setBoard_qna_ref(ref);
		re_board_qnaDTO.setBoard_qna_lev(re_lev);
		re_board_qnaDTO.setBoard_qna_seq(re_seq);
		board_qnaService.insert_reSeq(re_board_qnaDTO);
		//정렬한 댓글들 리스트 가져오기
		List<Board_qnaDTO> list = board_qnaService.re_qnaList(ref);		
		modelAndView.addObject("list", list);
		
		
		return modelAndView;
	}
}
