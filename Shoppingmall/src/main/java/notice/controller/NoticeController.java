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
	
	
}
