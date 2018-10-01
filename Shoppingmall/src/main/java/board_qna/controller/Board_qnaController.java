package board_qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("test");
		return modelAndView;
	}
	
}
