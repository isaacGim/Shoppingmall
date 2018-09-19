package shop_member.controller;
// Controller

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Shop_memberController {
	
	@Autowired
	private Shop_memberServiceImpl memberService;
	
	@RequestMapping(value="/main/index")
	public ModelAndView index(HttpServletRequest request) {	// 파일 이름과 함수 이름 같게 수정할 것
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:../main/index.jsp");
		return modelAndView;
	}
	
	// 로그인 화면
	@RequestMapping(value="/Shop_member/loginForm.do")
	public ModelAndView LoginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../shop_member/loginForm.jsp");
		return modelAndView;
	}
	
}
