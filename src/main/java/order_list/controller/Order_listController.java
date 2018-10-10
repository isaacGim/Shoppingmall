package order_list.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Order_listController {

	@Autowired
	private Order_listServiceImpl order_listService;
	
	// 카트...
	@RequestMapping(value="/order_list/cartList")
	public ModelAndView cartList(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("cartList");
		
		// 장바구니 담을 정보 가져오기
		String item_name = request.getParameter("item_name");
		String item_code = request.getParameter("item_code");
		int item_price = Integer.parseInt(request.getParameter("item_price"));
		String item_color = request.getParameter("item_color");
		String item_size = request.getParameter("item_size");
		int item_qty = Integer.parseInt(request.getParameter("item_qty"));
		int total_price = item_price * item_qty;
		
		System.out.println("---");
		System.out.println("item_name : "+ item_name);
		System.out.println("item_code : "+ item_code);
		System.out.println("item_price : "+ item_price);
		System.out.println("item_color : "+ item_color);
		System.out.println("item_size : "+ item_size);
		System.out.println("item_qty : "+ item_qty);
		System.out.println("total_price : "+ total_price);
		
		
		modelAndView.setViewName("/main/index.jsp?req=cartList");
		return modelAndView;
	}
	
}
