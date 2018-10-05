package shop_member.controller;
// Controller

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop_member.bean.Shop_memberDTO;

@Controller
public class Shop_memberController {
	
	@Autowired
	private Shop_memberServiceImpl memberService;
	
	
	// 메인페이지
	@RequestMapping(value="/main/index")
	public ModelAndView index(HttpServletRequest request) {	// 파일 이름과 함수 이름 같게 수정할 것
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/main/index.jsp");
		return modelAndView;
	}
	
	// 로그인 화면
	@RequestMapping(value="/shop_member/loginForm")
	public ModelAndView LoginForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/index.jsp?req=loginForm");
		return modelAndView;
	}
	// 로그인
	@RequestMapping(value="/shop_member/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView modelAndView) {
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("member_passwd");
		String name = memberService.loginShopMember(id, pwd);
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", id);
			session.setAttribute("member_name", name);
			modelAndView.setViewName("redirect:../main/index.jsp");
		} else {
			modelAndView.setViewName("/main/index.jsp?req=loginForm");
		}
		
		return modelAndView;
	}
	// 로그아웃
	@RequestMapping(value="/shop_member/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView modelAndView) {
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		modelAndView.setViewName("redirect:../main/index.jsp");
		return modelAndView;
	}
	
	// 회원가입 폼
	@RequestMapping(value="/shop_member/joinForm")
	public ModelAndView joinForm(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=joinForm");
		return modelAndView;
	}
	
	// 회원가입
	@RequestMapping(value="/shop_member/join")
	public ModelAndView join(HttpServletRequest request, ModelAndView modelAndView) {
		Shop_memberDTO shop_memberDTO = new Shop_memberDTO();
		shop_memberDTO.setId(request.getParameter("id"));
		shop_memberDTO.setPwd(request.getParameter("pwd"));
		shop_memberDTO.setPwd_chk_q(request.getParameter("pwd_chk_q"));
		shop_memberDTO.setPwd_chk_a(request.getParameter("pwd_chk_a"));
		shop_memberDTO.setName(request.getParameter("name"));
		shop_memberDTO.setAddr1(request.getParameter("addr1"));
		shop_memberDTO.setAddr2(request.getParameter("addr2"));
		shop_memberDTO.setTel1(request.getParameter("tel1"));
		shop_memberDTO.setTel2(request.getParameter("tel2"));
		shop_memberDTO.setTel3(request.getParameter("tel3"));
		shop_memberDTO.setPhone1(request.getParameter("phone1"));
		shop_memberDTO.setPhone2(request.getParameter("phone2"));
		shop_memberDTO.setPhone3(request.getParameter("phone3"));
		shop_memberDTO.setEmail1(request.getParameter("email1"));
		shop_memberDTO.setEmail2(request.getParameter("email2"));
		shop_memberDTO.setGender(request.getParameter("gender"));
		shop_memberDTO.setBirth_year(request.getParameter("birth_year"));
		shop_memberDTO.setBirth_month(request.getParameter("birth_month"));
		shop_memberDTO.setBirth_day(request.getParameter("birth_day"));
		shop_memberDTO.setBirth_solar_lunar(request.getParameter("birth_solar_lunar"));
		shop_memberDTO.setJob(request.getParameter("job"));
		shop_memberDTO.setAccounter(request.getParameter("accounter"));
		shop_memberDTO.setBank_name(request.getParameter("bank_name"));
		shop_memberDTO.setAccount_num(request.getParameter("account_num"));
		int result = memberService.insertShopMember(shop_memberDTO);
		if(result > 0) modelAndView.setViewName("redirect:../main/index.jsp");
		else modelAndView.setViewName("/main/index.jsp?req=joinForm");
//		if(result > 0) modelAndView.setViewName("/main/index?req=joinOk");
//		else modelAndView.setViewName("/main/index?req=joinFail");	
		return modelAndView;
	}
	
	// 마이페이지
	@RequestMapping(value="/shop_member/myPage")
	public ModelAndView myPage(HttpServletRequest request, ModelAndView modelAndView) {
		modelAndView.setViewName("/main/index.jsp?req=myPage");
		return modelAndView;
	}
	
	
	
}
