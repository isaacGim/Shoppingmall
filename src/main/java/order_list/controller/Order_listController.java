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

		modelAndView.setViewName("/main/index.jsp?req=cartList");
		return modelAndView;
	}
	
}
