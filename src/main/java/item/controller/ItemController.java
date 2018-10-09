package item.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import item.bean.ItemDTO;

@Controller
public class ItemController {
	
	@Autowired
	private ItemServiceImpl itemservice;
	// 관리자 페이지 리스트
	@RequestMapping(value="/admin/adminList")
	public ModelAndView adminList(HttpServletRequest request, ModelAndView modelAndView) {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int startNum = 20 * (pg - 1) + 1;
		int endNum = startNum + 19;
		List<ItemDTO> list = itemservice.getAdminItemsList(startNum, endNum);
		
		int count = itemservice.getItemsCount();
		int totalPage = (count + 19) / 20;
		int startPage = (pg - 1) / 5 * 5 + 1;
		int endPage = startPage + 4;
		if(endPage > totalPage) endPage = totalPage;
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalPage", totalPage);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("/main/index.jsp?req=adminList");
		return modelAndView;
	}
	
	// 상품 등록 폼 화면
	@RequestMapping(value="/admin/insertForm") 
	public ModelAndView insertForm(ModelAndView modelAndView) {
		
		modelAndView.setViewName("/main/index.jsp?req=insertForm");
		return modelAndView;
	}
	
	// 상품 등록 데이터 저장
	@RequestMapping(value="/admin/insertItem", method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, ModelAndView modelAndView,
			MultipartFile item_img1, MultipartFile item_detail_img1) {
		// 파일처리할 경로
		String filePath = 
				//"C:\\Users\\user\\git\\Shoppingmall\\Shoppingmall\\src\\main\\webapp\\storage";
				//"E:\\java_web_4\\spring\\workspace\\Shoppingmall\\src\\main\\webapp\\storage";
		"C:\\Users\\isaac\\Desktop\\Shoppingmall\\src\\main\\webapp\\storage";
		// 파일 이름
		String fileName1 = item_img1.getOriginalFilename();
		String fileName2 = item_detail_img1.getOriginalFilename();
		
		// 파일 경로 + 파일 이름 (1,2)
		File file1 = new File(filePath, fileName1);
		File file2 = new File(filePath, fileName2);
		
		try {
			FileCopyUtils.copy(item_img1.getInputStream(), new FileOutputStream(file1));
			FileCopyUtils.copy(item_detail_img1.getInputStream(), new FileOutputStream(file2));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 사용자 입력 정보 추출
		ItemDTO itemDTO = new ItemDTO();
		itemDTO.setItem_code(request.getParameter("item_code"));
		itemDTO.setItem_category(request.getParameter("item_category"));
		itemDTO.setItem_detail_category(request.getParameter("item_detail_category"));
		itemDTO.setItem_name(request.getParameter("item_name"));
		itemDTO.setItem_img(fileName1);
		itemDTO.setItem_detail_img(fileName2);
		itemDTO.setItem_content(request.getParameter("item_content"));
		itemDTO.setItem_brand(request.getParameter("item_brand"));
		itemDTO.setItem_price(Integer.parseInt(request.getParameter("item_price")));
		itemDTO.setItem_quantity(Integer.parseInt(request.getParameter("item_quantity")));
		itemDTO.setItem_color(request.getParameter("item_color"));
		itemDTO.setItem_size(request.getParameter("item_size"));
		// DB 연동
		int result = itemservice.insertItem(itemDTO);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/main/index.jsp?req=insertItem");
		return modelAndView;
	}
	// 관리자 페이지 리스트 삭제
	@RequestMapping(value="/admin/deleteItem", method=RequestMethod.POST)
	public void delete(HttpServletRequest request, @RequestBody List<String> indexArray) {
		
		for(String index : indexArray) {
			System.out.println(index);
			itemservice.deleteItemByIndex(Integer.parseInt(index));
		}
	}
	//////////////////////////////////////////
	// 사용자 아이템 리스트 [대분류 + 소분류]
	@RequestMapping(value="/item/itemCategoryList") 
		public ModelAndView itemCategoryList(HttpServletRequest request, ModelAndView modelAndView) {

		
		int pg = Integer.parseInt(request.getParameter("pg"));
		String category = request.getParameter("category");	// 대분류
		String item_detail_category = request.getParameter("detail_category"); // 소분류
		
		// 대분류
		if(category != null && item_detail_category == "" ) {
			List<ItemDTO> list = itemservice.getItemsByCategory(category);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/main/index.jsp?req=" + category);
			System.out.println("대분류 category="+category);
		
			// 소분류
		} else if(item_detail_category != null && category != null) {
			List<ItemDTO> list = itemservice.getItemsByDetailCategory(category, item_detail_category);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/main/index.jsp?req=" + category + "&sub=" + item_detail_category);	
			System.out.println("대분류="+category+" 소분류=" + item_detail_category);
		}	
		
		
		modelAndView.addObject("pg", pg);
		return modelAndView;
	}
	// 사용자 아이템 리스트 [카테고리 대분류 + 소분류]
	@RequestMapping(value="/item/itemDetailCategoryList")
	public ModelAndView itemDetailCategoryList (HttpServletRequest request, ModelAndView modelAndView) {
		String item_category = request.getParameter("category");
		String item_detail_category = request.getParameter("detail_category");	
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		List<ItemDTO> list = itemservice.getItemsByDetailCategory(item_category, item_detail_category);
		
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		
		modelAndView.setViewName("/main/index.jsp?req="+ item_detail_category);
		return modelAndView;
	}
	// 아이템 상세보기
	@RequestMapping(value="/item/itemView")
	public ModelAndView itemView (HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("view 실행");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		String item_name = request.getParameter("item_name");
		
		System.out.println("pg="+pg);
		System.out.println("item_name="+item_name);
		
		
		
		ItemDTO itemDTO = new ItemDTO();
		itemDTO = itemservice.getItem(item_name);
		
		modelAndView.addObject("pg",pg);
		modelAndView.addObject("itemDTO", itemDTO);
		modelAndView.setViewName("/main/index.jsp?req=itemView");
		return modelAndView;
	}
}
