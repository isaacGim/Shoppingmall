package notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import notice.bean.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeServiceImpl noticeService;
	
	// 공지사항 목록
	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int startNum = 20 * (pg - 1) + 1;
		int endNum = startNum + 19;
		List<NoticeDTO> list = noticeService.noticeList(startNum, endNum);
		
		int count = noticeService.getNoticeTotalA();
		int totalPage = (count + 19) / 20;
		int startPage = (pg - 1) / 5 * 5 + 1;
		int endPage = startPage + 4;
		if(endPage > totalPage) endPage = totalPage;
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("pg", pg);

		modelAndView.setViewName("/main/index.jsp?req=noticeList");
		return modelAndView;
	}
	// 공지사항 보기
	@RequestMapping("/notice/noticeView")
	public ModelAndView noticeView(HttpServletRequest request, ModelAndView modelAndView) {

		int notice_num = Integer.parseInt(request.getParameter("no"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO = noticeService.noticeView(notice_num);
		noticeService.updateHit(notice_num);
		
		// 이전 글
		int prev = notice_num + 1;
		NoticeDTO prevNoticeDTO = new NoticeDTO();
		prevNoticeDTO = noticeService.noticeView(prev);
		
		// 다음 글
		int next = notice_num - 1;
		NoticeDTO nextNoticeDTO = new NoticeDTO();
		nextNoticeDTO = noticeService.noticeView(next);
		
		modelAndView.addObject("prevNoticeDTO", prevNoticeDTO);	// 이전 글	
		modelAndView.addObject("nextNoticeDTO", nextNoticeDTO);	// 다음 글	
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("noticeDTO", noticeDTO);
		modelAndView.setViewName("/main/index.jsp?req=noticeView");
		return modelAndView;
	}
	// 공지사항 글 쓰기
	@RequestMapping("/notice/noticeWriteForm")
	public ModelAndView noticeWriteForm(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=noticeWriteForm");
		return modelAndView;
	}
	// 공지사항 글 등록
	@RequestMapping("/notice/noticeWrite")
	public ModelAndView noticeWrite(HttpServletRequest request, ModelAndView modelAndView) {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNotice_hit(Integer.parseInt(request.getParameter("hit")));
		noticeDTO.setNotice_subject(request.getParameter("subject"));
		noticeDTO.setNotice_writer(request.getParameter("name"));
		noticeDTO.setNotice_content(request.getParameter("content"));
		int result = noticeService.insert(noticeDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/main/index.jsp?req=noticeWrite");
		return modelAndView;
	}
}
