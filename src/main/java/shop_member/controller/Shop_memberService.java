package shop_member.controller;

import shop_member.bean.Shop_memberDTO;

public interface Shop_memberService {
	
	// 회원 가입
	public int insertShopMember(Shop_memberDTO shop_memberDTO);
	// 회원 탈퇴
	public int deleteShopMember(String id);
	// 회원 정보 수정
	public int updateShopMember(Shop_memberDTO shop_memberDTO);
	// 회원정보 불러오기
	public Shop_memberDTO getShopMember(Shop_memberDTO shop_memberDTO);
	
	
	// 아이디 중복 확인
	public boolean isExistId(String id);
	// 로그인
	public String loginShopMember(String id, String pwd);

}
