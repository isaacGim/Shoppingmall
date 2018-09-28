package shop_member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop_member.bean.Shop_memberDTO;
import shop_member.dao.Shop_memberDAO;

@Service
public class Shop_memberServiceImpl implements Shop_memberService {

	@Autowired
	private Shop_memberDAO shop_memberDAO;
	
	// 회원가입
	@Override
	public int insertShopMember(Shop_memberDTO shop_memberDTO) {
		return shop_memberDAO.insert(shop_memberDTO);
	}

	// 회원탈퇴
	@Override
	public int deleteShopMember(String id) {
		return shop_memberDAO.delete(id);
	}

	// 회원정보 수정
	@Override
	public int updateShopMember(Shop_memberDTO shop_memberDTO) {
		return shop_memberDAO.update(shop_memberDTO);
	}

	// 회원정보 하나 얻어오기
	@Override
	public Shop_memberDTO getShopMember(Shop_memberDTO shop_memberDTO) {
		return shop_memberDAO.getShopMember(shop_memberDTO);
	}

	// 아이디 중복확인
	@Override
	public boolean isExistId(String id) {
		return shop_memberDAO.isExistId(id);
	}

	// 로그인
	@Override
	public String loginShopMember(String id, String pwd) {
		return shop_memberDAO.login(id, pwd);
	}

}
