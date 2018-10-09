package review.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import review.bean.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewServiceImpl reviewService;
	
	@RequestMapping("/review/reviewList")
	public ModelAndView reviewList(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int startNum = 20 * (pg - 1) + 1;
		int endNum = startNum + 19;
		List<ReviewDTO> list = reviewService.reviewList(startNum, endNum);
		
		int count = reviewService.getReviewTotalA();
		int totalPage = (count + 19) / 20;
		int startPage = (pg - 1) / 5 * 5 + 1;
		int endPage = startPage + 4;
		if(endPage > totalPage) endPage = totalPage;
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("/main/index.jsp?req=reviewList");
		return modelAndView;
	}
	
	@RequestMapping("/review/reviewView")
	public ModelAndView reviewView(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int review_num=Integer.parseInt(request.getParameter("no"));
		
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO = reviewService.reviewView(review_num);
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("reviewDTO", reviewDTO);
		modelAndView.setViewName("/main/index.jsp?req=reviewView");
		return modelAndView;
		
	}
	
	@RequestMapping("/review/reviewWrite")
	public ModelAndView reviewWrite(HttpServletRequest request, ModelAndView modelAndView, MultipartFile image, ReviewDTO reviewDTO) {
		String filePath = "G:\\java_web_4\\share\\Shoppingmall-master\\Shoppingmall\\src\\main\\webapp\\storage";
							
		String FileName = image.getOriginalFilename();
		
		File file = new File(filePath, FileName);
		
		try {
			FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		String review_subject = request.getParameter("subject");
		String review_grade = request.getParameter("point");
		String review_content = request.getParameter("content");
		String password = request.getParameter("password");
		
		reviewDTO.setReview_subject(review_subject);
		reviewDTO.setReview_grade(review_grade);
		reviewDTO.setReview_content(review_content);
		reviewDTO.setReview_img(FileName);
		reviewDTO.setReview_writer("1");
		reviewDTO.setReview_ref(0);
		reviewDTO.setReview_lev(0);
		reviewDTO.setReview_seq(0);
		
		int result = reviewService.insertReview(reviewDTO); 
		modelAndView.addObject("password", password);
		modelAndView.addObject("result", result);
		
		modelAndView.setViewName("/main/index.jsp?req=reviewWrite");
		
		return modelAndView;
		
	}
	
	@RequestMapping("/review/reviewWriteForm")
	public ModelAndView reviewWriteForm(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=reviewWriteForm");
		return modelAndView;
	}
	
	@RequestMapping("/review/reviewDelete")
	public ModelAndView reviewDelete(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int review_num=Integer.parseInt(request.getParameter("no"));
		
		int result = reviewService.deleteReview(review_num);
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("/main/index.jsp?req=reviewDelete");
		return modelAndView;
		
	}
	
	@RequestMapping("/review/reviewModifyForm")
	public ModelAndView reviewModifyForm(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int review_num=Integer.parseInt(request.getParameter("no"));
		
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO = reviewService.reviewView(review_num);
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("reviewDTO", reviewDTO);
		modelAndView.setViewName("/main/index.jsp?req=reviewModifyForm");
		return modelAndView;
		
	}
	
	@RequestMapping("/review/reviewModify")
	public ModelAndView reviewModify(HttpServletRequest request, ModelAndView modelAndView, MultipartFile image, ReviewDTO reviewDTO) {
		
		String filePath = "G:\\java_web_4\\share\\Shoppingmall-master\\Shoppingmall\\src\\main\\webapp\\storage";
		
		String FileName = image.getOriginalFilename();
		
		File file = new File(filePath, FileName);
		
		try {
			FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int review_num=Integer.parseInt(request.getParameter("review_num"));
		String review_subject = request.getParameter("subject");
		String review_content = request.getParameter("content");
		String review_grade = request.getParameter("point");
		String imgDelete = request.getParameter("imgDelete");
		
		String password = request.getParameter("password");
		
		if(imgDelete != null) {
			reviewService.updateReviewImage(review_num);
		}
		
		reviewDTO.setReview_subject(review_subject);
		reviewDTO.setReview_grade(review_grade);
		reviewDTO.setReview_content(review_content);
		reviewDTO.setReview_img(FileName);
		reviewDTO.setReview_num(review_num);
		
		int result = reviewService.updateReview(reviewDTO);
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("review_num", review_num);
		modelAndView.addObject("result", result);
		modelAndView.addObject("password", password);
		modelAndView.setViewName("/main/index.jsp?req=reviewModify");
		return modelAndView;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
