package item.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
				"C:\\Users\\user\\git\\Shoppingmall\\Shoppingmall\\src\\main\\webapp\\storage";
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
	
	@RequestMapping(value="/admin/deleteItem", method=RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request, ModelAndView modelAndView, 
			@RequestBody String[] indexArray) {
//		String[] indexArray = (String[])request.getParameter("indexArray");
//		int result = itemservice.deleteItemByIndex(index);
//		System.out.println(index);
		for(String index : indexArray) System.out.println(index);
		modelAndView.setViewName("/admin/adminList?pg=1");
		return modelAndView;
	}
}
